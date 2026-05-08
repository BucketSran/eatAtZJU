const { getPreferences } = require('./utils/storage')

App({
  globalData: {
    campus: {
      name: '浙江大学紫金港校区',
      latitude: 30.3081,
      longitude: 120.0877
    },
    defaultPreferences: getPreferences()
  },

  onLaunch() {
    if (!wx.getStorageSync('eatAtZjuOnboarded')) {
      wx.setStorageSync('eatAtZjuOnboarded', true)
      wx.setStorageSync('eatAtZjuFavorites', [])
      wx.setStorageSync('eatAtZjuPreferences', ['近', '实惠', '辣'])
    }
  }
})
