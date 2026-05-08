import { filterRestaurants, sortRestaurants } from '../lib/filters'
import { attachRecommendationScore, pickRandomRestaurant, pickRecommendedRestaurant } from '../lib/recommendation'
import type { RecommendationContext, RestaurantFilters, RestaurantSummary } from '../types'
import { getFavoriteRestaurantIds } from './favoriteStore'
import { listSeedDishes, listSeedRestaurants, listSeedReviews, getSeedMetadata, getSeedRestaurant } from './seedRepository'

function getContext(context?: Partial<RecommendationContext>): RecommendationContext {
  return {
    preferences: context?.preferences ?? [],
    favoriteRestaurantIds: context?.favoriteRestaurantIds ?? getFavoriteRestaurantIds()
  }
}

function markFavorites(restaurants: RestaurantSummary[], favoriteRestaurantIds: string[]) {
  return restaurants.map((restaurant) => ({
    ...restaurant,
    isFavorite: favoriteRestaurantIds.includes(restaurant.id)
  }))
}

export function getRestaurantMetadata() {
  return getSeedMetadata()
}

export function listRestaurants(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>) {
  const metadata = getSeedMetadata()
  const resolvedContext = getContext(context)
  const filtered = filterRestaurants(listSeedRestaurants(), filters, metadata.priceRanges)
  const scored = attachRecommendationScore(filtered, resolvedContext)
  const sorted = sortRestaurants(scored, filters.sort)
  return markFavorites(sorted, resolvedContext.favoriteRestaurantIds ?? [])
}

export function getRestaurantDetail(id: string, context?: Partial<RecommendationContext>) {
  const restaurant = getSeedRestaurant(id)
  if (!restaurant || restaurant.status !== 'published') return null

  const resolvedContext = getContext(context)
  const [summary] = markFavorites(attachRecommendationScore([restaurant], resolvedContext), resolvedContext.favoriteRestaurantIds ?? [])
  return {
    restaurant: summary,
    dishes: listSeedDishes().filter((dish) => dish.restaurantId === id && dish.status === 'published'),
    reviews: listSeedReviews().filter((review) => review.restaurantId === id && review.status === 'approved')
  }
}

export function getFavoriteRestaurants(context?: Partial<RecommendationContext>) {
  const favoriteRestaurantIds = context?.favoriteRestaurantIds ?? getFavoriteRestaurantIds()
  return listRestaurants({}, { ...context, favoriteRestaurantIds }).filter((restaurant) => favoriteRestaurantIds.includes(restaurant.id))
}

export function getRecommendedRestaurant(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>) {
  return pickRecommendedRestaurant(listRestaurants(filters, context))
}

export function getRandomRestaurant(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>) {
  return pickRandomRestaurant(listRestaurants(filters, context))
}
