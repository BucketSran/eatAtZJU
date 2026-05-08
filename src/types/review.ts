export type ReviewStatus = 'approved' | 'pending' | 'rejected'

export type Review = {
  id: string
  restaurantId: string
  userName: string
  text: string
  rating: number
  status: ReviewStatus
}

export type ReviewsSeed = {
  schemaVersion: number
  reviews: Review[]
}
