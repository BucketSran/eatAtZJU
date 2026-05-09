import type { User } from '@supabase/supabase-js'
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

export async function ensureAppUserProfile(user: User) {
  const client = getSupabaseBrowserClient()
  if (!client) return null

  const providerUserId = user.id
  const { data: existingLink, error: linkError } = await client
    .from('identity_links')
    .select('app_user_id')
    .eq('provider', 'supabase_auth')
    .eq('provider_user_id', providerUserId)
    .maybeSingle()

  if (linkError) throw linkError

  if (existingLink?.app_user_id) {
    const { data, error } = await client
      .from('app_users')
      .select('id,display_name,avatar_url,avatar_type,avatar_preset,preferences')
      .eq('id', existingLink.app_user_id)
      .single()
    if (error) throw error
    const profile = normalizeProfile(data)
    if (profile.preferences.length) setPreferenceTags(profile.preferences)
    return profile
  }

  const { data: appUser, error: userError } = await client
    .from('app_users')
    .insert({
      id: user.id,
      display_name: user.email?.split('@')[0] || 'ZJU student',
      avatar_type: 'preset',
      avatar_preset: 'rice',
      preferences: getPreferenceTags(),
      primary_channel: 'supabase_auth'
    })
    .select('id,display_name,avatar_url,avatar_type,avatar_preset,preferences')
    .single()

  if (userError) throw userError

  const { error: identityError } = await client
    .from('identity_links')
    .insert({
      app_user_id: appUser.id,
      provider: 'supabase_auth',
      provider_user_id: providerUserId,
      auth_user_id: user.id,
      metadata: { source: 'web' },
      last_seen_at: new Date().toISOString()
    })

  if (identityError) throw identityError
  return normalizeProfile(appUser)
}

export async function updateAppUserProfile(profile: Partial<Pick<AppUserProfile, 'avatarPreset' | 'avatarType' | 'avatarUrl' | 'displayName' | 'preferences'>>) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data: userData, error: userError } = await client.auth.getUser()
  if (userError) throw userError
  if (!userData.user) throw new Error('Please sign in first')

  const current = await ensureAppUserProfile(userData.user)
  if (!current) throw new Error('Profile is not available')

  const { data, error } = await client
    .from('app_users')
    .update({
      display_name: profile.displayName ?? current.displayName,
      avatar_type: profile.avatarType ?? current.avatarType,
      avatar_preset: profile.avatarPreset ?? current.avatarPreset,
      avatar_url: profile.avatarUrl ?? current.avatarUrl,
      preferences: profile.preferences ?? current.preferences
    })
    .eq('id', current.id)
    .select('id,display_name,avatar_url,avatar_type,avatar_preset,preferences')
    .single()

  if (error) throw error
  const next = normalizeProfile(data)
  setPreferenceTags(next.preferences)
  return next
}

export async function uploadAppUserAvatar(file: File) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')
  if (file.size > 1024 * 1024) throw new Error('头像需小于 1MB')
  if (!['image/jpeg', 'image/png', 'image/webp', 'image/gif'].includes(file.type)) throw new Error('仅支持 JPG / PNG / WebP / GIF')

  const { data: userData, error: userError } = await client.auth.getUser()
  if (userError) throw userError
  if (!userData.user) throw new Error('Please sign in first')

  const safeName = file.name.toLowerCase().replace(/[^a-z0-9._-]/g, '-')
  const objectPath = `${userData.user.id}/${Date.now()}-${safeName || 'avatar.jpg'}`
  const { error: uploadError } = await client.storage
    .from('app-avatars')
    .upload(objectPath, file, {
      cacheControl: '3600',
      contentType: file.type,
      upsert: false
    })

  if (uploadError) throw uploadError
  const { data } = client.storage.from('app-avatars').getPublicUrl(objectPath)
  return data.publicUrl
}

export function getProfileAvatar(profile: AppUserProfile | null) {
  return getPresetAvatar(profile?.avatarPreset)
}
