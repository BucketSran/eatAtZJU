const service = require('../../services/restaurantService')
const { getPreferences, toggleFavorite } = require('../../utils/storage')

Page({
  data: {
    favorites: []
  },

  onShow() {
    this.refresh()
  },

  refresh() {
    this.setData({
      favorites: service.getFavoriteRestaurants(getPreferences())
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
