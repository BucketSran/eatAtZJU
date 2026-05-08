const localService = require('./restaurantService')
const { getFavorites } = require('../utils/storage')
const { getCommentAvatar } = require('../utils/avatar')

const CLOUD_FUNCTION_NAME = 'eatAtZjuApi'

function getCloudReady() {
  const app = typeof getApp === 'function' ? getApp() : null
  return Boolean(app && app.globalData && app.globalData.cloudReady && wx.cloud && wx.cloud.callFunction)
}

function buildQuery(filters = {}, preferences = []) {
  const tags = Array.isArray(filters.tags) ? filters.tags.filter(tag => tag && tag !== '全部') : []
  return {
    keyword: filters.keyword || '',
    tag: filters.tag || tags[0] || '全部',
    tags: tags.join(','),
    price: filters.priceRange && filters.priceRange.label,
    preferences: preferences.join(','),
    favorites: getFavorites().join(',')
  }
}

function toLegacyRestaurant(restaurant, detail = {}) {
  if (!restaurant) return null
  return {
    ...restaurant,
    menu: (detail.dishes || restaurant.menu || []).map((dish) => ({
      name: dish.name,
      price: dish.price,
      heat: dish.heat
    })),
    comments: (detail.reviews || restaurant.comments || []).map((review) => ({
      user: review.userName || review.user || 'ZJU student',
      text: review.text,
      rating: review.rating,
      avatar: getCommentAvatar(review.userName || review.user || 'ZJU student')
    }))
  }
}

async function callCloud(action, payload = {}) {
  if (!getCloudReady()) throw new Error('cloud_not_ready')
  const response = await wx.cloud.callFunction({
    name: CLOUD_FUNCTION_NAME,
    data: {
      action,
      ...payload
    }
  })
  const result = response && response.result
  if (!result || result.ok === false) {
    throw new Error((result && (result.error || result.message)) || 'cloud_function_failed')
  }
  return result
}

async function listRestaurants(filters = {}, preferences = []) {
  try {
    const result = await callCloud('listRestaurants', {
      query: buildQuery(filters, preferences)
    })
    return result.restaurants || []
  } catch (error) {
    console.warn('[restaurantDataService] falling back to local list:', error.message)
    return localService.listRestaurants(filters, preferences)
  }
}

async function getRestaurant(id, preferences = []) {
  try {
    const result = await callCloud('getRestaurantDetail', {
      id,
      query: buildQuery({}, preferences)
    })
    return toLegacyRestaurant(result.restaurant, result)
  } catch (error) {
    console.warn('[restaurantDataService] falling back to local detail:', error.message)
    return localService.getRestaurant(id)
  }
}

async function getFavoriteRestaurants(preferences = []) {
  const favoriteIds = getFavorites()
  if (!favoriteIds.length) return []
  const restaurants = await listRestaurants({}, preferences)
  return restaurants.filter((item) => favoriteIds.includes(item.id))
}

async function randomRestaurant(filters = {}, preferences = []) {
  try {
    const result = await callCloud('getTodayRecommendation', {
      query: {
        ...buildQuery(filters, preferences),
        strategy: 'random'
      }
    })
    return result.restaurant || null
  } catch (error) {
    console.warn('[restaurantDataService] falling back to local random:', error.message)
    return localService.randomRestaurant(filters, preferences)
  }
}

async function getMarkers(preferences = []) {
  const restaurants = await listRestaurants({}, preferences)
  return restaurants.map((item, index) => ({
    id: index + 1,
    restaurantId: item.id,
    latitude: item.latitude,
    longitude: item.longitude,
    title: item.name,
    width: 30,
    height: 30,
    callout: {
      content: `${item.name} · ${item.rating}`,
      color: '#31271d',
      fontSize: 12,
      borderRadius: 12,
      bgColor: '#fffaf1',
      padding: 8,
      display: 'BYCLICK'
    }
  }))
}

module.exports = {
  tasteTags: localService.tasteTags,
  priceRanges: localService.priceRanges,
  listRestaurants,
  getRestaurant,
  getFavoriteRestaurants,
  randomRestaurant,
  getMarkers
}
