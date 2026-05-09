import type { DishesSeed, RestaurantsSeed, ReviewsSeed } from '../types'

let restaurantsPromise: Promise<RestaurantsSeed> | null = null
let dishesPromise: Promise<DishesSeed> | null = null
let reviewsPromise: Promise<ReviewsSeed> | null = null

async function readSeedJson<T>(path: string): Promise<T> {
  const response = await fetch(path, { headers: { accept: 'application/json' } })
  if (!response.ok) throw new Error(`Seed fallback ${path} returned ${response.status}`)
  return (await response.json()) as T
}

function getRestaurantsData() {
  restaurantsPromise ??= readSeedJson<RestaurantsSeed>('/seed/restaurants.json')
  return restaurantsPromise
}

function getDishesData() {
  dishesPromise ??= readSeedJson<DishesSeed>('/seed/dishes.json')
  return dishesPromise
}

function getReviewsData() {
  reviewsPromise ??= readSeedJson<ReviewsSeed>('/seed/reviews.json')
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
