const restaurantsSeed = require('../../seed/restaurants.json')
const dishesSeed = require('../../seed/dishes.json')
const reviewsSeed = require('../../seed/reviews.json')

function parseList(value) {
  if (!value) return []
  if (Array.isArray(value)) return value.flatMap(parseList)
  return String(value)
    .split(',')
    .map((item) => item.trim())
    .filter(Boolean)
}

function scoreRestaurant(restaurant, preferences = [], favoriteRestaurantIds = []) {
  const preferenceHit = restaurant.tags.filter((tag) => preferences.includes(tag)).length
  const sceneHit = restaurant.suitedFor.filter((scene) => preferences.includes(scene)).length
  const favoriteBoost = favoriteRestaurantIds.includes(restaurant.id) ? 10 : 0
  const ratingScore = restaurant.rating * 12
  const studentScore = restaurant.studentScore * 0.35
  const distanceScore = Math.max(0, 30 - restaurant.distance * 8)
  const checkinScore = Math.min(18, restaurant.checkins / 35)

  return Math.round(ratingScore + studentScore + distanceScore + checkinScore + preferenceHit * 18 + sceneHit * 8 + favoriteBoost)
}

function findPriceRange(label) {
  if (!label || label === '不限') return undefined
  return restaurantsSeed.priceRanges.find((range) => range.label === label)
}

function matchesKeyword(restaurant, keyword = '') {
  const normalized = String(keyword).trim().toLowerCase()
  if (!normalized) return true

  return [restaurant.name, restaurant.area, restaurant.cuisine, restaurant.reason, restaurant.tags.join(' '), restaurant.suitedFor.join(' ')]
    .join(' ')
    .toLowerCase()
    .includes(normalized)
}

function matchesTag(restaurant, tag = '全部') {
  return tag === '全部' || restaurant.tags.includes(tag) || restaurant.cuisine.includes(tag) || restaurant.suitedFor.includes(tag)
}

function matchesPrice(restaurant, priceRange) {
  if (!priceRange) return true
  return restaurant.price >= priceRange.min && restaurant.price <= priceRange.max
}

function sortRestaurants(restaurants, sort = 'recommended') {
  return [...restaurants].sort((a, b) => {
    if (sort === 'distance') return a.distance - b.distance
    if (sort === 'rating') return b.rating - a.rating
    if (sort === 'price') return a.price - b.price
    return (b.recommendationScore || 0) - (a.recommendationScore || 0)
  })
}

function listRestaurantCollection(restaurants, query = {}) {
  const preferences = parseList(query.preferences)
  const favoriteRestaurantIds = parseList(query.favorites)
  const priceRange = findPriceRange(query.priceLabel || query.price)
  const filtered = restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
      matchesKeyword(restaurant, query.keyword) &&
      matchesTag(restaurant, query.tag || '全部') &&
      matchesPrice(restaurant, priceRange)
    )
  })
  const scored = filtered.map((restaurant) => ({
    ...restaurant,
    recommendationScore: scoreRestaurant(restaurant, preferences, favoriteRestaurantIds),
    isFavorite: favoriteRestaurantIds.includes(restaurant.id)
  }))

  return sortRestaurants(scored, query.sort)
}

function listRestaurants(query = {}) {
  return listRestaurantCollection(restaurantsSeed.restaurants, query)
}

function getRestaurantDetail(id, query = {}) {
  const restaurant = listRestaurants(query).find((item) => item.id === id)
  if (!restaurant) return null

  return {
    restaurant,
    dishes: dishesSeed.dishes.filter((dish) => dish.restaurantId === id && dish.status === 'published'),
    reviews: reviewsSeed.reviews.filter((review) => review.restaurantId === id && review.status === 'approved')
  }
}

function getRandomRestaurant(query = {}) {
  const restaurants = listRestaurants(query)
  if (!restaurants.length) return null
  return restaurants[Math.floor(Math.random() * restaurants.length)]
}

function getRecommendedRestaurant(query = {}) {
  return listRestaurants(query)[0] || null
}

function getMetadata() {
  return {
    schemaVersion: restaurantsSeed.schemaVersion,
    tasteTags: restaurantsSeed.tasteTags,
    priceRanges: restaurantsSeed.priceRanges
  }
}

module.exports = {
  listRestaurantCollection,
  getMetadata,
  getRandomRestaurant,
  getRecommendedRestaurant,
  getRestaurantDetail,
  listRestaurants,
  parseList,
  scoreRestaurant
}
