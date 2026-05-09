import { getPresetAvatar } from '../lib/avatars'
import { getPreferenceTags, setPreferenceTags } from './preferenceStore'
import { getSupabaseBrowserClient } from './supabaseBrowserClient'

const AVATAR_MAX_BYTES = 512 * 1024
const AVATAR_MAX_DIMENSION = 512
const AVATAR_ALLOWED_TYPES = ['image/jpeg', 'image/png', 'image/webp', 'image/gif']

export type AppUserProfile = {
  avatarPreset: string
  avatarType: 'preset' | 'custom'
  avatarUrl: string
  displayName: string
  id: string
  preferences: string[]
}

function normalizeProfile(row: Record<string, unknown>): AppUserProfile {
  const displayName = row.displayName ?? row.display_name
  const avatarType = row.avatarType ?? row.avatar_type
  const avatarPreset = row.avatarPreset ?? row.avatar_preset
  const avatarUrl = row.avatarUrl ?? row.avatar_url
  return {
    id: String(row.id),
    displayName: String(displayName || 'ZJU student'),
    avatarType: avatarType === 'custom' ? 'custom' : 'preset',
    avatarPreset: String(avatarPreset || 'rice'),
    avatarUrl: String(avatarUrl || ''),
    preferences: Array.isArray(row.preferences) ? row.preferences.filter((tag): tag is string => typeof tag === 'string') : []
  }
}

async function getAccessToken() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')
  const { data, error } = await client.auth.getSession()
  if (error) throw error
  if (!data.session?.access_token) throw new Error('Please sign in first')
  return data.session.access_token
}

async function requestProfileApi<T>(path: string, options: RequestInit = {}) {
  const token = await getAccessToken()
  const response = await fetch(path, {
    ...options,
    headers: {
      accept: 'application/json',
      Authorization: `Bearer ${token}`,
      ...(options.body ? { 'Content-Type': 'application/json' } : {}),
      ...options.headers
    }
  })
  const body = await response.json().catch(() => ({})) as { error?: string } & T
  if (!response.ok) throw new Error(body.error || `Profile API returned ${response.status}`)
  return body
}

export async function ensureAppUserProfile() {
  const client = getSupabaseBrowserClient()
  if (!client) return null

  const body = await requestProfileApi<{ profile: Record<string, unknown> }>('/api/profile')
  const profile = normalizeProfile(body.profile)
  if (profile.preferences.length) setPreferenceTags(profile.preferences)
  return profile
}

export async function updateAppUserProfile(profile: Partial<Pick<AppUserProfile, 'avatarPreset' | 'avatarType' | 'avatarUrl' | 'displayName' | 'preferences'>>) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  if (!Object.keys(profile).length) throw new Error('没有需要保存的资料变化')

  const body = await requestProfileApi<{ profile: Record<string, unknown> }>('/api/profile', {
    method: 'PATCH',
    body: JSON.stringify(profile)
  })
  const next = normalizeProfile(body.profile)
  setPreferenceTags(next.preferences)
  return next
}

async function readFileAsBase64(file: File) {
  return new Promise<string>((resolve, reject) => {
    const reader = new FileReader()
    reader.onload = () => {
      const result = String(reader.result || '')
      resolve(result.includes(',') ? result.split(',').pop() || '' : result)
    }
    reader.onerror = () => reject(new Error('头像读取失败'))
    reader.readAsDataURL(file)
  })
}

async function loadImage(file: File) {
  return new Promise<HTMLImageElement>((resolve, reject) => {
    const url = URL.createObjectURL(file)
    const image = new Image()
    image.onload = () => {
      URL.revokeObjectURL(url)
      resolve(image)
    }
    image.onerror = () => {
      URL.revokeObjectURL(url)
      reject(new Error('头像图片解析失败'))
    }
    image.src = url
  })
}

function canvasToBlob(canvas: HTMLCanvasElement, type: string, quality: number) {
  return new Promise<Blob>((resolve, reject) => {
    canvas.toBlob((blob) => {
      if (!blob) reject(new Error('头像压缩失败'))
      else resolve(blob)
    }, type, quality)
  })
}

async function compressAvatarFile(file: File) {
  if (file.size <= AVATAR_MAX_BYTES) return file
  if (file.type === 'image/gif') throw new Error('GIF 头像需小于 0.5MB，或请换 JPG / PNG / WebP')

  const image = await loadImage(file)
  const scale = Math.min(1, AVATAR_MAX_DIMENSION / Math.max(image.naturalWidth, image.naturalHeight))
  const width = Math.max(1, Math.round(image.naturalWidth * scale))
  const height = Math.max(1, Math.round(image.naturalHeight * scale))
  const canvas = document.createElement('canvas')
  canvas.width = width
  canvas.height = height

  const context = canvas.getContext('2d')
  if (!context) throw new Error('当前浏览器不支持头像压缩')
  context.fillStyle = '#fffaf1'
  context.fillRect(0, 0, width, height)
  context.drawImage(image, 0, 0, width, height)

  for (const quality of [0.82, 0.72, 0.62, 0.52, 0.42]) {
    const blob = await canvasToBlob(canvas, 'image/jpeg', quality)
    if (blob.size <= AVATAR_MAX_BYTES) {
      return new File([blob], file.name.replace(/\.[^.]+$/, '') + '.jpg', { type: 'image/jpeg' })
    }
  }

  throw new Error('头像压缩后仍超过 0.5MB，请换一张更小的图片')
}

export async function uploadAppUserAvatar(file: File) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')
  if (!AVATAR_ALLOWED_TYPES.includes(file.type)) throw new Error('仅支持 JPG / PNG / WebP / GIF')

  const uploadFile = await compressAvatarFile(file)
  if (uploadFile.size > AVATAR_MAX_BYTES) throw new Error('头像需小于 0.5MB')
  const base64Data = await readFileAsBase64(uploadFile)
  const body = await requestProfileApi<{ avatarUrl: string, profile: Record<string, unknown> }>('/api/profile/avatar', {
    method: 'POST',
    body: JSON.stringify({
      base64Data,
      contentType: uploadFile.type,
      fileName: uploadFile.name
    })
  })
  const profile = normalizeProfile(body.profile)
  setPreferenceTags(profile.preferences)
  return profile
}

export function getProfileAvatar(profile: AppUserProfile | null) {
  return getPresetAvatar(profile?.avatarPreset)
}
