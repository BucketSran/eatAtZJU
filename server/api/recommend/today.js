const { getRandomRestaurant, getRecommendedRestaurant } = require('../_shared/restaurantRepository.cjs')
const { readRecommendationStrategy } = require('../_shared/requestValidation.cjs')

module.exports = async function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const strategy = readRecommendationStrategy(req.query)
  if (!strategy) return res.status(400).json({ error: 'Invalid recommendation strategy' })

  try {
    const result = strategy === 'random' ? await getRandomRestaurant(req.query) : await getRecommendedRestaurant(req.query)
    if (!result.data) return res.status(404).json({ error: 'No matching restaurant', source: result.source })

    return res.status(200).json({
      restaurant: result.data,
      strategy,
      source: result.source,
      fallbackReason: result.fallbackReason
    })
  } catch (error) {
    return res.status(500).json({ error: 'Failed to load recommendation' })
  }
}
