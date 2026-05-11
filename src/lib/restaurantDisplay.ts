import type { RestaurantSummary } from '../types'

export type RestaurantDisplayTone = NonNullable<RestaurantSummary['displayTone']>

export type RestaurantDisplay = {
  categoryIcon: string
  coverBackground: string
  coverIcon: string
  mapIcon: string
  shortName: string
  tone: RestaurantDisplayTone
}

const TONE_BACKGROUNDS: Record<RestaurantDisplayTone, string> = {
  meal: 'linear-gradient(135deg, #ff9f0a, #ff6b2c)',
  drink: 'linear-gradient(135deg, #64d2ff, #007aff)',
  canteen: 'linear-gradient(135deg, #5ac88f, #2f7d58)',
  snack: 'linear-gradient(135deg, #ffd166, #f59e0b)',
  night: 'linear-gradient(135deg, #35324a, #111827)',
  shop: 'linear-gradient(135deg, #af8f62, #6f4d25)'
}

const CATEGORY_ICONS: Record<RestaurantDisplayTone, string> = {
  meal: '饭',
  drink: '饮',
  canteen: '堂',
  snack: '吃',
  night: '夜',
  shop: '店'
}

const VALID_TONES = new Set<RestaurantDisplayTone>(['meal', 'drink', 'canteen', 'snack', 'night', 'shop'])

function hasAny(source: string, keywords: string[]) {
  return keywords.some((keyword) => source.includes(keyword))
}

function resolveTone(restaurant: RestaurantSummary): RestaurantDisplayTone {
  if (restaurant.displayTone && VALID_TONES.has(restaurant.displayTone)) return restaurant.displayTone

  const tagText = restaurant.tags.join(' ')
  const source = `${restaurant.name} ${restaurant.area} ${restaurant.cuisine} ${tagText}`

  if (hasAny(source, ['饮品', '奶茶', '咖啡', '甜品', '下午茶', '茶饮', '果茶'])) return 'drink'
  if (restaurant.tags.includes('食堂') || (restaurant.area.includes('校内') && hasAny(source, ['餐厅', '食堂']))) return 'canteen'
  if (hasAny(source, ['夜宵', '烧烤', '烤串', '串串', '酒馆'])) return 'night'
  if (hasAny(source, ['快餐', '小吃', '面食', '水饺', '馄饨', '炸鸡', '轻食', '便当'])) return 'snack'
  if (restaurant.tags.includes('非食堂')) return 'meal'
  return 'meal'
}

function cleanNameForIcon(name: string) {
  return name
    .replace(/浙江大学/g, '')
    .replace(/[紫金港玉泉西溪华家池之江海宁]+校区/g, '')
    .replace(/[（(][^）)]*[）)]/g, '')
    .replace(/校区/g, '')
    .replace(/餐厅/g, '')
    .replace(/食堂/g, '')
    .replace(/店$/g, '')
    .trim()
}

function pickIdentityIcon(restaurant: RestaurantSummary) {
  const explicitIcon = restaurant.mapIcon || restaurant.displayIcon
  if (explicitIcon?.trim()) return explicitIcon.trim().slice(0, 2)

  const cleanedName = cleanNameForIcon(restaurant.name)
  const chineseChar = cleanedName.match(/[\u4e00-\u9fff]/)?.[0]
  if (chineseChar) return chineseChar

  const latinToken = cleanedName.match(/[A-Za-z0-9]/)?.[0]
  return (latinToken || restaurant.name.slice(0, 1) || '饭').toUpperCase()
}

export function getRestaurantDisplay(restaurant: RestaurantSummary): RestaurantDisplay {
  const tone = resolveTone(restaurant)
  const identityIcon = pickIdentityIcon(restaurant)

  return {
    categoryIcon: CATEGORY_ICONS[tone],
    coverBackground: TONE_BACKGROUNDS[tone],
    coverIcon: restaurant.displayIcon?.trim().slice(0, 2) || identityIcon,
    mapIcon: restaurant.mapIcon?.trim().slice(0, 2) || identityIcon,
    shortName: cleanNameForIcon(restaurant.name) || restaurant.name,
    tone
  }
}

export function getRestaurantScore(restaurant: RestaurantSummary) {
  return Math.round(restaurant.recommendationScore ?? restaurant.rating * 20)
}
