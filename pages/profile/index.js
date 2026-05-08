const service = require('../../services/restaurantService')
const { getPreferences, setPreferences } = require('../../utils/storage')

Page({
  data: {
    tags: [],
    preferences: [],
    preferenceText: '',
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
    this.setData({
      tags: this.buildPreferenceTags(preferences),
      preferences,
      preferenceText: preferences.join(' / ')
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
  }
})
