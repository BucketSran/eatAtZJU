const { getRandomRestaurant, getRecommendedRestaurant } = require('../_shared/restaurantService.cjs')

module.exports = function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const strategy = req.query.strategy || 'recommended'
  const restaurant = strategy === 'random' ? getRandomRestaurant(req.query) : getRecommendedRestaurant(req.query)
  if (!restaurant) return res.status(404).json({ error: 'No matching restaurant' })

  return res.status(200).json({ restaurant, strategy })
}
