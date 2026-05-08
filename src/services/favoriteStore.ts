const FAVORITES_KEY = 'eatAtZju:web:favorites'

function canUseStorage() {
  return typeof window !== 'undefined' && Boolean(window.localStorage)
}

export function getFavoriteRestaurantIds() {
  if (!canUseStorage()) return []
  try {
    const raw = window.localStorage.getItem(FAVORITES_KEY)
    const parsed = raw ? JSON.parse(raw) : []
    return Array.isArray(parsed) ? parsed.filter((id): id is string => typeof id === 'string') : []
  } catch {
    return []
  }
}

export function setFavoriteRestaurantIds(ids: string[]) {
  if (!canUseStorage()) return ids
  window.localStorage.setItem(FAVORITES_KEY, JSON.stringify([...new Set(ids)]))
  return ids
}

export function isFavoriteRestaurant(id: string) {
  return getFavoriteRestaurantIds().includes(id)
}

export function toggleFavoriteRestaurant(id: string) {
  const ids = getFavoriteRestaurantIds()
  const next = ids.includes(id) ? ids.filter((item) => item !== id) : [...ids, id]
  setFavoriteRestaurantIds(next)
  return next
}
