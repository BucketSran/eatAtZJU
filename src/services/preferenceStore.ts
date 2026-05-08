const PREFERENCES_KEY = 'eatAtZju:web:preferences'
export const defaultPreferences = ['近', '实惠', '辣']

function canUseStorage() {
  return typeof window !== 'undefined' && Boolean(window.localStorage)
}

export function getPreferenceTags() {
  if (!canUseStorage()) return defaultPreferences
  try {
    const raw = window.localStorage.getItem(PREFERENCES_KEY)
    const parsed = raw ? JSON.parse(raw) : defaultPreferences
    return Array.isArray(parsed) ? parsed.filter((tag): tag is string => typeof tag === 'string') : defaultPreferences
  } catch {
    return defaultPreferences
  }
}

export function setPreferenceTags(tags: string[]) {
  if (!canUseStorage()) return tags
  window.localStorage.setItem(PREFERENCES_KEY, JSON.stringify([...new Set(tags)]))
  return tags
}

export function togglePreferenceTag(tag: string) {
  const tags = getPreferenceTags()
  const next = tags.includes(tag) ? tags.filter((item) => item !== tag) : [...tags, tag]
  setPreferenceTags(next)
  return next
}

export function resetPreferenceTags() {
  setPreferenceTags(defaultPreferences)
  return defaultPreferences
}
