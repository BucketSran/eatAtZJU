const https = require('https')

const METADATA = {
  schemaVersion: 1,
  tasteTags: ['全部', '近', '实惠', '辣', '校内', '聚餐', '快餐', '夜宵', '面食', '甜品', '清真友好', '一人食'],
  priceRanges: [
    { label: '不限', min: 0, max: 999 },
    { label: '30以内', min: 0, max: 30 },
    { label: '30-50', min: 30, max: 50 },
    { label: '50以上', min: 50, max: 999 }
  ]
}

function parseList(value) {
  if (!value) return []
  if (Array.isArray(value)) return value.flatMap(parseList)
  return String(value)
    .split(',')
    .map((item) => item.trim())
    .filter(Boolean)
}

function scoreRestaurant(restaurant, preferences = [], favoriteRestaurantIds = []) {
  const preferenceHit = restaurant.tags.filter((tag) => preferences.includes(tag)).length
  const sceneHit = restaurant.suitedFor.filter((scene) => preferences.includes(scene)).length
  const favoriteBoost = favoriteRestaurantIds.includes(restaurant.id) ? 10 : 0
  const ratingScore = restaurant.rating * 12
  const studentScore = restaurant.studentScore * 0.35
  const distanceScore = Math.max(0, 30 - restaurant.distance * 8)
  const checkinScore = Math.min(18, restaurant.checkins / 35)

  return Math.round(ratingScore + studentScore + distanceScore + checkinScore + preferenceHit * 18 + sceneHit * 8 + favoriteBoost)
}

function findPriceRange(label) {
  if (!label || label === '不限') return undefined
  return METADATA.priceRanges.find((range) => range.label === label)
}

function matchesKeyword(restaurant, keyword = '') {
  const normalized = String(keyword).trim().toLowerCase()
  if (!normalized) return true

  return [restaurant.name, restaurant.area, restaurant.cuisine, restaurant.reason, restaurant.tags.join(' '), restaurant.suitedFor.join(' ')]
    .join(' ')
    .toLowerCase()
    .includes(normalized)
}

function matchesTag(restaurant, tag = '全部') {
  return tag === '全部' || restaurant.tags.includes(tag) || restaurant.cuisine.includes(tag) || restaurant.suitedFor.includes(tag)
}

function matchesPrice(restaurant, priceRange) {
  if (!priceRange) return true
  return restaurant.price >= priceRange.min && restaurant.price <= priceRange.max
}

function sortRestaurants(restaurants, sort = 'recommended') {
  return [...restaurants].sort((a, b) => {
    if (sort === 'distance') return a.distance - b.distance
    if (sort === 'rating') return b.rating - a.rating
    if (sort === 'price') return a.price - b.price
    return (b.recommendationScore || 0) - (a.recommendationScore || 0)
  })
}

function listRestaurantCollection(restaurants, query = {}) {
  const preferences = parseList(query.preferences)
  const favoriteRestaurantIds = parseList(query.favorites)
  const priceRange = findPriceRange(query.priceLabel || query.price)
  const filtered = restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
      matchesKeyword(restaurant, query.keyword) &&
      matchesTag(restaurant, query.tag || '全部') &&
      matchesPrice(restaurant, priceRange)
    )
  })

  const scored = filtered.map((restaurant) => ({
    ...restaurant,
    recommendationScore: scoreRestaurant(restaurant, preferences, favoriteRestaurantIds),
    isFavorite: favoriteRestaurantIds.includes(restaurant.id)
  }))

  return sortRestaurants(scored, query.sort)
}

function getSupabaseConfig() {
  const url = process.env.SUPABASE_URL || process.env.SUPABASE_PROJECT_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_ANON_KEY
  return {
    key,
    url: url ? url.replace(/\/$/, '') : ''
  }
}

function requestJson(pathname, query = {}) {
  const { key, url } = getSupabaseConfig()
  if (!url || !key) {
    const error = new Error('Supabase is not configured')
    error.code = 'supabase_not_configured'
    throw error
  }

  const target = new URL(`${url}/rest/v1/${pathname}`)
  for (const [name, value] of Object.entries(query)) {
    if (value !== undefined && value !== null && value !== '') target.searchParams.set(name, value)
  }

  return new Promise((resolve, reject) => {
    const req = https.request(
      target,
      {
        method: 'GET',
        headers: {
          apikey: key,
          Authorization: `Bearer ${key}`,
          Accept: 'application/json'
        },
        timeout: 12000
      },
      (res) => {
        let body = ''
        res.setEncoding('utf8')
        res.on('data', (chunk) => {
          body += chunk
        })
        res.on('end', () => {
          if (res.statusCode < 200 || res.statusCode >= 300) {
            const error = new Error(`Supabase REST ${res.statusCode}: ${body.slice(0, 300)}`)
            error.statusCode = res.statusCode
            reject(error)
            return
          }

          try {
            resolve(body ? JSON.parse(body) : null)
          } catch (error) {
            reject(error)
          }
        })
      }
    )

    req.on('timeout', () => {
      req.destroy(new Error('Supabase REST request timeout'))
    })
    req.on('error', reject)
    req.end()
  })
}

