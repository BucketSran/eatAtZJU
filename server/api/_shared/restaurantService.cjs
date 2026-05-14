const restaurantsSeed = require('../../../seed/restaurants.json')
const dishesSeed = require('../../../seed/dishes.json')
const reviewsSeed = require('../../../seed/reviews.json')
const taxonomyData = require('../../../src/shared/restaurantTaxonomyData.json')
const { getRandomIndex } = require('./random.cjs')

const { taxonomyTagMap, diningModeTagMap, mealPeriodTagMap } = taxonomyData

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

function isCanteenRestaurant(restaurant) {
  const text = [
    restaurant.name,
    restaurant.area,
    restaurant.cuisine,
    ...(restaurant.tags || []),
    ...(restaurant.suitedFor || []),
    ...(restaurant.preferenceTags || [])
  ].join(' ')
  return /食堂|餐饮中心|校内食堂|学生餐厅|玉湖餐厅|麦香餐厅|风味餐厅|浙江大学.*餐厅|校区.*餐厅/.test(text) && !/咖啡|奶茶|茶饮|甜品/.test(text)
}

function hasDrinkIntent(preferences) {
  return preferences.some((tag) => /饮品|茶饮|咖啡|奶茶|甜品|下午茶|拍照|轻负担/.test(tag))
}

function hasMealIntent(preferences) {
  return preferences.some((tag) => /正餐|早餐|中餐|晚餐|夜宵|下饭|面食|聚餐|一人食|快餐|辣|不辣|食堂|非食堂|外卖|堂食/.test(tag))
}

function isNotRecommended(restaurant) {
  return [
    ...(restaurant.tags || []),
    ...(restaurant.suitedFor || []),
    ...(restaurant.scenarioTags || []),
    ...(restaurant.constraintTags || []),
    ...(restaurant.preferenceTags || [])
  ].includes('不主推')
}

function categoryScore(restaurant, preferences) {
  if (isNotRecommended(restaurant)) return -60
  const drinkOrSnack = isDrinkOrSnackRestaurant(restaurant)
  const canteen = isCanteenRestaurant(restaurant)
  if (drinkOrSnack && hasDrinkIntent(preferences) && !hasMealIntent(preferences)) return 8
  if (drinkOrSnack && hasMealIntent(preferences)) return -22
  if (drinkOrSnack) return -16
  if (preferences.includes('非食堂') && canteen) return -28
  if (preferences.includes('食堂') && canteen) return 10
  return 8
}

function preferenceMatchesTokens(preference, tokens) {
  const mappedTags = taxonomyTagMap[preference]
  const candidates = mappedTags && mappedTags.length ? mappedTags : [preference]
  return candidates.some((candidate) => tokens.some((token) => String(token).includes(candidate)))
}

function scoreRestaurantBreakdown(restaurant, preferences = [], favoriteRestaurantIds = []) {
  const preferenceTokens = [
    ...(restaurant.tags || []),
    ...(restaurant.suitedFor || []),
    ...(restaurant.serviceModes || []),
    ...(restaurant.mealPeriods || []),
    ...(restaurant.scenarioTags || []),
    ...(restaurant.preferenceTags || [])
  ]
  const constraintTokens = new Set(restaurant.constraintTags || [])
  const preferenceHit = preferences.filter((tag) => preferenceMatchesTokens(tag, preferenceTokens)).length
  const constraintHit = preferences.filter((tag) => constraintTokens.has(tag)).length
  const favoriteBoost = favoriteRestaurantIds.includes(restaurant.id) ? 6 : 0
  const ratingScore = (restaurant.rating / 5) * 36
  const campusDistance = restaurant.campusDistance || restaurant.distance
  const distanceScore = Math.max(0, 32 - campusDistance * 12)
  const priceScore = Math.max(0, 18 - restaurant.price / 5)
  const preferenceScore = Math.min(14, preferenceHit * 5 + constraintHit * 3)
  const categoryBoost = categoryScore(restaurant, preferences)
  const publicScore = clampScore(ratingScore + distanceScore + priceScore + preferenceScore + favoriteBoost + categoryBoost)
  const hasStudentSignal = restaurant.studentScore > 0 || restaurant.checkins > 0
  const studentScore = hasStudentSignal
    ? clampScore(restaurant.studentScore * 0.75 + Math.min(100, restaurant.checkins / 2) * 0.25 + favoriteBoost)
    : 0

  return {
    mode: hasStudentSignal ? 'blended' : 'cold_start',
    publicScore,
    publicWeight: hasStudentSignal ? 0.2 : 1,
    studentScore,
    studentWeight: hasStudentSignal ? 0.8 : 0,
    ratingScore: clampScore(ratingScore),
    distanceScore: clampScore(distanceScore),
    priceScore: clampScore(priceScore),
    preferenceScore: clampScore(preferenceScore),
    categoryScore: categoryBoost,
    favoriteBoost
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
  if (token === '非食堂') return !isCanteenRestaurant(restaurant)
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
  if (restaurant.campusLabel === campus || restaurant.campusKey === campus) return true
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
  const activeTags = selectedTags.length ? selectedTags : fallbackTag
  const wantsNonCanteen = [...activeTags, ...preferences].includes('非食堂')
  const filtered = restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
      (!wantsNonCanteen || !isCanteenRestaurant(restaurant)) &&
      matchesCampus(restaurant, query.campus) &&
      matchesKeyword(restaurant, query.keyword) &&
      matchesServiceMode(restaurant, query.mode) &&
      matchesMealPeriod(restaurant, query.meal) &&
      matchesDistance(restaurant, query.distance) &&
      activeTags.every((tag) => matchesStructuredTag(restaurant, tag) || matchesTag(restaurant, tag)) &&
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
  return restaurants[getRandomIndex(restaurants.length)]
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
