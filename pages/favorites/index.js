const service = require('../../services/restaurantDataService')
const { getPreferences, toggleFavorite } = require('../../utils/storage')

Page({
  data: {
    favorites: []
  },

  onShow() {
    this.refresh()
  },

  async refresh() {
    this.setData({
      favorites: await service.getFavoriteRestaurants(getPreferences())
    })
  },

  openRestaurant(event) {
    wx.navigateTo({ url: `/pages/restaurant/detail?id=${event.detail.id}` })
  },

  handleFavorite(event) {
    toggleFavorite(event.detail.id)
    this.refresh()
  },

  goHome() {
    wx.switchTab({ url: '/pages/home/index' })
  }
})
