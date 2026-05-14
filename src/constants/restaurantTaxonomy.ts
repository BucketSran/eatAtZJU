import taxonomyData from '../shared/restaurantTaxonomyData.json'

export type CampusOption = '紫金港' | '玉泉' | '西溪' | '华家池' | '之江' | '海宁'
export type MealCategoryOption = '正餐' | '饮品' | '全部'
export type DiscoverFilterSceneId = 'quick-meal' | 'delivery' | 'non-canteen' | 'late-night' | 'drinks' | 'group' | 'solo'
export type ProfilePreferenceSceneId = 'fast' | 'no-canteen' | 'solo' | 'group' | 'night' | 'drinks'

type CampusCenter = { latitude: number; longitude: number; dataStatus: 'ready' | 'collecting' }
type MealCategoryOptionItem = { label: string; value: MealCategoryOption }
type TagGroup = { title: string; hint: string; tags: string[]; maxVisible?: number }
type FilterGroup = { key: 'distanceLabel' | 'spiceLevel' | 'loadLevel'; title: string; hint: string; options: string[] }
type ProfilePreferenceScene = {
  id: ProfilePreferenceSceneId
  label: string
  description: string
  tags: string[]
}
type DiscoverFilterScene = {
  id: DiscoverFilterSceneId
  label: string
  description: string
  defaults: Partial<{
    mealCategory: MealCategoryOption
    serviceMode: string
    mealPeriod: string
    scenarioTags: string[]
    preferenceTags: string[]
  }>
  focus: string[]
  quickTags: string[]
}

type TaxonomyData = {
  serviceModeOptions: string[]
  mealPeriodOptions: string[]
  campusOptions: CampusOption[]
  mealCategoryOptions: MealCategoryOptionItem[]
  campusCenters: Record<CampusOption, CampusCenter>
  hardQueryTags: string[]
  softRankingTags: string[]
  quickRandomTags: string[]
  quickRandomExclusiveGroups: string[][]
  scenarioTagGroups: TagGroup[]
  hardFilterGroups: FilterGroup[]
  discoverFilterScenes: DiscoverFilterScene[]
  dietaryConstraintTags: string[]
  preferenceTagGroups: TagGroup[]
  profilePreferenceScenes: ProfilePreferenceScene[]
  preferenceExclusiveGroups: string[][]
  publicDisplayTagPriority: string[]
  taxonomyTagMap: Record<string, string[]>
  diningModeTagMap: Record<string, string[]>
  mealPeriodTagMap: Record<string, string[]>
}

const data = taxonomyData as TaxonomyData

export const serviceModeOptions = data.serviceModeOptions
export const mealPeriodOptions = data.mealPeriodOptions
export const campusOptions = data.campusOptions
export const mealCategoryOptions = data.mealCategoryOptions
export const campusCenters = data.campusCenters
export const hardQueryTags = data.hardQueryTags
export const softRankingTags = data.softRankingTags
export const quickRandomTags = data.quickRandomTags
export const quickRandomExclusiveGroups = data.quickRandomExclusiveGroups
export const scenarioTagGroups = data.scenarioTagGroups
export const hardFilterGroups = data.hardFilterGroups
export const discoverFilterScenes = data.discoverFilterScenes
export const dietaryConstraintTags = data.dietaryConstraintTags
export const preferenceTagGroups = data.preferenceTagGroups
export const profilePreferenceScenes = data.profilePreferenceScenes
export const preferenceExclusiveGroups = data.preferenceExclusiveGroups
export const publicDisplayTagPriority = data.publicDisplayTagPriority
export const taxonomyTagMap = data.taxonomyTagMap
export const diningModeTagMap = data.diningModeTagMap
export const mealPeriodTagMap = data.mealPeriodTagMap

const hardQueryTagSet = new Set(hardQueryTags)

function uniqueTags(tags: string[]) {
  return tags.filter((tag, index, allTags) => tag && tag !== '全部' && allTags.indexOf(tag) === index)
}

