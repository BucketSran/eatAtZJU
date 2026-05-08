function scoreRestaurant(restaurant, preferences = []) {
  const preferenceHit = restaurant.tags.filter(tag => preferences.includes(tag)).length
  const ratingScore = restaurant.rating * 12
  const studentScore = restaurant.studentScore * 0.35
  const distanceScore = Math.max(0, 30 - restaurant.distance * 8)
  const checkinScore = Math.min(18, restaurant.checkins / 35)

  return Math.round(ratingScore + studentScore + distanceScore + checkinScore + preferenceHit * 18)
}

function withRecommendationScore(restaurants, preferences = []) {
  return restaurants
    .map(item => ({
      ...item,
      recommendationScore: scoreRestaurant(item, preferences)
    }))
    .sort((a, b) => b.recommendationScore - a.recommendationScore)
}

function filterRestaurants(restaurants, filters = {}) {
  const keyword = (filters.keyword || '').trim().toLowerCase()
  const tag = filters.tag || '全部'
  const priceRange = filters.priceRange

  return restaurants.filter(item => {
    const matchKeyword = !keyword || [
      item.name,
      item.area,
      item.cuisine,
      item.reason,
      item.tags.join(' '),
      item.menu.map(menu => menu.name).join(' ')
    ].join(' ').toLowerCase().includes(keyword)

    const matchTag = tag === '全部' || item.tags.includes(tag) || item.cuisine.includes(tag)
    const matchPrice = !priceRange || (item.price >= priceRange.min && item.price <= priceRange.max)

    return matchKeyword && matchTag && matchPrice
  })
}

function pickRandomRestaurant(restaurants) {
  if (!restaurants.length) return null
  const index = Math.floor(Math.random() * restaurants.length)
  return restaurants[index]
}

module.exports = {
  withRecommendationScore,
  filterRestaurants,
  pickRandomRestaurant
}
