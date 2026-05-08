const service = require('../../services/restaurantService')
const { toggleFavorite, getPreferences } = require('../../utils/storage')

Page({
  data: {
    keyword: '',
    activeTag: '全部',
    activePriceIndex: 0,
    tasteTags: service.tasteTags,
    priceRanges: service.priceRanges,
    restaurants: [],
    topPick: null,
    randomPick: null,
    preferences: [],
    preferenceText: ''
  },

  onShow() {
    this.refreshRestaurants()
  },

  refreshRestaurants() {
    const preferences = getPreferences()
    const filters = {
      keyword: this.data.keyword,
      tag: this.data.activeTag,
      priceRange: service.priceRanges[this.data.activePriceIndex]
    }
    const restaurants = service.listRestaurants(filters, preferences)
    this.setData({
      preferences,
      preferenceText: preferences.join(' / '),
      restaurants,
      topPick: restaurants[0] || null
    })
  },

  handleSearch(event) {
    this.setData({ keyword: event.detail.value })
    this.refreshRestaurants()
  },

  chooseTag(event) {
    this.setData({ activeTag: event.currentTarget.dataset.tag })
    this.refreshRestaurants()
  },

  choosePrice(event) {
    this.setData({ activePriceIndex: Number(event.currentTarget.dataset.index) })
    this.refreshRestaurants()
  },

  surpriseMe() {
    const randomPick = service.randomRestaurant({
      keyword: this.data.keyword,
      tag: this.data.activeTag,
      priceRange: service.priceRanges[this.data.activePriceIndex]
    }, this.data.preferences)

    if (!randomPick) {
      wx.showToast({ title: '没有匹配餐厅', icon: 'none' })
      return
    }

    this.setData({ randomPick })
    wx.vibrateShort({ type: 'light' })
  },

  openRestaurant(event) {
    const id = event.detail ? event.detail.id : event.currentTarget.dataset.id
    wx.navigateTo({ url: `/pages/restaurant/detail?id=${id}` })
  },

  handleFavorite(event) {
    toggleFavorite(event.detail.id)
    this.refreshRestaurants()
  }
})
