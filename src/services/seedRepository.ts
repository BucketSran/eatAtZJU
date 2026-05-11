import type { DishesSeed, RestaurantsSeed, ReviewsSeed } from '../types'

let restaurantsPromise: Promise<RestaurantsSeed> | null = null
let dishesPromise: Promise<DishesSeed> | null = null
let reviewsPromise: Promise<ReviewsSeed> | null = null
let restaurantsCache: RestaurantsSeed | null = null
let dishesCache: DishesSeed | null = null
let reviewsCache: ReviewsSeed | null = null

async function readSeedJson<T>(path: string): Promise<T> {
  const response = await fetch(path, { headers: { accept: 'application/json' } })
  if (!response.ok) throw new Error(`Seed fallback ${path} returned ${response.status}`)
  return (await response.json()) as T
}

function getRestaurantsData() {
  restaurantsPromise ??= readSeedJson<RestaurantsSeed>('/seed/restaurants.json').then((data) => {
    restaurantsCache = data
    return data
  })
  return restaurantsPromise
}

function getDishesData() {
  dishesPromise ??= readSeedJson<DishesSeed>('/seed/dishes.json').then((data) => {
    dishesCache = data
    return data
  })
  return dishesPromise
}

function getReviewsData() {
  reviewsPromise ??= readSeedJson<ReviewsSeed>('/seed/reviews.json').then((data) => {
    reviewsCache = data
    return data
  })
  return reviewsPromise
}

export async function listSeedRestaurants() {
  const data = await getRestaurantsData()
  return data.restaurants
}

export async function listSeedDishes() {
  const data = await getDishesData()
  return data.dishes
}

export async function listSeedReviews() {
  const data = await getReviewsData()
  return data.reviews
}

export async function getSeedRestaurant(id: string) {
  const data = await getRestaurantsData()
  return data.restaurants.find((restaurant) => restaurant.id === id) ?? null
}

export async function getSeedMetadata() {
  const data = await getRestaurantsData()
  return {
    schemaVersion: data.schemaVersion,
    tasteTags: data.tasteTags,
    priceRanges: data.priceRanges
  }
}

export function peekSeedRestaurants() {
  return restaurantsCache?.restaurants ?? []
}

export function peekSeedDishes() {
  return dishesCache?.dishes ?? []
}

export function peekSeedReviews() {
  return reviewsCache?.reviews ?? []
}

export function peekSeedMetadata() {
  if (!restaurantsCache) return null
  return {
    schemaVersion: restaurantsCache.schemaVersion,
    tasteTags: restaurantsCache.tasteTags,
    priceRanges: restaurantsCache.priceRanges
  }
}
