const { restaurants, tasteTags, priceRanges } = require('../data/restaurants')
const { filterRestaurants, withRecommendationScore, pickRandomRestaurant } = require('../utils/recommend')
const { getFavorites } = require('../utils/storage')
const { getCommentAvatar } = require('../utils/avatar')

function decorateFavorites(items) {
  const favoriteIds = getFavorites()
  return items.map(item => ({
    ...item,
    isFavorite: favoriteIds.includes(item.id)
  }))
}

function listRestaurants(filters = {}, preferences = []) {
  const filtered = filterRestaurants(restaurants, filters)
  return decorateFavorites(withRecommendationScore(filtered, preferences))
}

function getRestaurant(id) {
  const item = restaurants.find(restaurant => restaurant.id === id)
  if (!item) return null
  const restaurant = decorateFavorites([item])[0]
  return {
    ...restaurant,
    comments: (restaurant.comments || []).map(comment => ({
      ...comment,
      avatar: getCommentAvatar(comment.user)
    }))
  }
}

function getFavoriteRestaurants(preferences = []) {
  const favoriteIds = getFavorites()
  const items = restaurants.filter(item => favoriteIds.includes(item.id))
  return decorateFavorites(withRecommendationScore(items, preferences))
}

function randomRestaurant(filters = {}, preferences = []) {
  return pickRandomRestaurant(listRestaurants(filters, preferences))
}

function getMarkers() {
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
  tasteTags,
  priceRanges,
  listRestaurants,
  getRestaurant,
  getFavoriteRestaurants,
  randomRestaurant,
  getMarkers
}
