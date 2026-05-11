const { createServerSupabaseClient, getSupabaseConfig } = require('./supabaseClient.cjs')
const { getMetadata, listRestaurantCollection } = require('./restaurantService.cjs')

const CAMPUS_ALIASES = {
  紫金港: 'zijingang',
  zijingang: 'zijingang',
  玉泉: 'yuquan',
  yuquan: 'yuquan',
  西溪: 'xixi',
  xixi: 'xixi',
  华家池: 'huajiachi',
  huajiachi: 'huajiachi',
  之江: 'zhijiang',
  zhijiang: 'zhijiang',
  海宁: 'haining',
  haining: 'haining'
}

function toNumber(value) {
  if (value === null || value === undefined) return 0
  return Number(value)
}

function mapRestaurant(row) {
  return {
    id: row.id,
    name: row.name,
    campusKey: row.campus_key || undefined,
    campusLabel: row.campus_label || undefined,
    campusDistance: row.campus_distance === null || row.campus_distance === undefined ? undefined : toNumber(row.campus_distance),
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
    serviceModes: row.service_modes || [],
    mealPeriods: row.meal_periods || [],
    scenarioTags: row.scenario_tags || [],
    constraintTags: row.constraint_tags || [],
    preferenceTags: row.preference_tags || [],
    sourceRefs: row.source_refs || [],
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
    avatarSnapshot: row.avatar_snapshot || undefined,
    text: row.text,
    rating: row.rating,
    status: row.status
  }
}

function getClientOrThrow() {
  const client = createServerSupabaseClient()
  if (!client) throw new Error('Supabase is not configured')
  return client
}

function isSupabaseConfigured() {
  return getSupabaseConfig().hasConfig
}

function findPriceRange(label) {
  if (!label || label === '不限') return undefined
  return getMetadata().priceRanges.find((range) => range.label === label)
}

function applyServerSideFilters(builder, query = {}) {
  let next = builder.eq('status', 'published')
  const campusKey = CAMPUS_ALIASES[query.campus]
  if (campusKey) next = next.eq('campus_key', campusKey)
  if (query.mode && query.mode !== '都可以' && query.mode !== '全部') next = next.contains('service_modes', [query.mode])
  if (query.meal && query.meal !== '全部') next = next.contains('meal_periods', [query.meal])

  // Keep multi-tag matching in shared service for now because tags can live in
  // tags, scenario_tags, constraint_tags, or preference_tags. A narrow SQL
  // prefilter here could drop valid matches.

  const priceRange = findPriceRange(query.priceLabel || query.price)
  if (priceRange) next = next.gte('price', priceRange.min).lte('price', priceRange.max)

  return next.limit(1000)
}

async function listRestaurants(query = {}) {
  const client = getClientOrThrow()
  const builder = client
    .from('restaurants')
    .select('id,name,campus_key,campus_label,campus_distance,area,distance,walk_minutes,cuisine,price,rating,student_score,checkins,latitude,longitude,cover_icon,cover_color,tags,suited_for,service_modes,meal_periods,scenario_tags,constraint_tags,preference_tags,reason,source_refs,status')

  const { data, error } = await applyServerSideFilters(builder, query)

  if (error) throw error
  return listRestaurantCollection((data || []).map(mapRestaurant), query)
}

async function getRestaurantDetail(id, query = {}) {
  const client = getClientOrThrow()
  const { data: restaurantRow, error: restaurantError } = await client
    .from('restaurants')
    .select('id,name,campus_key,campus_label,campus_distance,area,distance,walk_minutes,cuisine,price,rating,student_score,checkins,latitude,longitude,cover_icon,cover_color,tags,suited_for,service_modes,meal_periods,scenario_tags,constraint_tags,preference_tags,reason,source_refs,status')
    .eq('id', id)
    .eq('status', 'published')
    .maybeSingle()

  if (restaurantError) throw restaurantError
  if (!restaurantRow) return null

  const [restaurant] = listRestaurantCollection([mapRestaurant(restaurantRow)], query)
  if (!restaurant) return null

  const [{ data: dishRows, error: dishesError }, { data: reviewRows, error: reviewsError }] = await Promise.all([
    client
      .from('dishes')
      .select('id,restaurant_id,name,price,heat,status')
      .eq('restaurant_id', id)
      .eq('status', 'published'),
    client
      .from('reviews')
      .select('id,restaurant_id,display_name_snapshot,avatar_snapshot,rating,text,status')
      .eq('restaurant_id', id)
      .eq('status', 'approved')
  ])

  if (dishesError) throw dishesError
  if (reviewsError) throw reviewsError

  return {
    restaurant,
    dishes: (dishRows || []).map(mapDish),
    reviews: (reviewRows || []).map(mapReview)
  }
}

async function getRecommendedRestaurant(query = {}) {
  const restaurants = await listRestaurants(query)
  return restaurants[0] || null
}

async function getRandomRestaurant(query = {}) {
  const restaurants = await listRestaurants(query)
  if (!restaurants.length) return null
  return restaurants[Math.floor(Math.random() * restaurants.length)]
}

module.exports = {
  getMetadata,
  getRandomRestaurant,
  getRecommendedRestaurant,
  getRestaurantDetail,
  isSupabaseConfigured,
  listRestaurants,
  mapDish,
  mapRestaurant,
  mapReview
}
