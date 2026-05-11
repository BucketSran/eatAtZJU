const { ensureAppUserForAuth } = require('../_shared/appProfile.cjs')
const { requireAuthenticatedUser } = require('../_shared/auth.cjs')
const { readJsonBody } = require('../_shared/requestBody.cjs')

const MAX_FAVORITES = 300

function normalizeRestaurantIds(value) {
  if (!Array.isArray(value)) return []
  return [...new Set(value.filter((id) => typeof id === 'string').map((id) => id.trim()).filter(Boolean))].slice(0, MAX_FAVORITES)
}

async function listFavoriteIds(client, appUserId) {
  const { data, error } = await client
    .from('app_favorites')
    .select('restaurant_id')
    .eq('app_user_id', appUserId)
    .order('created_at', { ascending: false })

  if (error) throw error
  return (data || []).map((row) => row.restaurant_id).filter(Boolean)
}

async function upsertFavoriteIds(client, appUserId, restaurantIds) {
  if (!restaurantIds.length) return
  const rows = restaurantIds.map((restaurantId) => ({ app_user_id: appUserId, restaurant_id: restaurantId }))
  const { error } = await client.from('app_favorites').upsert(rows, { onConflict: 'app_user_id,restaurant_id' })
  if (error) throw error
}

async function setSingleFavorite(client, appUserId, restaurantId, favorite) {
  if (!restaurantId || restaurantId.length > 120) {
    const error = new Error('Invalid restaurant id')
    error.status = 400
    throw error
  }

  if (favorite) {
    await upsertFavoriteIds(client, appUserId, [restaurantId])
    return
  }

  const { error } = await client
    .from('app_favorites')
    .delete()
    .eq('app_user_id', appUserId)
    .eq('restaurant_id', restaurantId)

  if (error) throw error
}

function sendError(res, error, fallback = 'Favorite request failed') {
  const status = error.status || error.statusCode || 500
  return res.status(status).json({ error: error.message || fallback })
}

module.exports = async function handler(req, res) {
  const auth = await requireAuthenticatedUser(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  try {
    const appUser = await ensureAppUserForAuth(auth.serviceClient || auth.client, auth.user)

    if (req.method === 'GET') {
      const restaurantIds = await listFavoriteIds(auth.client, appUser.id)
      return res.status(200).json({ restaurantIds })
    }

    if (req.method === 'POST') {
      const body = await readJsonBody(req)
      await setSingleFavorite(auth.client, appUser.id, String(body.restaurantId || ''), Boolean(body.favorite))
      const restaurantIds = await listFavoriteIds(auth.client, appUser.id)
      return res.status(200).json({ restaurantIds })
    }

    if (req.method === 'PUT') {
      const body = await readJsonBody(req)
      const restaurantIds = normalizeRestaurantIds(body.restaurantIds)
      await upsertFavoriteIds(auth.client, appUser.id, restaurantIds)
      const mergedIds = await listFavoriteIds(auth.client, appUser.id)
      return res.status(200).json({ restaurantIds: mergedIds })
    }

    res.setHeader('Allow', 'GET, POST, PUT')
    return res.status(405).json({ error: 'Method not allowed' })
  } catch (error) {
    if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
    return sendError(res, error)
  }
}
