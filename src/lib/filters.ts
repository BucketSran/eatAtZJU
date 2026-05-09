import type { PriceRange, Restaurant, RestaurantFilters, SortKey } from '../types'
import { collectHardFilterTags, taxonomyTagMap } from '../constants/restaurantTaxonomy'

const diningModeTagMap: Record<string, string[]> = {
  都可以: [],
  堂食: ['校内', '聚餐', '下饭', '拍照', '暖胃', '清真友好'],
  外卖: ['快餐', '一人食', '实惠', '人均30内', '轻负担']
}

const mealPeriodTagMap: Record<string, string[]> = {
  早餐: ['暖胃', '面食', '校内', '近', '清真友好'],
  中餐: ['午餐快吃', '课间午餐', '赶课午餐', '快餐', '实惠', '一人食', '校内', '人均30内'],
  下午茶: ['下午自习', '咖啡', '甜品', '拍照', '轻负担', '嘴馋'],
  晚餐: ['晚饭快吃', '晚饭改善', '晚餐聚餐', '聚餐', '下饭', '辣', '人均50内'],
  夜宵: ['夜宵', '夜宵改善', '晚归加餐', '小吃', '暖胃']
}

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

function restaurantContainsToken(restaurant: Restaurant, token: string) {
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
  if (restaurant.mealPeriods?.includes(mealPeriod)) return true
  return restaurantMatchesCategory(restaurant, mealPeriod, mealPeriodTagMap)
}

function restaurantMatchesDistance(restaurant: Restaurant, distanceLabel = '不限') {
  if (distanceLabel === '10分钟内') return restaurant.walkMinutes <= 10
  if (distanceLabel === '20分钟内') return restaurant.walkMinutes <= 20
  return true
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

  return restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
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
