const restaurantsSeed = require('../../seed/restaurants.json')
const dishesSeed = require('../../seed/dishes.json')
const reviewsSeed = require('../../seed/reviews.json')

const taxonomyTagMap = {
  都可以: [],
  近: ['近', '校内', '懒得出校'],
  校内: ['校内', '食堂', '校内食堂', '懒得出校'],
  正餐: ['正餐', '中餐简餐', '校内食堂', '快餐小吃', '面食粉面', '烧烤烤肉', '火锅麻辣烫', '下饭'],
  饮品: ['饮品', '茶饮', '咖啡', '甜品烘焙', '奶茶', '甜品'],
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
  实惠: ['实惠', '预算友好', '人均30内'],
  咖啡: ['咖啡'],
  甜品: ['甜品'],
  奶茶: ['奶茶', '茶饮'],
  烧烤: ['烧烤'],
  火锅: ['火锅', '麻辣烫'],
  食堂: ['食堂', '校内食堂'],
  异国料理: ['异国料理', '异国简餐']
}

const diningModeTagMap = {
  都可以: [],
  堂食: ['校内', '食堂', '聚餐', '下饭', '拍照', '暖胃', '清真友好', '烧烤', '火锅', '异国料理'],
  外卖: ['快餐', '一人食', '实惠', '人均30内', '轻负担', '奶茶', '咖啡', '甜品']
}

const mealPeriodTagMap = {
  早餐: ['暖胃', '面食', '校内', '近', '清真友好'],
  中餐: ['午餐快吃', '课间午餐', '赶课午餐', '快餐', '实惠', '一人食', '校内', '人均30内'],
  下午茶: ['下午自习', '咖啡', '甜品', '奶茶', '拍照', '轻负担', '嘴馋'],
  晚餐: ['晚饭快吃', '晚饭改善', '晚餐聚餐', '聚餐', '下饭', '辣', '火锅', '烧烤', '人均50内'],
  夜宵: ['夜宵', '夜宵改善', '晚归加餐', '小吃', '烧烤', '火锅', '奶茶', '暖胃']
}

function parseList(value) {
  if (!value) return []
  if (Array.isArray(value)) return value.flatMap(parseList)
  return String(value)
    .split(',')
    .map((item) => item.trim())
    .filter(Boolean)
}

function clampScore(value) {
  return Math.max(0, Math.min(100, Math.round(value)))
}

function isDrinkOrSnackRestaurant(restaurant) {
  const text = [
    restaurant.name,
    restaurant.cuisine,
    ...(restaurant.tags || []),
    ...(restaurant.preferenceTags || [])
  ].join(' ')
  return /饮品|茶饮|咖啡|奶茶|甜品|烘焙|蛋糕|面包|鲜奶/.test(text)
}

function hasDrinkIntent(preferences) {
  return preferences.some((tag) => /饮品|茶饮|咖啡|奶茶|甜品|下午茶|拍照|轻负担/.test(tag))
}

function hasMealIntent(preferences) {
  return preferences.some((tag) => /正餐|早餐|中餐|晚餐|夜宵|下饭|面食|聚餐|一人食|快餐|辣|不辣|食堂|外卖|堂食/.test(tag))
}

function categoryScore(restaurant, preferences) {
  const drinkOrSnack = isDrinkOrSnackRestaurant(restaurant)
  if (drinkOrSnack && hasDrinkIntent(preferences) && !hasMealIntent(preferences)) return 8
  if (drinkOrSnack && hasMealIntent(preferences)) return -22
  if (drinkOrSnack) return -16
  return 8
}

