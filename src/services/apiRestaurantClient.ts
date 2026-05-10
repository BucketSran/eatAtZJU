import type { Dish, PriceRange, RecommendationContext, RestaurantFilters, RestaurantSummary, Review } from '../types'
import { collectHardFilterTags } from '../constants/restaurantTaxonomy'

export type ApiSource = 'supabase' | 'seed' | 'local-seed'

export type RestaurantDetail = {
  restaurant: RestaurantSummary
  dishes: Dish[]
  reviews: Review[]
}

type ApiMetadata = {
  schemaVersion: number
  tasteTags: string[]
  priceRanges: PriceRange[]
}

type RestaurantListResponse = {
  restaurants: RestaurantSummary[]
  metadata: ApiMetadata
  source?: ApiSource
  fallbackReason?: string
}

type RestaurantDetailResponse = RestaurantDetail & {
  source?: ApiSource
  fallbackReason?: string
}

type RecommendationResponse = {
  restaurant: RestaurantSummary
  strategy: 'recommended' | 'random'
  source?: ApiSource
  fallbackReason?: string
}

type ApiErrorBody = {
  error?: string
  source?: ApiSource
}

export type ApiResult<T> = {
  data: T
  source: ApiSource
  fallbackReason?: string
}

export class ApiHttpError extends Error {
  body?: ApiErrorBody
  status: number

  constructor(path: string, status: number, body?: ApiErrorBody) {
    super(`API ${path} returned ${status}`)
    this.name = 'ApiHttpError'
    this.status = status
    this.body = body
  }
}

const API_CACHE_TTL_MS = 20_000
const responseCache = new Map<string, { expiresAt: number; promise?: Promise<unknown>; value?: unknown }>()

function getApiBaseUrl() {
  return import.meta.env.VITE_API_BASE_URL || ''
}

function appendListParam(params: URLSearchParams, key: string, values?: string[]) {
  if (values?.length) params.set(key, values.join(','))
}

function buildRestaurantParams(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>) {
  const params = new URLSearchParams()
  if (filters.keyword) params.set('keyword', filters.keyword)
  const tags = collectHardFilterTags(filters)
  appendListParam(params, 'tags', tags)
  if (!filters.tags?.length && filters.tag && filters.tag !== '全部') params.set('tag', filters.tag)
  if (filters.campus) params.set('campus', filters.campus)
  if (filters.serviceMode && filters.serviceMode !== '都可以') params.set('mode', filters.serviceMode)
  if (!filters.serviceMode && filters.diningMode && filters.diningMode !== '全部') params.set('mode', filters.diningMode)
  if (filters.mealPeriod && filters.mealPeriod !== '全部') params.set('meal', filters.mealPeriod)
  if (filters.distanceLabel && filters.distanceLabel !== '不限') params.set('distance', filters.distanceLabel)
  if (filters.priceLabel && filters.priceLabel !== '不限') params.set('priceLabel', filters.priceLabel)
  if (filters.sort && filters.sort !== 'recommended') params.set('sort', filters.sort)
  appendListParam(params, 'preferences', context?.preferences)
  appendListParam(params, 'favorites', context?.favoriteRestaurantIds)
  return params
}

function createAbortError() {
  return new DOMException('Aborted', 'AbortError')
}

function withAbort<T>(promise: Promise<T>, signal?: AbortSignal) {
  if (!signal) return promise
  if (signal.aborted) return Promise.reject(createAbortError())

  return new Promise<T>((resolve, reject) => {
    const onAbort = () => reject(createAbortError())
    signal.addEventListener('abort', onAbort, { once: true })
    promise.then(
      (value) => {
        signal.removeEventListener('abort', onAbort)
        resolve(value)
      },
      (error) => {
        signal.removeEventListener('abort', onAbort)
        reject(error)
      }
    )
  })
}

async function fetchJson<T>(path: string, params: URLSearchParams, signal?: AbortSignal) {
  const query = params.toString()
  const url = `${getApiBaseUrl()}${path}${query ? `?${query}` : ''}`
  const cacheKey = url
  const now = Date.now()
  const cached = responseCache.get(cacheKey)

  if (cached && cached.expiresAt > now) {
    if (cached.value !== undefined) return withAbort(Promise.resolve(cached.value as T), signal)
    if (cached.promise) return withAbort(cached.promise as Promise<T>, signal)
  }

  const request = fetch(url, {
    headers: { accept: 'application/json' }
  })
    .then(async (response) => {
      if (!response.ok) {
        const body = (await response.json().catch(() => undefined)) as ApiErrorBody | undefined
        throw new ApiHttpError(path, response.status, body)
      }
      return (await response.json()) as T
    })
    .then((body) => {
      responseCache.set(cacheKey, { expiresAt: Date.now() + API_CACHE_TTL_MS, value: body })
      return body
    })
    .catch((error) => {
      responseCache.delete(cacheKey)
      throw error
    })

  responseCache.set(cacheKey, { expiresAt: now + API_CACHE_TTL_MS, promise: request })
  return withAbort(request, signal)
}

export async function fetchRestaurants(filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>, signal?: AbortSignal): Promise<ApiResult<RestaurantSummary[]>> {
  const body = await fetchJson<RestaurantListResponse>('/api/restaurants', buildRestaurantParams(filters, context), signal)
  return {
    data: body.restaurants,
    source: body.source || 'supabase',
    fallbackReason: body.fallbackReason
  }
}

export async function fetchRestaurantDetail(id: string, context?: Partial<RecommendationContext>, signal?: AbortSignal): Promise<ApiResult<RestaurantDetail | null>> {
  const params = buildRestaurantParams({}, context)
  const body = await fetchJson<RestaurantDetailResponse>(`/api/restaurants/${encodeURIComponent(id)}`, params, signal)
  return {
    data: {
      restaurant: body.restaurant,
      dishes: body.dishes,
      reviews: body.reviews
    },
    source: body.source || 'supabase',
    fallbackReason: body.fallbackReason
  }
}

export async function fetchTodayRecommendation(strategy: 'recommended' | 'random', filters: RestaurantFilters = {}, context?: Partial<RecommendationContext>, signal?: AbortSignal): Promise<ApiResult<RestaurantSummary | null>> {
  const params = buildRestaurantParams(filters, context)
  params.set('strategy', strategy)
  const body = await fetchJson<RecommendationResponse>('/api/recommend/today', params, signal)
  return {
    data: body.restaurant,
    source: body.source || 'supabase',
    fallbackReason: body.fallbackReason
  }
}
