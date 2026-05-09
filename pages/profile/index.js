const service = require('../../services/restaurantService')
const profileService = require('../../services/userProfileService')
const { getPreferences, setPreferences } = require('../../utils/storage')

Page({
  data: {
    tags: [],
    preferences: [],
    preferenceText: '',
    profile: null,
    profileSynced: false,
    avatar: profileService.getPresetAvatar('rice'),
    avatarOptions: profileService.PRESET_AVATARS,
    roadmap: [
      '校园邮箱认证与实名学生身份',
      'UGC 餐厅/菜品上传与社区审核',
      '约饭活动、好友动态和兴趣群',
      '后台管理台与推荐理由生成 Agent'
    ]
  },

  async onShow() {
    await this.loadRemoteProfile()
    this.refresh()
  },

  async loadRemoteProfile() {
    const result = await profileService.loadProfile()
    this.setData({
      profile: result.profile,
      profileSynced: result.synced,
      avatar: profileService.getPresetAvatar(result.profile.avatarPreset)
    })
  },

  refresh() {
    const preferences = getPreferences()
    const profile = this.data.profile || {
      username: 'ZJU Student',
      avatarType: 'preset',
      avatarPreset: 'rice',
      avatarTempPath: ''
    }
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
    profileService.saveProfile({ preferences: defaults })
  },

  async updateUsername(event) {
    const username = event.detail.value.trim().slice(0, 16) || 'ZJU Student'
    const result = await profileService.saveProfile({ username })
    this.setData({ profile: result.profile, profileSynced: result.synced })
  },

  async choosePresetAvatar(event) {
    const avatarPreset = event.currentTarget.dataset.id
    const result = await profileService.saveProfile({
      avatarType: 'preset',
      avatarPreset,
      avatarUrl: '',
      avatarTempPath: ''
    })
    this.setData({
      profile: result.profile,
      profileSynced: result.synced,
      avatar: profileService.getPresetAvatar(avatarPreset)
    })
  },

  chooseCustomAvatar() {
    wx.chooseMedia({
      count: 1,
      mediaType: ['image'],
      sourceType: ['album', 'camera'],
      sizeType: ['compressed'],
      success: async (res) => {
        const file = res.tempFiles && res.tempFiles[0]
        if (!file) return
        if (file.size > profileService.MAX_AVATAR_SIZE) {
          wx.showToast({ title: '头像需小于 1MB', icon: 'none' })
          return
        }
        wx.showLoading({ title: '上传头像' })
        try {
          const avatarUrl = await profileService.uploadAvatarFile(file)
          const result = await profileService.saveProfile({
            avatarType: 'custom',
            avatarUrl,
            avatarTempPath: avatarUrl
          })
          this.setData({ profile: result.profile, profileSynced: result.synced })
        } catch (error) {
          const result = await profileService.saveProfile({
            avatarType: 'custom',
            avatarTempPath: file.tempFilePath
          })
          this.setData({ profile: result.profile, profileSynced: false })
          wx.showToast({ title: '已本地保存，云同步稍后再试', icon: 'none' })
        } finally {
          wx.hideLoading()
        }
      }
    })
  }
})
