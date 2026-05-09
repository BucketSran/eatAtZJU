const restaurantsSeed = require('../../seed/restaurants.json')
const dishesSeed = require('../../seed/dishes.json')
const reviewsSeed = require('../../seed/reviews.json')

const taxonomyTagMap = {
  都可以: [],
  一人食: ['一人食', '一个人', '单人吃饭', '独自觅食'],
  聚餐: ['聚餐', '多人拼桌', '多人约饭', '四人聚餐'],
  赶课快吃: ['赶课午餐', '赶课午饭', '课间午餐', '快速解决', '快餐'],
  自习后: ['晚自习前', '下午自习', '晚课后'],
  约会拍照: ['拍照', '拍照打卡', '轻约会'],
  运动后: ['健身后', '夜跑后', '轻负担'],
  懒得出校: ['懒得出校', '校内', '近'],
  辣: ['辣', '微辣', '想吃辣'],
  不辣: ['不辣', '不想吃辣', '清淡晚饭'],
  轻负担: ['轻负担', '不想太油', '清爽', '健身后'],
  大份: ['大份', '想吃大份', '大份下饭'],
  快乐碳水: ['快乐碳水', '面食', '小吃'],
  清真友好: ['清真友好'],
  暖胃: ['暖胃', '雨天热汤', '雨天热饭'],
  下饭: ['下饭', '大份下饭'],
  面食: ['面食', '粉', '面'],
  小吃: ['小吃', '夜宵'],
  拍照: ['拍照', '拍照打卡'],
  清爽: ['清爽', '清爽午餐', '清爽汤粉'],
  快餐: ['快餐', '快速解决'],
  实惠: ['实惠', '预算友好', '人均30内']
}

const diningModeTagMap = {
  都可以: [],
  堂食: ['校内', '聚餐', '下饭', '拍照', '暖胃', '清真友好'],
  外卖: ['快餐', '一人食', '实惠', '人均30内', '轻负担']
}

const mealPeriodTagMap = {
  早餐: ['暖胃', '面食', '校内', '近', '清真友好'],
  中餐: ['午餐快吃', '课间午餐', '赶课午餐', '快餐', '实惠', '一人食', '校内', '人均30内'],
  下午茶: ['下午自习', '咖啡', '甜品', '拍照', '轻负担', '嘴馋'],
  晚餐: ['晚饭快吃', '晚饭改善', '晚餐聚餐', '聚餐', '下饭', '辣', '人均50内'],
  夜宵: ['夜宵', '夜宵改善', '晚归加餐', '小吃', '暖胃']
}

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

function getSearchableTokens(restaurant) {
  return [restaurant.name, restaurant.area, restaurant.cuisine, restaurant.reason, ...(restaurant.tags || []), ...(restaurant.suitedFor || [])]
}

function matchesToken(restaurant, token) {
  const mappedTags = taxonomyTagMap[token]
  const candidates = mappedTags && mappedTags.length ? mappedTags : [token]
  return candidates.some((candidate) => getSearchableTokens(restaurant).some((value) => String(value).includes(candidate)))
}

function matchesTag(restaurant, tag = '全部') {
  return tag === '全部' || matchesToken(restaurant, tag)
}

function matchesTags(restaurant, tags = []) {
  return tags.filter((tag) => tag && tag !== '全部').every((tag) => matchesTag(restaurant, tag))
}

function matchesCategory(restaurant, category, tagMap) {
  if (!category || category === '全部') return true
  const categoryTags = tagMap[category]
  if (categoryTags && categoryTags.length === 0) return true
  if (!categoryTags || !categoryTags.length) return matchesTag(restaurant, category)
  return categoryTags.some((tag) => matchesTag(restaurant, tag))
}

function matchesPrice(restaurant, priceRange) {
  if (!priceRange) return true
  return restaurant.price >= priceRange.min && restaurant.price <= priceRange.max
}

function matchesDistance(restaurant, distanceLabel = '不限') {
  if (distanceLabel === '10分钟内') return restaurant.walkMinutes <= 10
  if (distanceLabel === '20分钟内') return restaurant.walkMinutes <= 20
  return true
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
  const selectedTags = parseList(query.tags)
  const fallbackTag = query.tag && query.tag !== '全部' ? [query.tag] : []
  const filtered = restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
      matchesKeyword(restaurant, query.keyword) &&
      matchesCategory(restaurant, query.mode, diningModeTagMap) &&
      matchesCategory(restaurant, query.meal, mealPeriodTagMap) &&
      matchesDistance(restaurant, query.distance) &&
      matchesTags(restaurant, selectedTags.length ? selectedTags : fallbackTag) &&
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
