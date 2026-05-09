import type { RecommendationContext, Restaurant, RestaurantSummary } from '../types'

type MatchBreakdown = NonNullable<RestaurantSummary['matchBreakdown']>

function clampScore(value: number) {
  return Math.max(0, Math.min(100, Math.round(value)))
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
  const distanceScore = Math.max(0, 32 - restaurant.distance * 12)
  const priceScore = Math.max(0, 18 - restaurant.price / 5)
  const preferenceScore = Math.min(14, preferenceHit * 5 + constraintHit * 3)
  const publicScore = clampScore(ratingScore + distanceScore + priceScore + preferenceScore + favoriteBoost)
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
