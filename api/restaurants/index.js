const { getMetadata, listRestaurants } = require('../_shared/restaurantService.cjs')

module.exports = function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  return res.status(200).json({
    restaurants: listRestaurants(req.query),
    metadata: getMetadata()
  })
}
