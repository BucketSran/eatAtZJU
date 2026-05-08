import { getFavoriteRestaurantIds, setFavoriteRestaurantIds } from './favoriteStore'
import { getSupabaseBrowserClient } from './supabaseBrowserClient'

export async function syncLocalFavoritesToSupabase() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data: userData, error: userError } = await client.auth.getUser()
  if (userError) throw userError
  if (!userData.user) throw new Error('Please sign in first')

  const ids = getFavoriteRestaurantIds()
  if (!ids.length) return { pushed: 0 }

  const rows = ids.map((restaurantId) => ({ user_id: userData.user!.id, restaurant_id: restaurantId }))
  const { error } = await client.from('favorites').upsert(rows, { onConflict: 'user_id,restaurant_id' })
  if (error) throw error
  return { pushed: rows.length }
}

export async function pullFavoritesFromSupabase() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data: userData, error: userError } = await client.auth.getUser()
  if (userError) throw userError
  if (!userData.user) throw new Error('Please sign in first')

  const { data, error } = await client.from('favorites').select('restaurant_id').eq('user_id', userData.user.id)
  if (error) throw error

  const ids = (data || []).map((row) => row.restaurant_id).filter((id): id is string => typeof id === 'string')
  setFavoriteRestaurantIds(ids)
  return { pulled: ids.length }
}
