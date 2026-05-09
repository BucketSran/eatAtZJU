export type ReviewStatus = 'approved' | 'pending' | 'rejected'

export type ReviewAvatarSnapshot = {
  color?: string
  preset?: string
  text?: string
  type: 'preset' | 'custom'
  url?: string
}

export type Review = {
  avatarSnapshot?: ReviewAvatarSnapshot
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
