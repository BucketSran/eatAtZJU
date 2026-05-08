const FAVORITES_KEY = 'eatAtZjuFavorites'
const PREFERENCES_KEY = 'eatAtZjuPreferences'
const PROFILE_KEY = 'eatAtZjuProfile'

const DEFAULT_PROFILE = {
  username: 'ZJU Student',
  avatarType: 'preset',
  avatarPreset: 'rice',
  avatarTempPath: ''
}

function getFavorites() {
  return wx.getStorageSync(FAVORITES_KEY) || []
}

function isFavorite(id) {
  return getFavorites().includes(id)
}

function toggleFavorite(id) {
  const favorites = getFavorites()
  const next = favorites.includes(id)
    ? favorites.filter(item => item !== id)
    : favorites.concat(id)
  wx.setStorageSync(FAVORITES_KEY, next)
  return next
}

function getPreferences() {
  return wx.getStorageSync(PREFERENCES_KEY) || ['近', '实惠', '辣']
}

function setPreferences(tags) {
  wx.setStorageSync(PREFERENCES_KEY, tags)
  return tags
}

function getProfile() {
  return {
    ...DEFAULT_PROFILE,
    ...(wx.getStorageSync(PROFILE_KEY) || {})
  }
}

function setProfile(profile) {
  const nextProfile = {
    ...getProfile(),
    ...profile
  }
  wx.setStorageSync(PROFILE_KEY, nextProfile)
  return nextProfile
}

module.exports = {
  getFavorites,
  isFavorite,
  toggleFavorite,
  getPreferences,
  setPreferences,
  getProfile,
  setProfile
}
