import type { RecommendationContext, Restaurant, RestaurantSummary } from '../types'

type MatchBreakdown = NonNullable<RestaurantSummary['matchBreakdown']>

function clampScore(value: number) {
  return Math.max(0, Math.min(100, Math.round(value)))
}

function isDrinkOrSnack(restaurant: Restaurant) {
  const text = [restaurant.name, restaurant.cuisine, ...restaurant.tags, ...(restaurant.preferenceTags ?? [])].join(' ')
  return /饮品|茶饮|咖啡|奶茶|甜品|烘焙|蛋糕|面包|鲜奶/.test(text)
}

function hasDrinkIntent(preferences: string[]) {
  return preferences.some((tag) => /饮品|茶饮|咖啡|奶茶|甜品|下午茶|拍照|轻负担/.test(tag))
}

function hasMealIntent(preferences: string[]) {
  return preferences.some((tag) => /正餐|早餐|中餐|晚餐|夜宵|下饭|面食|聚餐|一人食|快餐|辣|不辣|食堂|外卖|堂食/.test(tag))
}

function categoryScore(restaurant: Restaurant, preferences: string[]) {
  const drinkOrSnack = isDrinkOrSnack(restaurant)
  if (drinkOrSnack && hasDrinkIntent(preferences) && !hasMealIntent(preferences)) return 8
  if (drinkOrSnack && hasMealIntent(preferences)) return -22
  if (drinkOrSnack) return -16
  return 8
}

export function scoreRestaurantBreakdown(restaurant: Restaurant, context: RecommendationContext = { preferences: [] }): MatchBreakdown {
  const preferences = context.preferences ?? []
  const favoriteRestaurantIds = context.favoriteRestaurantIds ?? []
  const preferenceTokens = new Set([
    ...restaurant.tags,
    ...restaurant.suitedFor,
    ...(restaurant.serviceModes ?? []),
    ...(restaurant.mealPeriods ?? []),
    ...(restaurant.scenarioTags ?? []),
    ...(restaurant.preferenceTags ?? [])
  ])
  const constraintTokens = new Set(restaurant.constraintTags ?? [])
  const preferenceHit = preferences.filter((tag) => preferenceTokens.has(tag)).length
  const constraintHit = preferences.filter((tag) => constraintTokens.has(tag)).length
  const favoriteBoost = favoriteRestaurantIds.includes(restaurant.id) ? 6 : 0
  const ratingScore = (restaurant.rating / 5) * 36
  const campusDistance = restaurant.campusDistance ?? restaurant.distance
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

export function scoreRestaurant(restaurant: Restaurant, context: RecommendationContext = { preferences: [] }) {
  const breakdown = scoreRestaurantBreakdown(restaurant, context)
  return clampScore(breakdown.studentScore * breakdown.studentWeight + breakdown.publicScore * breakdown.publicWeight)
}

export function attachRecommendationScore(restaurants: Restaurant[], context: RecommendationContext): RestaurantSummary[] {
  return restaurants.map((restaurant) => {
    const matchBreakdown = scoreRestaurantBreakdown(restaurant, context)
    return {
      ...restaurant,
      matchBreakdown,
      recommendationScore: clampScore(matchBreakdown.studentScore * matchBreakdown.studentWeight + matchBreakdown.publicScore * matchBreakdown.publicWeight)
    }
  })
}

export function pickRecommendedRestaurant(restaurants: RestaurantSummary[]) {
  if (!restaurants.length) return null
  return [...restaurants].sort((a, b) => (b.recommendationScore ?? 0) - (a.recommendationScore ?? 0))[0]
}

export function pickRandomRestaurant(restaurants: RestaurantSummary[]) {
  if (!restaurants.length) return null
  const index = Math.floor(Math.random() * restaurants.length)
  return restaurants[index]
}
