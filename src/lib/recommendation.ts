import type { RecommendationContext, Restaurant, RestaurantSummary } from '../types'

export function scoreRestaurant(restaurant: Restaurant, context: RecommendationContext = { preferences: [] }) {
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
  const favoriteBoost = favoriteRestaurantIds.includes(restaurant.id) ? 10 : 0
  const ratingScore = restaurant.rating * 12
  const studentScore = restaurant.studentScore * 0.35
  const distanceScore = Math.max(0, 30 - restaurant.distance * 8)
  const checkinScore = Math.min(18, restaurant.checkins / 35)

  return Math.round(ratingScore + studentScore + distanceScore + checkinScore + preferenceHit * 12 + constraintHit * 6 + favoriteBoost)
}

export function attachRecommendationScore(restaurants: Restaurant[], context: RecommendationContext): RestaurantSummary[] {
  return restaurants.map((restaurant) => ({
    ...restaurant,
    recommendationScore: scoreRestaurant(restaurant, context)
  }))
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
