import { campusOptions, normalizeGroupedTags, type CampusOption } from '../constants/restaurantTaxonomy'
import { TUTORIAL_REQUIREMENT_PRESET } from '../constants/tutorialDemo'

const PREFERENCES_KEY = 'eatAtZju:web:preferences'
const DEFAULT_CAMPUS_KEY = 'eatAtZjuCampus'
export const defaultPreferences = [...TUTORIAL_REQUIREMENT_PRESET.tags]
export const defaultCampus: CampusOption = TUTORIAL_REQUIREMENT_PRESET.campus

function canUseStorage() {
  return typeof window !== 'undefined' && Boolean(window.localStorage)
}

export function getPreferenceTags() {
  if (!canUseStorage()) return defaultPreferences
  try {
    const raw = window.localStorage.getItem(PREFERENCES_KEY)
    const parsed = raw ? JSON.parse(raw) : defaultPreferences
    return Array.isArray(parsed) ? normalizeGroupedTags(parsed.filter((tag): tag is string => typeof tag === 'string')) : defaultPreferences
  } catch {
    return defaultPreferences
  }
}

export function setPreferenceTags(tags: string[]) {
  const normalizedTags = normalizeGroupedTags(tags)
  if (!canUseStorage()) return normalizedTags
  window.localStorage.setItem(PREFERENCES_KEY, JSON.stringify(normalizedTags))
  return normalizedTags
}

export function togglePreferenceTag(tag: string) {
  const tags = getPreferenceTags()
  const next = tags.includes(tag) ? tags.filter((item) => item !== tag) : [...tags, tag]
  return setPreferenceTags(next)
}

export function resetPreferenceTags() {
  setPreferenceTags(defaultPreferences)
  return defaultPreferences
}

export function normalizeCampus(value: unknown): CampusOption {
  return campusOptions.includes(value as CampusOption) ? (value as CampusOption) : defaultCampus
}

export function getDefaultCampus() {
  if (!canUseStorage()) return defaultCampus
  return normalizeCampus(window.localStorage.getItem(DEFAULT_CAMPUS_KEY))
}

export function setDefaultCampus(campus: string) {
  const normalized = normalizeCampus(campus)
  if (canUseStorage()) window.localStorage.setItem(DEFAULT_CAMPUS_KEY, normalized)
  return normalized
}
