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

const DINING_MODE_TAGS = {
  '堂食': ['校内', '聚餐', '下饭', '拍照', '暖胃', '清真友好'],
  '外卖': ['快餐', '一人食', '实惠', '人均30内', '轻负担']
}

const MEAL_PERIOD_TAGS = {
  '早餐': ['暖胃', '面食', '校内', '近', '清真友好'],
  '中餐': ['午餐快吃', '课间午餐', '赶课午餐', '快餐', '实惠', '一人食', '校内', '人均30内'],
  '下午茶': ['下午自习', '咖啡', '甜品', '拍照', '轻负担', '嘴馋'],
  '晚餐': ['晚饭快吃', '晚饭改善', '晚餐聚餐', '聚餐', '下饭', '辣', '人均50内'],
  '夜宵': ['夜宵', '夜宵改善', '晚归加餐', '小吃', '暖胃']
}

function matchesCategory(searchableTags, category, tagMap) {
  if (!category) return true
  const mappedTags = tagMap[category]
  if (!mappedTags || !mappedTags.length) return searchableTags.includes(category)
  return mappedTags.some(tag => searchableTags.includes(tag))
}

function filterRestaurants(restaurants, filters = {}) {
  const keyword = (filters.keyword || '').trim().toLowerCase()
  const selectedTags = Array.isArray(filters.tags)
    ? filters.tags.filter(tag => tag && tag !== '全部')
    : (filters.tag && filters.tag !== '全部' ? [filters.tag] : [])
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

    const searchableTags = [
      item.area,
      item.cuisine,
      item.tags.join(' '),
      (item.suitedFor || []).join(' ')
    ].join(' ')
    const matchMode = matchesCategory(searchableTags, filters.diningMode || filters.mode, DINING_MODE_TAGS)
    const matchMeal = matchesCategory(searchableTags, filters.mealPeriod || filters.meal, MEAL_PERIOD_TAGS)
    const matchTag = !selectedTags.length || selectedTags.every(tag => searchableTags.includes(tag))
    const matchPrice = !priceRange || (item.price >= priceRange.min && item.price <= priceRange.max)

    return matchKeyword && matchMode && matchMeal && matchTag && matchPrice
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
