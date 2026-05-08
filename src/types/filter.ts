export type SortKey = 'recommended' | 'distance' | 'rating' | 'price'

export type RestaurantFilters = {
  keyword?: string
  tag?: string
  priceLabel?: string
  sort?: SortKey
}

export type RecommendationContext = {
  preferences: string[]
  favoriteRestaurantIds?: string[]
}
