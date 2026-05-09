const service = require('../../services/restaurantDataService')
const { getPreferences, toggleFavorite } = require('../../utils/storage')
const { getMealContext } = require('../../utils/timeContext')

Page({
  data: {
    restaurant: null,
    mealContext: getMealContext()
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
    this.setData({
      restaurant,
      mealContext: getMealContext()
    })
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
    const title = this.data.mealContext.key === 'night' ? '夜宵约饭已加入路线图' : `${this.data.mealContext.title}约饭已加入路线图`
    wx.showToast({ title, icon: 'none' })
  },

  checkIn() {
    wx.showToast({ title: '打卡入口预留，后续接入审核流', icon: 'none' })
  }
})
