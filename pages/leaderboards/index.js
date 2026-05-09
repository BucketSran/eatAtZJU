const service = require('../../services/restaurantDataService')
const { getPreferences, toggleFavorite } = require('../../utils/storage')
const { getMealContext } = require('../../utils/timeContext')
const { buildLeaderboards } = require('../../utils/leaderboards')

Page({
  data: {
    mealContext: getMealContext(),
    boards: [],
    activeBoardIndex: 0,
    activeBoard: null,
    loading: true
  },

  onShow() {
    this.refreshBoards()
  },

  async refreshBoards() {
    this.setData({ loading: true })
    const mealContext = getMealContext()
    const restaurants = await service.listRestaurants({}, getPreferences().concat(mealContext.tags))
    const boards = buildLeaderboards(restaurants, { mealContext, limit: 8 })
    this.setData({
      mealContext,
      boards,
      activeBoardIndex: 0,
      activeBoard: boards[0] || null,
      loading: false
    })
  },

  chooseBoard(event) {
    const activeBoardIndex = Number(event.currentTarget.dataset.index)
    this.setData({
      activeBoardIndex,
      activeBoard: this.data.boards[activeBoardIndex]
    })
  },

  openRestaurant(event) {
    const id = event.detail ? event.detail.id : event.currentTarget.dataset.id
    wx.navigateTo({ url: `/pages/restaurant/detail?id=${id}` })
  },

  handleFavorite(event) {
    toggleFavorite(event.detail.id)
    this.refreshBoards()
  }
})
