const service = require('../../services/restaurantDataService')
const { toggleFavorite, getPreferences } = require('../../utils/storage')
const { getMealContext } = require('../../utils/timeContext')

const TAG_CONFLICTS = {
  '辣': ['不辣'],
  '不辣': ['辣']
}

function buildTagItems(tasteTags, activeTags) {
  return tasteTags.map(tag => ({
    label: tag,
    active: tag === '全部' ? !activeTags.length : activeTags.includes(tag)
  }))
}

function resolveTagSelection(currentTags, tag) {
  if (tag === '全部') return []

  if (currentTags.includes(tag)) {
    return currentTags.filter(item => item !== tag)
  }

  const conflicts = TAG_CONFLICTS[tag] || []
  return currentTags
    .filter(item => !conflicts.includes(item))
    .concat(tag)
}

function getSearchPlaceholder(mealContext) {
  const examples = {
    breakfast: '搜早餐、热汤、面食，例如：暖胃 / 面 / 校内',
    lunch: '搜午饭、盖饭、快餐，例如：近 / 实惠 / 牛肉饭',
    afternoon: '搜下午茶、咖啡、甜点，例如：咖啡 / 拍照',
    dinner: '搜晚饭、聚餐、下饭，例如：烤鱼 / 辣 / 聚餐',
    night: '搜夜宵、小吃、热汤，例如：炸串 / 粥 / 夜宵'
  }
  return examples[mealContext.key] || '搜餐厅、菜品、标签，例如：夜宵 / 咖喱 / 辣'
}

Page({
  data: {
    keyword: '',
    activeTags: [],
    activePriceIndex: 0,
    tasteTags: buildTagItems(service.tasteTags, []),
    priceRanges: service.priceRanges,
    restaurants: [],
    topPick: null,
    randomPick: null,
    preferences: [],
    preferenceText: '',
    mealContext: getMealContext(),
    searchPlaceholder: getSearchPlaceholder(getMealContext())
  },

  onShow() {
    this.refreshRestaurants()
  },

  async refreshRestaurants() {
    const preferences = getPreferences()
    const mealContext = getMealContext()
    const filters = {
      keyword: this.data.keyword,
      tags: this.data.activeTags,
      priceRange: service.priceRanges[this.data.activePriceIndex]
    }
    const restaurants = await service.listRestaurants(filters, preferences.concat(mealContext.tags))
    this.setData({
      mealContext,
      searchPlaceholder: getSearchPlaceholder(mealContext),
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
    const activeTags = resolveTagSelection(this.data.activeTags, event.currentTarget.dataset.tag)
    this.setData({
      activeTags,
      tasteTags: buildTagItems(service.tasteTags, activeTags)
    })
    this.refreshRestaurants()
  },

  choosePrice(event) {
    this.setData({ activePriceIndex: Number(event.currentTarget.dataset.index) })
    this.refreshRestaurants()
  },

  async surpriseMe() {
    const randomPick = await service.randomRestaurant({
      keyword: this.data.keyword,
      tags: this.data.activeTags,
      priceRange: service.priceRanges[this.data.activePriceIndex]
    }, this.data.preferences.concat(this.data.mealContext.tags))

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
