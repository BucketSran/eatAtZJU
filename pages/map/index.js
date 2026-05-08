const service = require('../../services/restaurantService')
const { getPreferences, toggleFavorite } = require('../../utils/storage')

Page({
  data: {
    campus: getApp().globalData.campus,
    markers: [],
    restaurants: [],
    selectedId: ''
  },

  onShow() {
    this.refresh()
  },

  refresh() {
    const restaurants = service.listRestaurants({}, getPreferences())
    this.setData({
      restaurants,
      markers: service.getMarkers()
    })
  },

  handleMarkerTap(event) {
    const marker = this.data.markers.find(item => item.id === event.markerId)
    if (!marker) return
    const selected = this.data.restaurants.find(item => item.id === marker.restaurantId)
    const others = this.data.restaurants.filter(item => item.id !== marker.restaurantId)
    this.setData({
      selectedId: marker.restaurantId,
      restaurants: selected ? [selected].concat(others) : this.data.restaurants
    })
  },

  openRestaurant(event) {
    wx.navigateTo({ url: `/pages/restaurant/detail?id=${event.detail.id}` })
  },

  handleFavorite(event) {
    toggleFavorite(event.detail.id)
    this.refresh()
  }
})
