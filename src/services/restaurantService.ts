import { filterRestaurants, sortRestaurants } from '../lib/filters'
import { attachRecommendationScore, pickRandomRestaurant, pickRecommendedRestaurant } from '../lib/recommendation'
import type { RecommendationContext, RestaurantFilters, RestaurantSummary } from '../types'
import { ApiHttpError, fetchRestaurantDetail, fetchRestaurants, fetchTodayRecommendation, type ApiResult, type ApiSource, type RestaurantDetail } from './apiRestaurantClient'
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

function localResult<T>(data: T): ApiResult<T> {
  return {
    data,
    source: 'local-seed'
  }
}

function supabaseNullResult<T>(): ApiResult<T | null> {
  return {
    data: null,
    source: 'supabase'
  }
}

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

function isAuthoritativeSupabaseMiss(error: unknown) {
  return error instanceof ApiHttpError && error.status === 404 && error.body?.source === 'supabase'
}

export async function listRestaurantsRemote(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>, signal?: AbortSignal) {
  try {
    return await fetchRestaurants(filters, context, signal)
  } catch (error) {
    if (isAbortError(error)) throw error
    return localResult(listRestaurants(filters, context))
  }
}

export async function getRestaurantDetailRemote(id: string, context?: Partial<RecommendationContext>, signal?: AbortSignal): Promise<ApiResult<RestaurantDetail | null>> {
  try {
    return await fetchRestaurantDetail(id, context, signal)
  } catch (error) {
    if (isAbortError(error)) throw error
    if (isAuthoritativeSupabaseMiss(error)) return supabaseNullResult<RestaurantDetail>()
    return localResult(getRestaurantDetail(id, context))
  }
}

export function getFavoriteRestaurants(context?: Partial<RecommendationContext>) {
  const favoriteRestaurantIds = context?.favoriteRestaurantIds ?? getFavoriteRestaurantIds()
  return listRestaurants({}, { ...context, favoriteRestaurantIds }).filter((restaurant) => favoriteRestaurantIds.includes(restaurant.id))
}

export async function getFavoriteRestaurantsRemote(context?: Partial<RecommendationContext>, signal?: AbortSignal) {
  const favoriteRestaurantIds = context?.favoriteRestaurantIds ?? getFavoriteRestaurantIds()
  const result = await listRestaurantsRemote({}, { ...context, favoriteRestaurantIds }, signal)
  return {
    ...result,
    data: result.data.filter((restaurant) => favoriteRestaurantIds.includes(restaurant.id))
  }
}

export function getRecommendedRestaurant(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>) {
  return pickRecommendedRestaurant(listRestaurants(filters, context))
}

export async function getRecommendedRestaurantRemote(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>, signal?: AbortSignal) {
  try {
    return await fetchTodayRecommendation('recommended', filters, context, signal)
  } catch (error) {
    if (isAbortError(error)) throw error
    if (isAuthoritativeSupabaseMiss(error)) return supabaseNullResult<RestaurantSummary>()
    return localResult(getRecommendedRestaurant(filters, context))
  }
}

export function getRandomRestaurant(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>) {
  return pickRandomRestaurant(listRestaurants(filters, context))
}

export async function getRandomRestaurantRemote(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>, signal?: AbortSignal): Promise<ApiResult<RestaurantSummary | null>> {
  try {
    return await fetchTodayRecommendation('random', filters, context, signal)
  } catch (error) {
    if (isAbortError(error)) throw error
    if (isAuthoritativeSupabaseMiss(error)) return supabaseNullResult<RestaurantSummary>()
    return localResult(getRandomRestaurant(filters, context))
  }
}

export function describeApiSource(source?: ApiSource, fallbackReason?: string) {
  if (source === 'supabase') return '数据来自 Supabase'
  if (source === 'seed') return fallbackReason === 'supabase_not_configured' ? '后端未配置 Supabase，使用 seed fallback' : '后端使用 seed fallback'
  return '本地 seed fallback'
}
