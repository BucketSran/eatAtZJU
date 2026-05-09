export type RestaurantStatus = 'published' | 'draft' | 'archived'

export type Restaurant = {
  id: string
  name: string
  area: string
  distance: number
  walkMinutes: number
  cuisine: string
  price: number
  rating: number
  studentScore: number
  checkins: number
  latitude: number
  longitude: number
  coverIcon: string
  coverColor: string
  tags: string[]
  suitedFor: string[]
  serviceModes?: string[]
  mealPeriods?: string[]
  scenarioTags?: string[]
  constraintTags?: string[]
  preferenceTags?: string[]
  reason: string
  sourceRefs?: unknown[]
  status: RestaurantStatus
}

export type RestaurantSummary = Restaurant & {
  matchBreakdown?: {
    mode: 'cold_start' | 'blended'
    publicScore: number
    publicWeight: number
    studentScore: number
    studentWeight: number
  }
  recommendationScore?: number
  isFavorite?: boolean
}

export type PriceRange = {
  label: string
  min: number
  max: number
}

export type RestaurantsSeed = {
  schemaVersion: number
  restaurants: Restaurant[]
  tasteTags: string[]
  priceRanges: PriceRange[]
}
