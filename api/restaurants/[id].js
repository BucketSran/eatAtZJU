const { getRestaurantDetail } = require('../_shared/restaurantRepository.cjs')
const { readRestaurantId } = require('../_shared/requestValidation.cjs')

module.exports = async function handler(req, res) {
  if (req.method !== 'GET') {
    res.setHeader('Allow', 'GET')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const id = readRestaurantId(req.query)
  if (!id) return res.status(400).json({ error: 'Invalid restaurant id' })

  try {
    const result = await getRestaurantDetail(id, req.query)
    if (!result.data) return res.status(404).json({ error: 'Restaurant not found', source: result.source })

    return res.status(200).json({
      ...result.data,
      source: result.source,
      fallbackReason: result.fallbackReason
    })
  } catch (error) {
    return res.status(500).json({ error: 'Failed to load restaurant detail' })
  }
}
