const { getMetadata, listRestaurants } = require('../_shared/restaurantRepository.cjs')

module.exports = async function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  try {
    const result = await listRestaurants(req.query)
    const limit = Number(req.query?.limit)
    const restaurants = Number.isFinite(limit) && limit > 0 ? result.data.slice(0, Math.min(Math.round(limit), 100)) : result.data
    return res.status(200).json({
      restaurants,
      metadata: getMetadata(),
      source: result.source,
      fallbackReason: result.fallbackReason
    })
  } catch (error) {
    return res.status(500).json({ error: 'Failed to list restaurants' })
  }
}
