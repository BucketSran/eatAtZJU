import { filterRestaurants, sortRestaurants } from '../lib/filters'
import { attachRecommendationScore, pickRandomRestaurant, pickRecommendedRestaurant } from '../lib/recommendation'
import type { PriceRange, RecommendationContext, RestaurantFilters, RestaurantSummary } from '../types'
import { ApiHttpError, fetchRestaurantDetail, fetchRestaurants, fetchTodayRecommendation, type ApiResult, type ApiSource, type RestaurantDetail } from './apiRestaurantClient'
import { getFavoriteRestaurantIds } from './favoriteStore'
import { peekSeedDishes, peekSeedMetadata, peekSeedRestaurants, peekSeedReviews } from './seedRepository'

const fallbackMetadata = {
  schemaVersion: 1,
  tasteTags: ['全部', '正餐', '饮品', '近', '实惠', '辣', '不辣', '夜宵', '一人食', '聚餐', '校内', '面食', '暖胃', '下饭', '快餐', '拍照', '轻负担', '清真友好', '咖啡', '甜品', '奶茶', '烧烤', '火锅', '食堂', '非食堂', '异国料理'],
  priceRanges: [
    { label: '不限', min: 0, max: 999 },
    { label: '30以内', min: 0, max: 30 },
    { label: '30-50', min: 31, max: 50 },
    { label: '50+', min: 51, max: 999 }
  ] satisfies PriceRange[]
}

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
  return peekSeedMetadata() ?? fallbackMetadata
}

export function listRestaurants(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>): RestaurantSummary[] {
  const seedRestaurants = peekSeedRestaurants()
  if (!seedRestaurants.length) return []
  const resolvedContext = getContext(context)
  const metadata = peekSeedMetadata() ?? fallbackMetadata
  const filtered = filterRestaurants(seedRestaurants, filters, metadata.priceRanges)
  const scored = attachRecommendationScore(filtered, resolvedContext)
  const sorted = sortRestaurants(scored, filters.sort)
  return markFavorites(sorted, resolvedContext.favoriteRestaurantIds ?? [])
}

export function getRestaurantDetail(id: string, context?: Partial<RecommendationContext>): RestaurantDetail | null {
  const seedRestaurants = peekSeedRestaurants()
  const restaurant = seedRestaurants.find((item) => item.id === id && item.status === 'published')
  if (!restaurant) return null

  const resolvedContext = getContext(context)
  const [summary] = markFavorites(attachRecommendationScore([restaurant], resolvedContext), resolvedContext.favoriteRestaurantIds ?? [])
  return {
    restaurant: summary,
    dishes: peekSeedDishes().filter((dish) => dish.restaurantId === id && dish.status === 'published'),
    reviews: peekSeedReviews().filter((review) => review.restaurantId === id && review.status === 'approved')
  }
}

async function listRestaurantsFromSeed(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>) {
  const [{ listSeedRestaurants, getSeedMetadata }] = await Promise.all([import('./seedRepository')])
  const [seedRestaurants, metadata] = await Promise.all([listSeedRestaurants(), getSeedMetadata()])
  const resolvedContext = getContext(context)
  const filtered = filterRestaurants(seedRestaurants, filters, metadata.priceRanges)
  const scored = attachRecommendationScore(filtered, resolvedContext)
  const sorted = sortRestaurants(scored, filters.sort)
  return markFavorites(sorted, resolvedContext.favoriteRestaurantIds ?? [])
}

async function getRestaurantDetailFromSeed(id: string, context?: Partial<RecommendationContext>) {
  const { getSeedRestaurant, listSeedDishes, listSeedReviews } = await import('./seedRepository')
  const restaurant = await getSeedRestaurant(id)
  if (!restaurant || restaurant.status !== 'published') return null

  const resolvedContext = getContext(context)
  const [summary] = markFavorites(attachRecommendationScore([restaurant], resolvedContext), resolvedContext.favoriteRestaurantIds ?? [])
  const [dishes, reviews] = await Promise.all([listSeedDishes(), listSeedReviews()])
  return {
    restaurant: summary,
    dishes: dishes.filter((dish) => dish.restaurantId === id && dish.status === 'published'),
    reviews: reviews.filter((review) => review.restaurantId === id && review.status === 'approved')
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
    return localResult(await listRestaurantsFromSeed(filters, context))
  }
}

export async function getRestaurantDetailRemote(id: string, context?: Partial<RecommendationContext>, signal?: AbortSignal): Promise<ApiResult<RestaurantDetail | null>> {
  try {
    return await fetchRestaurantDetail(id, context, signal)
  } catch (error) {
    if (isAbortError(error)) throw error
    if (isAuthoritativeSupabaseMiss(error)) return supabaseNullResult<RestaurantDetail>()
    return localResult(await getRestaurantDetailFromSeed(id, context))
  }
}

export function getFavoriteRestaurants(context?: Partial<RecommendationContext>): RestaurantSummary[] {
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

export function getRecommendedRestaurant(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>): RestaurantSummary | null {
  return pickRecommendedRestaurant(listRestaurants(filters, context))
}

export async function getRecommendedRestaurantRemote(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>, signal?: AbortSignal) {
  try {
    return await fetchTodayRecommendation('recommended', filters, context, signal)
  } catch (error) {
    if (isAbortError(error)) throw error
    if (isAuthoritativeSupabaseMiss(error)) return supabaseNullResult<RestaurantSummary>()
    return localResult(pickRecommendedRestaurant(await listRestaurantsFromSeed(filters, context)))
  }
}

export function getRandomRestaurant(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>): RestaurantSummary | null {
  return pickRandomRestaurant(listRestaurants(filters, context))
}

export async function getRandomRestaurantRemote(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>, signal?: AbortSignal): Promise<ApiResult<RestaurantSummary | null>> {
  try {
    return await fetchTodayRecommendation('random', filters, context, signal)
  } catch (error) {
    if (isAbortError(error)) throw error
    if (isAuthoritativeSupabaseMiss(error)) return supabaseNullResult<RestaurantSummary>()
    return localResult(pickRandomRestaurant(await listRestaurantsFromSeed(filters, context)))
  }
}

export function describeApiSource(source?: ApiSource, fallbackReason?: string) {
  if (source === 'supabase') return '餐厅资料已更新'
  if (source === 'seed') return fallbackReason === 'supabase_not_configured' ? '正在使用已收录资料' : '餐厅资料已准备好'
  return '网络不稳，先展示已收录资料'
}
