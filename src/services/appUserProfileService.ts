import { getPresetAvatar } from '../lib/avatars'
import { getPreferenceTags, setPreferenceTags } from './preferenceStore'
import { getSupabaseBrowserClient } from './supabaseBrowserClient'

export type AppUserProfile = {
  avatarPreset: string
  avatarType: 'preset' | 'custom'
  avatarUrl: string
  displayName: string
  id: string
  preferences: string[]
}

function normalizeProfile(row: Record<string, unknown>): AppUserProfile {
  return {
    id: String(row.id),
    displayName: String(row.display_name || 'ZJU student'),
    avatarType: row.avatar_type === 'custom' ? 'custom' : 'preset',
    avatarPreset: String(row.avatar_preset || 'rice'),
    avatarUrl: String(row.avatar_url || ''),
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

  const current = await ensureAppUserProfile()
  if (!current) throw new Error('Profile is not available')

  const body = await requestProfileApi<{ profile: Record<string, unknown> }>('/api/profile', {
    method: 'PATCH',
    body: JSON.stringify({
      displayName: profile.displayName ?? current.displayName,
      avatarType: profile.avatarType ?? current.avatarType,
      avatarPreset: profile.avatarPreset ?? current.avatarPreset,
      avatarUrl: profile.avatarUrl ?? current.avatarUrl,
      preferences: profile.preferences ?? current.preferences
    })
  })
  const next = normalizeProfile(body.profile)
  setPreferenceTags(next.preferences)
  return next
}

export async function uploadAppUserAvatar(file: File) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')
  if (file.size > 1024 * 1024) throw new Error('头像需小于 1MB')
  if (!['image/jpeg', 'image/png', 'image/webp', 'image/gif'].includes(file.type)) throw new Error('仅支持 JPG / PNG / WebP / GIF')

  const base64Data = await new Promise<string>((resolve, reject) => {
    const reader = new FileReader()
    reader.onload = () => {
      const result = String(reader.result || '')
      resolve(result.includes(',') ? result.split(',').pop() || '' : result)
    }
    reader.onerror = () => reject(new Error('头像读取失败'))
    reader.readAsDataURL(file)
  })
  const body = await requestProfileApi<{ avatarUrl: string }>('/api/profile/avatar', {
    method: 'POST',
    body: JSON.stringify({
      base64Data,
      contentType: file.type,
      fileName: file.name
    })
  })
  return body.avatarUrl
}

export function getProfileAvatar(profile: AppUserProfile | null) {
  return getPresetAvatar(profile?.avatarPreset)
}
