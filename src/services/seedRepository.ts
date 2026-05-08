import dishesSeed from '../../seed/dishes.json'
import restaurantsSeed from '../../seed/restaurants.json'
import reviewsSeed from '../../seed/reviews.json'
import type { DishesSeed, RestaurantsSeed, ReviewsSeed } from '../types'

const restaurantData = restaurantsSeed as RestaurantsSeed
const dishData = dishesSeed as DishesSeed
const reviewData = reviewsSeed as ReviewsSeed

export function listSeedRestaurants() {
  return restaurantData.restaurants
}

export function listSeedDishes() {
  return dishData.dishes
}

export function listSeedReviews() {
  return reviewData.reviews
}

export function getSeedRestaurant(id: string) {
  return restaurantData.restaurants.find((restaurant) => restaurant.id === id) ?? null
}

export function getSeedMetadata() {
  return {
    schemaVersion: restaurantData.schemaVersion,
    tasteTags: restaurantData.tasteTags,
    priceRanges: restaurantData.priceRanges
  }
}
