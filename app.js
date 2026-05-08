const { getPreferences } = require('./utils/storage')

App({
  globalData: {
    campus: {
      name: '浙江大学紫金港校区',
      latitude: 30.3081,
      longitude: 120.0877
    },
    defaultPreferences: getPreferences(),
    cloudReady: false
  },

  onLaunch() {
    if (wx.cloud && wx.cloud.init) {
      try {
        wx.cloud.init({ traceUser: true })
        this.globalData.cloudReady = true
      } catch (error) {
        this.globalData.cloudReady = false
        console.warn('[eatAtZJU] CloudBase init failed, using local seed fallback:', error.message)
      }
    }

    if (!wx.getStorageSync('eatAtZjuOnboarded')) {
      wx.setStorageSync('eatAtZjuOnboarded', true)
      wx.setStorageSync('eatAtZjuFavorites', [])
      wx.setStorageSync('eatAtZjuPreferences', ['近', '实惠', '辣'])
    }
  }
})
