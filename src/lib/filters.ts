import type { PriceRange, Restaurant, RestaurantFilters, SortKey } from '../types'

function normalize(value: string) {
  return value.trim().toLowerCase()
}

export function findPriceRange(priceRanges: PriceRange[], label?: string) {
  if (!label || label === '不限') return undefined
  return priceRanges.find((range) => range.label === label)
}

export function restaurantMatchesKeyword(restaurant: Restaurant, keyword = '') {
  const normalizedKeyword = normalize(keyword)
  if (!normalizedKeyword) return true

  const haystack = [
    restaurant.name,
    restaurant.area,
    restaurant.cuisine,
    restaurant.reason,
    restaurant.tags.join(' '),
    restaurant.suitedFor.join(' ')
  ]
    .join(' ')
    .toLowerCase()

  return haystack.includes(normalizedKeyword)
}

export function restaurantMatchesTag(restaurant: Restaurant, tag = '全部') {
  return tag === '全部' || restaurant.tags.includes(tag) || restaurant.cuisine.includes(tag) || restaurant.suitedFor.includes(tag)
}

export function restaurantMatchesPrice(restaurant: Restaurant, priceRange?: PriceRange) {
  if (!priceRange) return true
  return restaurant.price >= priceRange.min && restaurant.price <= priceRange.max
}

export function filterRestaurants(restaurants: Restaurant[], filters: RestaurantFilters, priceRanges: PriceRange[]) {
  const priceRange = findPriceRange(priceRanges, filters.priceLabel)

  return restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
      restaurantMatchesKeyword(restaurant, filters.keyword) &&
      restaurantMatchesTag(restaurant, filters.tag) &&
      restaurantMatchesPrice(restaurant, priceRange)
    )
  })
}

export function sortRestaurants<T extends Restaurant & { recommendationScore?: number }>(restaurants: T[], sort: SortKey = 'recommended') {
  return [...restaurants].sort((a, b) => {
    if (sort === 'distance') return a.distance - b.distance
    if (sort === 'rating') return b.rating - a.rating
    if (sort === 'price') return a.price - b.price
    return (b.recommendationScore ?? 0) - (a.recommendationScore ?? 0)
  })
}
