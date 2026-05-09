export type SortKey = 'recommended' | 'distance' | 'rating' | 'price'

export type RestaurantFilters = {
  keyword?: string
  tag?: string
  tags?: string[]
  serviceMode?: string
  diningMode?: string
  mealPeriod?: string
  scenarioTags?: string[]
  dietaryTags?: string[]
  preferenceTags?: string[]
  distanceLabel?: string
  spiceLevel?: string
  loadLevel?: string
  priceLabel?: string
  sort?: SortKey
}

export type RecommendationContext = {
  preferences: string[]
  favoriteRestaurantIds?: string[]
}