function scoreRestaurantBreakdown(restaurant, preferences = [], favoriteRestaurantIds = []) {
  const preferenceTokens = new Set([
    ...(restaurant.tags || []),
    ...(restaurant.suitedFor || []),
    ...(restaurant.serviceModes || []),
    ...(restaurant.mealPeriods || []),
    ...(restaurant.scenarioTags || []),
    ...(restaurant.preferenceTags || [])
  ])
  const constraintTokens = new Set(restaurant.constraintTags || [])
  const preferenceHit = preferences.filter((tag) => preferenceTokens.has(tag)).length
  const constraintHit = preferences.filter((tag) => constraintTokens.has(tag)).length
  const favoriteBoost = favoriteRestaurantIds.includes(restaurant.id) ? 6 : 0
  const ratingScore = (restaurant.rating / 5) * 36
  const distanceScore = Math.max(0, 32 - restaurant.distance * 12)
  const priceScore = Math.max(0, 18 - restaurant.price / 5)
  const preferenceScore = Math.min(14, preferenceHit * 5 + constraintHit * 3)
  const publicScore = clampScore(ratingScore + distanceScore + priceScore + preferenceScore + favoriteBoost + categoryScore(restaurant, preferences))
  const hasStudentSignal = restaurant.studentScore > 0 || restaurant.checkins > 0
  const studentScore = hasStudentSignal
    ? clampScore(restaurant.studentScore * 0.75 + Math.min(100, restaurant.checkins / 2) * 0.25 + favoriteBoost)
    : 0

  return {
    mode: hasStudentSignal ? 'blended' : 'cold_start',
    publicScore,
    publicWeight: hasStudentSignal ? 0.2 : 1,
    studentScore,
    studentWeight: hasStudentSignal ? 0.8 : 0
  }
}

function scoreRestaurant(restaurant, preferences = [], favoriteRestaurantIds = []) {
  const breakdown = scoreRestaurantBreakdown(restaurant, preferences, favoriteRestaurantIds)
  return clampScore(breakdown.studentScore * breakdown.studentWeight + breakdown.publicScore * breakdown.publicWeight)
}

function findPriceRange(label) {
  if (!label || label === '不限') return undefined
  return restaurantsSeed.priceRanges.find((range) => range.label === label)
}

function matchesKeyword(restaurant, keyword = '') {
  const normalized = String(keyword).trim().toLowerCase()
  if (!normalized) return true

  return getSearchableTokens(restaurant)
    .join(' ')
    .toLowerCase()
    .includes(normalized)
}

function getSearchableTokens(restaurant) {
  return [
    restaurant.name,
    restaurant.area,
    restaurant.cuisine,
    restaurant.reason,
    ...(restaurant.tags || []),
    ...(restaurant.suitedFor || []),
    ...(restaurant.serviceModes || []),
    ...(restaurant.mealPeriods || []),
    ...(restaurant.scenarioTags || []),
    ...(restaurant.constraintTags || []),
    ...(restaurant.preferenceTags || [])
  ]
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

function matchesStructuredTag(restaurant, tag) {
  return [
    ...(restaurant.scenarioTags || []),
    ...(restaurant.constraintTags || []),
    ...(restaurant.preferenceTags || [])
  ].includes(tag)
}

function matchesServiceMode(restaurant, serviceMode) {
  if (!serviceMode || serviceMode === '都可以' || serviceMode === '全部') return true
  if ((restaurant.serviceModes || []).includes(serviceMode)) return true
  return matchesCategory(restaurant, serviceMode, diningModeTagMap)
}

function matchesMealPeriod(restaurant, mealPeriod) {
  if (!mealPeriod || mealPeriod === '全部') return true
  if ((restaurant.mealPeriods || []).length) return (restaurant.mealPeriods || []).includes(mealPeriod)
  return matchesCategory(restaurant, mealPeriod, mealPeriodTagMap)
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

function matchesCampus(restaurant, campus) {
  if (!campus) return true
  return (
    String(restaurant.area || '').startsWith(`${campus}校内`) ||
    String(restaurant.area || '').startsWith(`${campus}周边`) ||
    (restaurant.tags || []).includes(campus) ||
    (restaurant.suitedFor || []).includes(campus) ||
    String(restaurant.reason || '').includes(`距离${campus}约`) ||
    String(restaurant.reason || '').includes(`靠近${campus}`)
  )
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
      matchesCampus(restaurant, query.campus) &&
      matchesKeyword(restaurant, query.keyword) &&
      matchesServiceMode(restaurant, query.mode) &&
      matchesMealPeriod(restaurant, query.meal) &&
      matchesDistance(restaurant, query.distance) &&
      (selectedTags.length ? selectedTags : fallbackTag).every((tag) => matchesStructuredTag(restaurant, tag) || matchesTag(restaurant, tag)) &&
      matchesPrice(restaurant, priceRange)
    )
  })
  const scored = filtered.map((restaurant) => ({
    ...restaurant,
    matchBreakdown: scoreRestaurantBreakdown(restaurant, preferences, favoriteRestaurantIds),
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