export function isHardQueryTag(tag: string) {
  return hardQueryTagSet.has(tag)
}

export function getHardQueryTags(tags: string[] = []) {
  return uniqueTags(tags.filter(isHardQueryTag))
}

export function parseTagsParam(value: string | null) {
  return (value ?? '')
    .split(',')
    .map((tag) => tag.trim())
    .filter((tag) => tag && tag !== '全部')
}

export function toggleMultiTag(currentTags: string[], tag: string) {
  return currentTags.includes(tag) ? currentTags.filter((currentTag) => currentTag !== tag) : [...currentTags, tag]
}

export function toggleGroupedTag(currentTags: string[], tag: string, exclusiveGroups: readonly (readonly string[])[] = preferenceExclusiveGroups) {
  if (currentTags.includes(tag)) return currentTags.filter((currentTag) => currentTag !== tag)
  const exclusiveGroup = exclusiveGroups.find((group) => group.includes(tag))
  const nextTags = exclusiveGroup ? currentTags.filter((currentTag) => !exclusiveGroup.includes(currentTag)) : currentTags
  return [...nextTags, tag]
}

export function normalizeGroupedTags(tags: string[], exclusiveGroups: readonly (readonly string[])[] = preferenceExclusiveGroups) {
  return tags.reduce<string[]>((currentTags, tag) => {
    if (currentTags.includes(tag)) return currentTags
    const exclusiveGroup = exclusiveGroups.find((group) => group.includes(tag))
    if (!exclusiveGroup) return [...currentTags, tag]
    return [...currentTags.filter((currentTag) => !exclusiveGroup.includes(currentTag)), tag]
  }, [])
}

export function getCurrentMealPeriod(date = new Date()) {
  const hour = date.getHours()
  if (hour < 10) return '早餐'
  if (hour < 14) return '中餐'
  if (hour < 17) return '下午茶'
  if (hour < 21) return '晚餐'
  return '夜宵'
}

export function getMealPeriodForCategory(category: MealCategoryOption, candidate = getCurrentMealPeriod()) {
  if (category === '饮品') return '下午茶'
  if (category === '正餐' && candidate === '下午茶') return '晚餐'
  return candidate
}

export function collectFilterTags(filters: {
  scenarioTags?: string[]
  dietaryTags?: string[]
  preferenceTags?: string[]
  spiceLevel?: string
  loadLevel?: string
  tags?: string[]
}) {
  return uniqueTags([
    ...(filters.scenarioTags ?? []),
    ...(filters.dietaryTags ?? []),
    ...(filters.preferenceTags ?? []),
    ...(filters.spiceLevel && filters.spiceLevel !== '不限' ? [filters.spiceLevel] : []),
    ...(filters.loadLevel && filters.loadLevel !== '不限' ? [filters.loadLevel] : []),
    ...(filters.tags ?? [])
  ])
}

export function collectRankingPreferenceTags(filters: {
  scenarioTags?: string[]
  preferenceTags?: string[]
  loadLevel?: string
  tags?: string[]
}) {
  return uniqueTags([
    ...(filters.scenarioTags ?? []),
    ...(filters.preferenceTags ?? []),
    ...(filters.loadLevel && filters.loadLevel !== '不限' ? [filters.loadLevel] : []),
    ...(filters.tags ?? []).filter((tag) => !isHardQueryTag(tag))
  ])
}

export function getPublicDisplayTags(tags: string[], limit = 3) {
  const tagSet = new Set(tags)
  return publicDisplayTagPriority.filter((tag) => tagSet.has(tag)).slice(0, limit)
}

export function collectHardFilterTags(filters: {
  dietaryTags?: string[]
  spiceLevel?: string
  tags?: string[]
}) {
  return uniqueTags([
    ...(filters.dietaryTags ?? []),
    ...(filters.spiceLevel && filters.spiceLevel !== '不限' ? [filters.spiceLevel] : []),
    ...getHardQueryTags(filters.tags ?? [])
  ])
}
