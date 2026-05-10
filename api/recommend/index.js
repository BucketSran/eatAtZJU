const { getMetadata, listRestaurants } = require('../_shared/restaurantRepository.cjs')

module.exports = async function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  try {
    const result = await listRestaurants({ ...req.query, sort: req.query?.sort || 'recommended' })
    const limit = Math.min(Math.max(Number(req.query?.limit) || 10, 1), 50)
    return res.status(200).json({
      restaurants: result.data.slice(0, limit),
      metadata: getMetadata(),
      source: result.source,
      fallbackReason: result.fallbackReason
    })
  } catch (error) {
    return res.status(500).json({ error: 'Failed to load recommendations' })
  }
}
