export type DishStatus = 'published' | 'draft' | 'archived'

export type Dish = {
  id: string
  restaurantId: string
  name: string
  price: number
  heat: number
  status: DishStatus
}

export type DishesSeed = {
  schemaVersion: number
  dishes: Dish[]
}