function toNumber(value) {
  if (value === null || value === undefined) return 0
  return Number(value)
}

function mapRestaurant(row) {
  return {
    id: row.id,
    name: row.name,
    area: row.area,
    distance: toNumber(row.distance),
    walkMinutes: row.walk_minutes,
    cuisine: row.cuisine,
    price: row.price,
    rating: toNumber(row.rating),
    studentScore: row.student_score,
    checkins: row.checkins,
    latitude: toNumber(row.latitude),
    longitude: toNumber(row.longitude),
    coverIcon: row.cover_icon,
    coverColor: row.cover_color,
    tags: row.tags || [],
    suitedFor: row.suited_for || [],
    reason: row.reason,
    status: row.status
  }
}

function mapDish(row) {
  return {
    id: row.id,
    restaurantId: row.restaurant_id,
    name: row.name,
    price: row.price,
    heat: row.heat,
    status: row.status
  }
}

function mapReview(row) {
  return {
    id: row.id,
    restaurantId: row.restaurant_id,
    userName: row.display_name_snapshot,
    text: row.text,
    rating: row.rating,
    status: row.status
  }
}

async function fetchPublishedRestaurants(query = {}) {
  const rows = await requestJson('restaurants', {
    select: 'id,name,area,distance,walk_minutes,cuisine,price,rating,student_score,checkins,latitude,longitude,cover_icon,cover_color,tags,suited_for,reason,status',
    status: 'eq.published'
  })
  return listRestaurantCollection((rows || []).map(mapRestaurant), query)
}

async function listRestaurants(event = {}) {
  const restaurants = await fetchPublishedRestaurants(event.query || event)
  return {
    ok: true,
    restaurants,
    metadata: METADATA,
    source: 'supabase'
  }
}

async function getRestaurantDetail(event = {}) {
  const id = event.id || event.restaurantId
  if (!id || !/^r[0-9a-z_-]+$/i.test(String(id))) {
    return { ok: false, error: 'invalid_restaurant_id' }
  }

  const query = event.query || {}
  const restaurants = await fetchPublishedRestaurants(query)
  const restaurant = restaurants.find((item) => item.id === id)
  if (!restaurant) return { ok: false, error: 'restaurant_not_found', source: 'supabase' }

  const [dishRows, reviewRows] = await Promise.all([
    requestJson('dishes', {
      select: 'id,restaurant_id,name,price,heat,status',
      restaurant_id: `eq.${id}`,
      status: 'eq.published'
    }),
    requestJson('reviews', {
      select: 'id,restaurant_id,display_name_snapshot,rating,text,status',
      restaurant_id: `eq.${id}`,
      status: 'eq.approved'
    })
  ])

  return {
    ok: true,
    restaurant,
    dishes: (dishRows || []).map(mapDish),
    reviews: (reviewRows || []).map(mapReview),
    source: 'supabase'
  }
}

async function getTodayRecommendation(event = {}) {
  const query = event.query || event
  const strategy = query.strategy === 'random' ? 'random' : 'recommended'
  const restaurants = await fetchPublishedRestaurants(query)
  if (!restaurants.length) return { ok: false, error: 'no_matching_restaurant', source: 'supabase' }

  return {
    ok: true,
    restaurant: strategy === 'random' ? restaurants[Math.floor(Math.random() * restaurants.length)] : restaurants[0],
    strategy,
    source: 'supabase'
  }
}

exports.main = async (event = {}) => {
  const openId = event.userInfo && (event.userInfo.openId || event.userInfo.openid)
  const action = event.action || 'listRestaurants'

  try {
    if (action === 'ping') return { ok: true, openId: openId || null }
    if (action === 'getMetadata') return { ok: true, metadata: METADATA }
    if (action === 'listRestaurants') return listRestaurants(event)
    if (action === 'getRestaurantDetail') return getRestaurantDetail(event)
    if (action === 'getTodayRecommendation') return getTodayRecommendation(event)
    return { ok: false, error: 'unknown_action' }
  } catch (error) {
    console.error('[eatAtZjuApi]', action, error)
    return {
      ok: false,
      error: error.code || 'cloud_function_error',
      message: error.message
    }
  }
}
