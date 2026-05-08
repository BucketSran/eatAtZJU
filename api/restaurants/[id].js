const { getRestaurantDetail } = require('../_shared/restaurantService.cjs')

module.exports = function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const detail = getRestaurantDetail(req.query.id, req.query)
  if (!detail) return res.status(404).json({ error: 'Restaurant not found' })

  return res.status(200).json(detail)
}
