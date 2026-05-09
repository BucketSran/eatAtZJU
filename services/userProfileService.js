const { PRESET_AVATARS, getPresetAvatar } = require('../utils/avatar')
const { getProfile, setProfile, getPreferences, setPreferences } = require('../utils/storage')

const CLOUD_FUNCTION_NAME = 'eatAtZjuApi'
const MAX_AVATAR_SIZE = 1024 * 1024

function getCloudReady() {
  const app = typeof getApp === 'function' ? getApp() : null
  return Boolean(app && app.globalData && app.globalData.cloudReady && wx.cloud && wx.cloud.callFunction)
}

async function callCloud(action, payload = {}) {
  if (!getCloudReady()) throw new Error('cloud_not_ready')
  const response = await wx.cloud.callFunction({
    name: CLOUD_FUNCTION_NAME,
    data: { action, ...payload }
  })
  const result = response && response.result
  if (!result || result.ok === false) throw new Error((result && result.error) || 'cloud_function_failed')
  return result
}

function normalizeProfile(profile = getProfile()) {
  return {
    username: profile.username || profile.displayName || 'ZJU Student',
    avatarType: profile.avatarType || 'preset',
    avatarPreset: profile.avatarPreset || 'rice',
    avatarUrl: profile.avatarUrl || '',
    avatarTempPath: profile.avatarTempPath || ''
  }
}

function saveLocalProfile(profile) {
  return setProfile(normalizeProfile(profile))
}

async function loadProfile() {
  const localProfile = normalizeProfile()
  try {
    const result = await callCloud('getUserProfile')
    const remoteProfile = normalizeProfile(result.profile)
    saveLocalProfile(remoteProfile)
    if (Array.isArray(result.profile.preferences)) setPreferences(result.profile.preferences)
    return { profile: remoteProfile, synced: true }
  } catch (error) {
    return { profile: localProfile, synced: false, error: error.message }
  }
}

async function saveProfile(patch = {}) {
  const nextProfile = saveLocalProfile({ ...getProfile(), ...patch })
  try {
    await callCloud('updateUserProfile', {
      profile: {
        displayName: nextProfile.username,
        avatarType: nextProfile.avatarType,
        avatarPreset: nextProfile.avatarPreset,
        avatarUrl: nextProfile.avatarUrl || nextProfile.avatarTempPath || '',
        preferences: getPreferences()
      }
    })
    return { profile: nextProfile, synced: true }
  } catch (error) {
    return { profile: nextProfile, synced: false, error: error.message }
  }
}

async function uploadAvatarFile(file) {
  if (!file) throw new Error('missing_avatar_file')
  if (file.size > MAX_AVATAR_SIZE) throw new Error('avatar_too_large')
  if (!getCloudReady()) throw new Error('cloud_not_ready')

  const ext = (file.tempFilePath.split('.').pop() || 'jpg').toLowerCase().replace(/[^a-z0-9]/g, '') || 'jpg'
  const cloudPath = `avatars/${Date.now()}-${Math.random().toString(36).slice(2)}.${ext}`
  const result = await wx.cloud.uploadFile({ cloudPath, filePath: file.tempFilePath })
  return result.fileID
}

module.exports = {
  PRESET_AVATARS,
  MAX_AVATAR_SIZE,
  getPresetAvatar,
  loadProfile,
  saveProfile,
  uploadAvatarFile
}
