import { getFavoriteRestaurantIds, setFavoriteRestaurantIds } from './favoriteStore'
import { getSupabaseBrowserClient } from './supabaseBrowserClient'

async function getAccessToken() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data, error } = await client.auth.getSession()
  if (error) throw error
  if (!data.session?.access_token) throw new Error('Please sign in first')
  return data.session.access_token
}

async function requestFavoriteApi(method: 'GET' | 'POST' | 'PUT', body?: Record<string, unknown>) {
  const token = await getAccessToken()
  const response = await fetch('/api/favorites', {
    method,
    headers: {
      accept: 'application/json',
      Authorization: `Bearer ${token}`,
      ...(body ? { 'Content-Type': 'application/json' } : {})
    },
    body: body ? JSON.stringify(body) : undefined
  })
  const payload = await response.json().catch(() => ({})) as { error?: string, restaurantIds?: string[] }
  if (!response.ok) throw new Error(payload.error || `Favorites API returned ${response.status}`)
  return Array.isArray(payload.restaurantIds) ? payload.restaurantIds.filter((id): id is string => typeof id === 'string') : []
}

export async function syncLocalFavoritesToSupabase() {
  const ids = getFavoriteRestaurantIds()
  if (!ids.length) return { pushed: 0, total: (await requestFavoriteApi('GET')).length }

  const cloudIds = await requestFavoriteApi('PUT', { restaurantIds: ids })
  setFavoriteRestaurantIds(cloudIds)
  return { pushed: ids.length, total: cloudIds.length }
}

export async function pullFavoritesFromSupabase() {
  const ids = await requestFavoriteApi('GET')
  setFavoriteRestaurantIds(ids)
  return { pulled: ids.length }
}

export async function setFavoriteInSupabase(restaurantId: string, favorite: boolean) {
  const ids = await requestFavoriteApi('POST', { restaurantId, favorite })
  setFavoriteRestaurantIds(ids)
  return ids
}

export async function mergeFavoritesWithSupabase() {
  const localIds = getFavoriteRestaurantIds()
  const cloudIds = await requestFavoriteApi('GET')
  const mergedIds = [...new Set([...localIds, ...cloudIds])]
  const nextIds = await requestFavoriteApi('PUT', { restaurantIds: mergedIds })
  setFavoriteRestaurantIds(nextIds)
  return { local: localIds.length, cloud: cloudIds.length, merged: nextIds.length }
}
