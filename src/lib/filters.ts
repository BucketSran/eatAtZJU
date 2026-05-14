import type { PriceRange, Restaurant, RestaurantFilters, SortKey } from '../types'
import { collectHardFilterTags, diningModeTagMap, mealPeriodTagMap, taxonomyTagMap } from '../constants/restaurantTaxonomy'

function normalize(value: string) {
  return value.trim().toLowerCase()
}

function getSearchableTokens(restaurant: Restaurant) {
  return [
    restaurant.name,
    restaurant.area,
    restaurant.cuisine,
    restaurant.reason,
    ...restaurant.tags,
    ...restaurant.suitedFor,
    ...(restaurant.serviceModes ?? []),
    ...(restaurant.mealPeriods ?? []),
    ...(restaurant.scenarioTags ?? []),
    ...(restaurant.constraintTags ?? []),
    ...(restaurant.preferenceTags ?? [])
  ]
}

export function isCanteenRestaurant(restaurant: Restaurant) {
  const text = [
    restaurant.name,
    restaurant.area,
    restaurant.cuisine,
    ...restaurant.tags,
    ...restaurant.suitedFor,
    ...(restaurant.preferenceTags ?? [])
  ].join(' ')
  return /食堂|餐饮中心|校内食堂|学生餐厅|玉湖餐厅|麦香餐厅|风味餐厅|浙江大学.*餐厅|校区.*餐厅/.test(text) && !/咖啡|奶茶|茶饮|甜品/.test(text)
}

function restaurantContainsToken(restaurant: Restaurant, token: string) {
  if (token === '非食堂') return !isCanteenRestaurant(restaurant)
  const mappedTags = taxonomyTagMap[token]
  const candidates = mappedTags?.length ? mappedTags : [token]
  return candidates.some((candidate) => getSearchableTokens(restaurant).some((value) => value.includes(candidate)))
}

export function findPriceRange(priceRanges: PriceRange[], label?: string) {
  if (!label || label === '不限') return undefined
  return priceRanges.find((range) => range.label === label)
}

export function restaurantMatchesKeyword(restaurant: Restaurant, keyword = '') {
  const normalizedKeyword = normalize(keyword)
  if (!normalizedKeyword) return true

  const haystack = getSearchableTokens(restaurant).join(' ').toLowerCase()

  return haystack.includes(normalizedKeyword)
}

export function restaurantMatchesTag(restaurant: Restaurant, tag = '全部') {
  return tag === '全部' || restaurantContainsToken(restaurant, tag)
}

export function restaurantMatchesTags(restaurant: Restaurant, tags: string[] = []) {
  const activeTags = tags.filter((tag) => tag && tag !== '全部')
  return activeTags.every((tag) => restaurantMatchesTag(restaurant, tag))
}

export function restaurantMatchesCategory(restaurant: Restaurant, category?: string, tagMap: Record<string, string[]> = {}) {
  if (!category || category === '全部') return true
  const categoryTags = tagMap[category]
  if (categoryTags && categoryTags.length === 0) return true
  if (!categoryTags?.length) return restaurantMatchesTag(restaurant, category)
  return categoryTags.some((tag) => restaurantMatchesTag(restaurant, tag))
}

function restaurantMatchesStructuredTag(restaurant: Restaurant, tag: string) {
  return [
    ...(restaurant.scenarioTags ?? []),
    ...(restaurant.constraintTags ?? []),
    ...(restaurant.preferenceTags ?? [])
  ].includes(tag)
}

function restaurantMatchesServiceMode(restaurant: Restaurant, serviceMode?: string) {
  if (!serviceMode || serviceMode === '都可以' || serviceMode === '全部') return true
  if (restaurant.serviceModes?.includes(serviceMode)) return true
  return restaurantMatchesCategory(restaurant, serviceMode, diningModeTagMap)
}

function restaurantMatchesMealPeriod(restaurant: Restaurant, mealPeriod?: string) {
  if (!mealPeriod || mealPeriod === '全部') return true
  if (restaurant.mealPeriods?.length) return restaurant.mealPeriods.includes(mealPeriod)
  return restaurantMatchesCategory(restaurant, mealPeriod, mealPeriodTagMap)
}

function restaurantMatchesDistance(restaurant: Restaurant, distanceLabel = '不限') {
  if (distanceLabel === '10分钟内') return restaurant.walkMinutes <= 10
  if (distanceLabel === '20分钟内') return restaurant.walkMinutes <= 20
  return true
}

function restaurantMatchesCampus(restaurant: Restaurant, campus?: string) {
  if (!campus) return true
  if (restaurant.campusLabel === campus || restaurant.campusKey === campus) return true
  return (
    restaurant.area.startsWith(`${campus}校内`) ||
    restaurant.area.startsWith(`${campus}周边`) ||
    restaurant.tags.includes(campus) ||
    restaurant.suitedFor.includes(campus) ||
    (restaurant.reason?.includes(`距离${campus}约`) ?? false) ||
    (restaurant.reason?.includes(`靠近${campus}`) ?? false)
  )
}

export function restaurantMatchesPrice(restaurant: Restaurant, priceRange?: PriceRange) {
  if (!priceRange) return true
  return restaurant.price >= priceRange.min && restaurant.price <= priceRange.max
}

export function filterRestaurants(restaurants: Restaurant[], filters: RestaurantFilters, priceRanges: PriceRange[]) {
  const priceRange = findPriceRange(priceRanges, filters.priceLabel)
  const selectedTags = collectHardFilterTags(filters)
  const fallbackTags = selectedTags.length ? selectedTags : filters.tag ? [filters.tag] : []
  const serviceMode = filters.serviceMode || filters.diningMode
  const wantsNonCanteen = [...selectedTags, ...(filters.preferenceTags ?? [])].includes('非食堂')

  return restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
      (!wantsNonCanteen || !isCanteenRestaurant(restaurant)) &&
      restaurantMatchesCampus(restaurant, filters.campus) &&
      restaurantMatchesKeyword(restaurant, filters.keyword) &&
      restaurantMatchesServiceMode(restaurant, serviceMode) &&
      restaurantMatchesMealPeriod(restaurant, filters.mealPeriod) &&
      restaurantMatchesDistance(restaurant, filters.distanceLabel) &&
      fallbackTags.every((tag) => restaurantMatchesStructuredTag(restaurant, tag) || restaurantMatchesTag(restaurant, tag)) &&
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
