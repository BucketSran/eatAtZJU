const service = require('../../services/restaurantService')
const { getPreferences, setPreferences, getProfile, setProfile } = require('../../utils/storage')
const { PRESET_AVATARS, getPresetAvatar } = require('../../utils/avatar')

const MAX_AVATAR_SIZE = 1024 * 1024

Page({
  data: {
    tags: [],
    preferences: [],
    preferenceText: '',
    profile: null,
    avatar: getPresetAvatar('rice'),
    avatarOptions: PRESET_AVATARS,
    roadmap: [
      '校园邮箱认证与实名学生身份',
      'UGC 餐厅/菜品上传与社区审核',
      '约饭活动、好友动态和兴趣群',
      '后台管理台与推荐理由生成 Agent'
    ]
  },

  onShow() {
    this.refresh()
  },

  refresh() {
    const preferences = getPreferences()
    const profile = getProfile()
    this.setData({
      tags: this.buildPreferenceTags(preferences),
      preferences,
      preferenceText: preferences.join(' / '),
      profile,
      avatar: getPresetAvatar(profile.avatarPreset)
    })
  },

  buildPreferenceTags(preferences) {
    return service.tasteTags
      .filter(tag => tag !== '全部')
      .map(tag => ({
        label: tag,
        active: preferences.includes(tag)
      }))
  },

  togglePreference(event) {
    const tag = event.currentTarget.dataset.tag
    const preferences = this.data.preferences.includes(tag)
      ? this.data.preferences.filter(item => item !== tag)
      : this.data.preferences.concat(tag)

    setPreferences(preferences)
    this.setData({
      tags: this.buildPreferenceTags(preferences),
      preferences,
      preferenceText: preferences.join(' / ')
    })
  },

  resetPreferences() {
    const defaults = ['近', '实惠', '辣']
    setPreferences(defaults)
    this.setData({
      tags: this.buildPreferenceTags(defaults),
      preferences: defaults,
      preferenceText: defaults.join(' / ')
    })
  },

  updateUsername(event) {
    const username = event.detail.value.trim().slice(0, 16) || 'ZJU Student'
    const profile = setProfile({ username })
    this.setData({ profile })
  },

  choosePresetAvatar(event) {
    const avatarPreset = event.currentTarget.dataset.id
    const profile = setProfile({
      avatarType: 'preset',
      avatarPreset,
      avatarTempPath: ''
    })
    this.setData({
      profile,
      avatar: getPresetAvatar(avatarPreset)
    })
  },

  chooseCustomAvatar() {
    wx.chooseMedia({
      count: 1,
      mediaType: ['image'],
      sourceType: ['album', 'camera'],
      sizeType: ['compressed'],
      success: (res) => {
        const file = res.tempFiles && res.tempFiles[0]
        if (!file) return
        if (file.size > MAX_AVATAR_SIZE) {
          wx.showToast({ title: '头像需小于 1MB', icon: 'none' })
          return
        }
        const profile = setProfile({
          avatarType: 'custom',
          avatarTempPath: file.tempFilePath
        })
        this.setData({ profile })
      }
    })
  }
})
