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
    bindEmail: '',
    bindOtp: '',
    bindStatus: '',
    isBindingEmail: false,
    pendingMerge: null,
    mergeChoices: {
      displayName: 'target',
      avatar: 'target',
      preferences: 'union'
    },
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
      avatar: profileService.getPresetAvatar(profile.avatarPreset)
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
  },

  updateBindEmail(event) {
    this.setData({ bindEmail: event.detail.value.trim().toLowerCase() })
  },

  updateBindOtp(event) {
    this.setData({ bindOtp: event.detail.value.replace(/\D/g, '').slice(0, 8) })
  },

  async sendBindOtp() {
    if (!this.data.bindEmail) {
      wx.showToast({ title: '请先填写浙大邮箱', icon: 'none' })
      return
    }
    this.setData({ isBindingEmail: true, bindStatus: '正在发送验证码...' })
    try {
      await profileService.sendCampusEmailOtp(this.data.bindEmail)
      this.setData({ bindStatus: '验证码已发送，请复制邮件里的数字验证码。' })
    } catch (error) {
      this.setData({ bindStatus: error.message || '验证码发送失败' })
    } finally {
      this.setData({ isBindingEmail: false })
    }
  },

  async previewEmailBind() {
    if (!this.data.bindEmail || !this.data.bindOtp) {
      wx.showToast({ title: '请填写邮箱和验证码', icon: 'none' })
      return
    }
    this.setData({ isBindingEmail: true, bindStatus: '正在验证并生成合并预览...' })
    try {
      const result = await profileService.verifyCampusEmailOtp(this.data.bindEmail, this.data.bindOtp)
      const recommended = result.preview && result.preview.recommended ? result.preview.recommended : {}
      this.setData({
        pendingMerge: {
          mergeToken: result.mergeToken,
          email: result.email,
          preview: result.preview
        },
        mergeChoices: {
          displayName: recommended.displayName || 'target',
          avatar: recommended.avatar || 'target',
          preferences: recommended.preferences || 'union'
        },
        bindStatus: '校园邮箱已验证，请确认资料冲突如何合并。'
      })
    } catch (error) {
      this.setData({ bindStatus: error.message || '邮箱验证失败' })
    } finally {
      this.setData({ isBindingEmail: false })
    }
  },

  chooseDisplayNameMerge(event) {
    this.setData({ 'mergeChoices.displayName': event.detail.value })
  },

  chooseAvatarMerge(event) {
    this.setData({ 'mergeChoices.avatar': event.detail.value })
  },

  choosePreferenceMerge(event) {
    this.setData({ 'mergeChoices.preferences': event.detail.value })
  },

  async confirmEmailBind() {
    if (!this.data.pendingMerge) return
    this.setData({ isBindingEmail: true, bindStatus: '正在合并微信与邮箱账号...' })
    try {
      const result = await profileService.confirmCampusEmailBind(this.data.pendingMerge.mergeToken, this.data.mergeChoices)
      this.setData({
        profile: result.profile,
        profileSynced: true,
        avatar: profileService.getPresetAvatar(result.profile.avatarPreset),
        pendingMerge: null,
        bindOtp: '',
        bindStatus: '绑定完成：微信与浙大邮箱已指向同一个账号。'
      })
      wx.showToast({ title: '绑定完成', icon: 'success' })
    } catch (error) {
      this.setData({ bindStatus: error.message || '账号合并失败' })
    } finally {
      this.setData({ isBindingEmail: false })
    }
  }
})
