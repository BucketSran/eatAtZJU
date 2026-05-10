const AVATAR_BUCKET = 'app-avatars'
const MAX_AVATAR_BYTES = 512 * 1024
const ALLOWED_AVATAR_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp', 'image/gif'])
const PRESET_AVATARS = {
  rice: { text: '饭', color: '#f0aa38' },
  duck: { text: '鸭', color: '#4d9a8d' },
  frog: { text: '蛙', color: '#5aa37c' },
  noodle: { text: '面', color: '#6d8fbd' },
  chili: { text: '辣', color: '#c84b35' },
  sleepy: { text: '困', color: '#8c6338' }
}
const CAMPUS_LABELS = new Set(['紫金港', '玉泉', '西溪', '华家池', '之江', '海宁'])

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

function normalizeDefaultCampus(value) {
  const campus = String(value || '紫金港').trim()
  return CAMPUS_LABELS.has(campus) ? campus : '紫金港'
}

function mapAppUser(row) {
  return {
    avatarPreset: row.avatar_preset || 'rice',
    avatarType: row.avatar_type === 'custom' ? 'custom' : 'preset',
    avatarUrl: row.avatar_url || '',
    defaultCampus: normalizeDefaultCampus(row.default_campus),
    displayName: row.display_name || 'ZJU student',
    id: row.id,
    preferences: Array.isArray(row.preferences) ? row.preferences : []
  }
}

function getAvatarSnapshot(row) {
  const avatarType = row?.avatar_type === 'custom' ? 'custom' : 'preset'
  const presetId = row?.avatar_preset || 'rice'
  const preset = PRESET_AVATARS[presetId] || PRESET_AVATARS.rice
  return {
    type: avatarType,
    preset: presetId,
    url: avatarType === 'custom' ? row?.avatar_url || '' : '',
    text: avatarType === 'custom' ? '' : preset.text,
    color: preset.color
  }
}

async function fetchAppUserById(client, appUserId) {
  const { data, error } = await client
    .from('app_users')
    .select('id,display_name,avatar_url,avatar_type,avatar_preset,default_campus,preferences,primary_channel')
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
        default_campus: '紫金港',
        preferences: [],
        primary_channel: 'supabase_auth'
      })
      .select('id,display_name,avatar_url,avatar_type,avatar_preset,default_campus,preferences,primary_channel')
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
  if (patch.defaultCampus !== undefined) body.default_campus = normalizeDefaultCampus(patch.defaultCampus)
  if (patch.preferences !== undefined) body.preferences = normalizePreferences(patch.preferences)

  if (!Object.keys(body).length) return fetchAppUserById(client, appUserId)

  const { data, error } = await client
    .from('app_users')
    .update(body)
    .eq('id', appUserId)
    .select('id,display_name,avatar_url,avatar_type,avatar_preset,default_campus,preferences,primary_channel')
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
    const error = new Error('头像需小于 0.5MB')
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
  getAvatarSnapshot,
  mapAppUser,
  updateAppUser,
  uploadAvatar
}
