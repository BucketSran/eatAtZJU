const service = require('../../services/restaurantDataService')
const { getPreferences, toggleFavorite } = require('../../utils/storage')

Page({
  data: {
    restaurant: null
  },

  onLoad(options) {
    this.loadRestaurant(options.id)
  },

  async loadRestaurant(id) {
    const restaurant = await service.getRestaurant(id, getPreferences())
    if (!restaurant) {
      wx.showToast({ title: '餐厅不存在', icon: 'none' })
      setTimeout(() => wx.navigateBack(), 700)
      return
    }
    this.setData({ restaurant })
  },

  async handleFavorite() {
    const { restaurant } = this.data
    toggleFavorite(restaurant.id)
    this.setData({ restaurant: await service.getRestaurant(restaurant.id, getPreferences()) })
    wx.showToast({
      title: restaurant.isFavorite ? '已取消收藏' : '已收藏',
      icon: 'none'
    })
  },

  createMealPlan() {
    wx.showToast({ title: '约饭功能已进入下一阶段路线图', icon: 'none' })
  },

  checkIn() {
    wx.showToast({ title: '打卡入口预留，后续接入审核流', icon: 'none' })
  }
})
