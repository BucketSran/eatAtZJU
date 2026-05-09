const AVATAR_BUCKET = 'app-avatars'
const MAX_AVATAR_BYTES = 1024 * 1024
const ALLOWED_AVATAR_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp', 'image/gif'])

function normalizeDisplayName(value) {
  const name = String(value || 'ZJU student').trim().slice(0, 40)
  return name || 'ZJU student'
}

function normalizePreferences(value) {
  if (!Array.isArray(value)) return []
  return [...new Set(value.filter((tag) => typeof tag === 'string').map((tag) => tag.trim()).filter(Boolean))].slice(0, 20)
}

function normalizeAvatarType(value) {
  return value === 'custom' ? 'custom' : 'preset'
}

function normalizeAvatarPreset(value) {
  return String(value || 'rice').trim().slice(0, 40) || 'rice'
}

function normalizeAvatarUrl(value) {
  return String(value || '').trim().slice(0, 800)
}

function mapAppUser(row) {
  return {
    avatarPreset: row.avatar_preset || 'rice',
    avatarType: row.avatar_type === 'custom' ? 'custom' : 'preset',
    avatarUrl: row.avatar_url || '',
    displayName: row.display_name || 'ZJU student',
    id: row.id,
    preferences: Array.isArray(row.preferences) ? row.preferences : []
  }
}

async function fetchAppUserById(client, appUserId) {
  const { data, error } = await client
    .from('app_users')
    .select('id,display_name,avatar_url,avatar_type,avatar_preset,preferences,primary_channel')
    .eq('id', appUserId)
    .maybeSingle()

  if (error) throw error
  return data
}

async function fetchSupabaseIdentityLink(client, authUserId) {
  const { data, error } = await client
    .from('identity_links')
    .select('app_user_id')
    .eq('provider', 'supabase_auth')
    .eq('provider_user_id', authUserId)
    .maybeSingle()

  if (error) throw error
  return data
}

async function ensureAppUserForAuth(client, user) {
  const existingLink = await fetchSupabaseIdentityLink(client, user.id)
  if (existingLink?.app_user_id) {
    const linkedUser = await fetchAppUserById(client, existingLink.app_user_id)
    if (linkedUser) {
      await client
        .from('identity_links')
        .update({ last_seen_at: new Date().toISOString() })
        .eq('provider', 'supabase_auth')
        .eq('provider_user_id', user.id)
      return linkedUser
    }
  }

  let appUser = await fetchAppUserById(client, user.id)
  if (!appUser) {
    const { data, error } = await client
      .from('app_users')
      .insert({
        id: user.id,
        display_name: normalizeDisplayName(user.email?.split('@')[0] || 'ZJU student'),
        avatar_type: 'preset',
        avatar_preset: 'rice',
        preferences: [],
        primary_channel: 'supabase_auth'
      })
      .select('id,display_name,avatar_url,avatar_type,avatar_preset,preferences,primary_channel')
      .single()

    if (error) throw error
    appUser = data
  }

  const { error: linkError } = await client
    .from('identity_links')
    .upsert({
      app_user_id: appUser.id,
      provider: 'supabase_auth',
      provider_user_id: user.id,
      auth_user_id: user.id,
      metadata: { source: 'web_profile_api' },
      last_seen_at: new Date().toISOString()
    }, { onConflict: 'provider,provider_user_id' })

  if (linkError) throw linkError
  return appUser
}

async function updateAppUser(client, appUserId, patch) {
  const body = {}
  if (patch.displayName !== undefined) body.display_name = normalizeDisplayName(patch.displayName)
  if (patch.avatarType !== undefined) body.avatar_type = normalizeAvatarType(patch.avatarType)
  if (patch.avatarPreset !== undefined) body.avatar_preset = normalizeAvatarPreset(patch.avatarPreset)
  if (patch.avatarUrl !== undefined) body.avatar_url = normalizeAvatarUrl(patch.avatarUrl)
  if (patch.preferences !== undefined) body.preferences = normalizePreferences(patch.preferences)

  if (!Object.keys(body).length) return fetchAppUserById(client, appUserId)

  const { data, error } = await client
    .from('app_users')
    .update(body)
    .eq('id', appUserId)
    .select('id,display_name,avatar_url,avatar_type,avatar_preset,preferences,primary_channel')
    .single()

  if (error) throw error
  return data
}

function sanitizeFileName(value, fallback = 'avatar') {
  return String(value || fallback)
    .toLowerCase()
    .replace(/[^a-z0-9._-]/g, '-')
    .replace(/-+/g, '-')
    .slice(0, 80) || fallback
}

async function uploadAvatar(client, appUserId, file) {
  const contentType = String(file.contentType || 'image/jpeg').toLowerCase()
  if (!ALLOWED_AVATAR_TYPES.has(contentType)) {
    const error = new Error('仅支持 JPG / PNG / WebP / GIF')
    error.status = 400
    throw error
  }

  const buffer = Buffer.from(String(file.base64Data || ''), 'base64')
  if (!buffer.length) {
    const error = new Error('头像文件为空')
    error.status = 400
    throw error
  }
  if (buffer.length > MAX_AVATAR_BYTES) {
    const error = new Error('头像需小于 1MB')
    error.status = 413
    throw error
  }

  const fileName = sanitizeFileName(file.fileName || 'avatar.jpg')
  const ext = sanitizeFileName(fileName.split('.').pop() || 'jpg', 'jpg')
  const objectPath = `${appUserId}/${Date.now()}-${Math.random().toString(36).slice(2)}.${ext}`
  const { error: uploadError } = await client.storage
    .from(AVATAR_BUCKET)
    .upload(objectPath, buffer, {
      cacheControl: '3600',
      contentType,
      upsert: false
    })

  if (uploadError) throw uploadError
  const { data } = client.storage.from(AVATAR_BUCKET).getPublicUrl(objectPath)
  return { avatarUrl: data.publicUrl, objectPath }
}

module.exports = {
  ensureAppUserForAuth,
  mapAppUser,
  updateAppUser,
  uploadAvatar
}
