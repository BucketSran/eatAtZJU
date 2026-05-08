function firstQueryValue(value) {
  if (Array.isArray(value)) return value[0]
  return value
}

function readQueryString(query, key, maxLength = 120) {
  const value = firstQueryValue(query?.[key])
  if (value === undefined || value === null) return undefined
  return String(value).trim().slice(0, maxLength)
}

function readRestaurantId(query) {
  const id = readQueryString(query, 'id', 80)
  if (!id) return undefined
  if (!/^[a-zA-Z0-9_-]+$/.test(id)) return undefined
  return id
}

function readRecommendationStrategy(query) {
  const strategy = readQueryString(query, 'strategy', 20) || 'recommended'
  if (strategy !== 'recommended' && strategy !== 'random') return undefined
  return strategy
}

module.exports = {
  readQueryString,
  readRecommendationStrategy,
  readRestaurantId
}
