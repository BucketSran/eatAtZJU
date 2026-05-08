const fs = require('fs')
const path = require('path')
const { spawnSync } = require('child_process')

const root = path.resolve(__dirname, '..')
const EXPECTED_SCHEMA_VERSION = 1

function walk(dir, matcher, acc = []) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (entry.name === '.git' || entry.name === 'node_modules' || entry.name === 'miniprogram_npm' || entry.name === 'dist') continue
    const fullPath = path.join(dir, entry.name)
    if (entry.isDirectory()) walk(fullPath, matcher, acc)
    else if (matcher(fullPath)) acc.push(fullPath)
  }
  return acc
}

function readJson(relativePath) {
  return JSON.parse(fs.readFileSync(path.join(root, relativePath), 'utf8'))
}

function run(command, args) {
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8' })
  if (result.status !== 0) {
    process.stderr.write(result.stdout)
    process.stderr.write(result.stderr)
    process.exit(result.status || 1)
  }
}

function assert(condition, message) {
  if (!condition) throw new Error(message)
}

async function withMissingSupabaseEnv(callback) {
  const keys = ['SUPABASE_URL', 'SUPABASE_ANON_KEY', 'SUPABASE_SERVICE_ROLE_KEY', 'VITE_SUPABASE_URL', 'VITE_SUPABASE_ANON_KEY']
  const previous = new Map(keys.map((key) => [key, process.env[key]]))
  for (const key of keys) delete process.env[key]

  try {
    return await callback()
  } finally {
    for (const [key, value] of previous) {
      if (value === undefined) delete process.env[key]
      else process.env[key] = value
    }
  }
}

function checkJavaScript() {
  for (const file of walk(root, file => file.endsWith('.js') || file.endsWith('.cjs'))) {
    run(process.execPath, ['--check', file])
  }
}

function checkJson() {
  for (const file of walk(root, file => file.endsWith('.json'))) {
    JSON.parse(fs.readFileSync(file, 'utf8'))
  }
}

function validateRestaurantShape(restaurant, source) {
  const required = ['id', 'name', 'area', 'distance', 'walkMinutes', 'cuisine', 'price', 'rating', 'studentScore', 'checkins', 'latitude', 'longitude', 'tags', 'suitedFor', 'reason']
  for (const key of required) {
    assert(restaurant[key] !== undefined && restaurant[key] !== null && restaurant[key] !== '', `${source} ${restaurant.id || restaurant.name || '<unknown>'} missing ${key}`)
  }
  assert(Array.isArray(restaurant.tags) && restaurant.tags.length > 0, `${source} ${restaurant.id} missing tags`)
  assert(Array.isArray(restaurant.suitedFor) && restaurant.suitedFor.length > 0, `${source} ${restaurant.id} missing suitedFor`)
  assert(restaurant.rating >= 1 && restaurant.rating <= 5, `${source} ${restaurant.id} rating out of range`)
  assert(restaurant.studentScore >= 0 && restaurant.studentScore <= 100, `${source} ${restaurant.id} studentScore out of range`)
  assert(restaurant.price > 0 && restaurant.price < 1000, `${source} ${restaurant.id} invalid price`)
  assert(restaurant.latitude >= -90 && restaurant.latitude <= 90, `${source} ${restaurant.id} invalid latitude`)
  assert(restaurant.longitude >= -180 && restaurant.longitude <= 180, `${source} ${restaurant.id} invalid longitude`)
}

function checkLegacyRestaurantData() {
  global.wx = {
    getStorageSync(key) {
      if (key === 'eatAtZjuFavorites') return ['r001']
      if (key === 'eatAtZjuPreferences') return ['近', '实惠', '辣']
      return null
    },
    setStorageSync() {}
  }

  const { restaurants, tasteTags, priceRanges } = require('../data/restaurants')
  const service = require('../services/restaurantService')

  const ids = new Set()
  for (const restaurant of restaurants) {
    validateRestaurantShape(restaurant, 'legacy restaurant')
    assert(Array.isArray(restaurant.menu) && restaurant.menu.length > 0, `legacy restaurant ${restaurant.id} missing menu`)
    assert(Array.isArray(restaurant.comments) && restaurant.comments.length > 0, `legacy restaurant ${restaurant.id} missing comments`)
    assert(!ids.has(restaurant.id), `duplicate legacy restaurant id: ${restaurant.id}`)
    ids.add(restaurant.id)
  }

  assert(tasteTags.includes('全部'), 'tasteTags must include 全部')
  assert(priceRanges.length > 0, 'priceRanges must not be empty')

  const filtered = service.listRestaurants({ tag: '实惠' }, ['近', '实惠', '辣'])
  assert(filtered.length > 0, 'expected filtered restaurants')
  assert(service.getRestaurant('r001').isFavorite, 'favorite decoration failed')
  assert(service.randomRestaurant({}, ['近']), 'random restaurant failed')
  assert(service.getMarkers().length === restaurants.length, 'marker count mismatch')
}

function checkSeedData() {
  const restaurantSeed = readJson('seed/restaurants.json')
  const dishSeed = readJson('seed/dishes.json')
  const reviewSeed = readJson('seed/reviews.json')

  assert(restaurantSeed.schemaVersion === EXPECTED_SCHEMA_VERSION, 'restaurants seed schemaVersion mismatch')
  assert(dishSeed.schemaVersion === EXPECTED_SCHEMA_VERSION, 'dishes seed schemaVersion mismatch')
  assert(reviewSeed.schemaVersion === EXPECTED_SCHEMA_VERSION, 'reviews seed schemaVersion mismatch')
  assert(Array.isArray(restaurantSeed.restaurants), 'restaurants seed must contain restaurants array')
  assert(Array.isArray(dishSeed.dishes), 'dishes seed must contain dishes array')
  assert(Array.isArray(reviewSeed.reviews), 'reviews seed must contain reviews array')

  const restaurantIds = new Set()
  for (const restaurant of restaurantSeed.restaurants) {
    validateRestaurantShape(restaurant, 'seed restaurant')
    assert(restaurant.status === 'published', `seed restaurant ${restaurant.id} must be published for demo`)
    assert(!restaurantIds.has(restaurant.id), `duplicate seed restaurant id: ${restaurant.id}`)
    restaurantIds.add(restaurant.id)
  }

  const dishIds = new Set()
  const dishCounts = new Map()
  for (const dish of dishSeed.dishes) {
    assert(dish.id, 'dish missing id')
    assert(!dishIds.has(dish.id), `duplicate dish id: ${dish.id}`)
    dishIds.add(dish.id)
    assert(restaurantIds.has(dish.restaurantId), `dish ${dish.id} references missing restaurant ${dish.restaurantId}`)
    assert(dish.name, `dish ${dish.id} missing name`)
    assert(dish.price > 0 && dish.price < 1000, `dish ${dish.id} invalid price`)
    assert(dish.heat >= 0 && dish.heat <= 100, `dish ${dish.id} heat out of range`)
    dishCounts.set(dish.restaurantId, (dishCounts.get(dish.restaurantId) || 0) + 1)
  }

  const reviewIds = new Set()
  const reviewCounts = new Map()
  for (const review of reviewSeed.reviews) {
    assert(review.id, 'review missing id')
    assert(!reviewIds.has(review.id), `duplicate review id: ${review.id}`)
    reviewIds.add(review.id)
    assert(restaurantIds.has(review.restaurantId), `review ${review.id} references missing restaurant ${review.restaurantId}`)
    assert(review.text, `review ${review.id} missing text`)
    assert(review.rating >= 1 && review.rating <= 5, `review ${review.id} rating out of range`)
    reviewCounts.set(review.restaurantId, (reviewCounts.get(review.restaurantId) || 0) + 1)
  }

  for (const restaurantId of restaurantIds) {
    assert((dishCounts.get(restaurantId) || 0) > 0, `restaurant ${restaurantId} must have at least one dish`)
    assert((reviewCounts.get(restaurantId) || 0) > 0, `restaurant ${restaurantId} must have at least one review`)
  }
}

async function checkApiService() {
  const apiService = require('../api/_shared/restaurantService.cjs')
  const metadata = apiService.getMetadata()
  assert(metadata.tasteTags.includes('全部'), 'api metadata tasteTags must include 全部')
  assert(metadata.priceRanges.some((range) => range.label === '不限'), 'api metadata priceRanges must include 不限')

  const all = apiService.listRestaurants({ preferences: '近,实惠,辣' })
  assert(all.length > 0, 'api listRestaurants should return published restaurants')
  assert(typeof all[0].recommendationScore === 'number', 'api listRestaurants should decorate recommendationScore')

  const filtered = apiService.listRestaurants({ tag: '实惠', price: '30以内', sort: 'recommended' })
  assert(filtered.length > 0, 'api filtered list should return restaurants')

  const detail = apiService.getRestaurantDetail('r001', { preferences: '近,实惠' })
  assert(detail && detail.restaurant.id === 'r001', 'api getRestaurantDetail should return r001')
  assert(detail.dishes.length > 0, 'api detail should include dishes')
  assert(detail.reviews.length > 0, 'api detail should include reviews')

  assert(apiService.getRecommendedRestaurant({ preferences: '近,实惠' }), 'api recommended restaurant failed')
  assert(apiService.getRandomRestaurant({ tag: '全部' }), 'api random restaurant failed')

  await withMissingSupabaseEnv(async () => {
    const apiRepository = require('../api/_shared/restaurantRepository.cjs')
    const repositoryList = await apiRepository.listRestaurants({ preferences: '近,实惠,辣' })
    assert(repositoryList.source === 'seed', 'api repository should fall back to seed when Supabase is not configured')
    assert(repositoryList.data.length > 0, 'api repository fallback list should return restaurants')
    assert(repositoryList.fallbackReason === 'supabase_not_configured', 'api repository should report missing Supabase config')
  })
}

function createMockResponse() {
  return {
    body: undefined,
    headers: {},
    statusCode: 200,
    setHeader(key, value) {
      this.headers[key] = value
    },
    status(code) {
      this.statusCode = code
      return this
    },
    json(body) {
      this.body = body
      return this
    }
  }
}

async function callHandler(handler, req) {
  const res = createMockResponse()
  await handler(req, res)
  return res
}

async function checkApiHandlers() {
  await withMissingSupabaseEnv(async () => {
    const listHandler = require('../api/restaurants/index.js')
    const detailHandler = require('../api/restaurants/[id].js')
    const recommendHandler = require('../api/recommend/today.js')

    const list = await callHandler(listHandler, { method: 'GET', query: { tag: '实惠', preferences: '近,实惠' } })
    assert(list.statusCode === 200, 'restaurants handler should return 200')
    assert(list.body.source === 'seed', 'restaurants handler should use seed fallback without Supabase config')
    assert(list.body.restaurants.length > 0, 'restaurants handler should return rows')

    const detail = await callHandler(detailHandler, { method: 'GET', query: { id: 'r001', preferences: '近' } })
    assert(detail.statusCode === 200, 'restaurant detail handler should return 200')
    assert(detail.body.source === 'seed', 'restaurant detail handler should use seed fallback without Supabase config')
    assert(detail.body.restaurant.id === 'r001', 'restaurant detail handler should return r001')

    const today = await callHandler(recommendHandler, { method: 'GET', query: { strategy: 'recommended', preferences: '近,实惠' } })
    assert(today.statusCode === 200, 'recommend handler should return 200')
    assert(today.body.source === 'seed', 'recommend handler should use seed fallback without Supabase config')
    assert(today.body.restaurant.id, 'recommend handler should return a restaurant')

    const invalidDetail = await callHandler(detailHandler, { method: 'GET', query: { id: '../secret' } })
    assert(invalidDetail.statusCode === 400, 'restaurant detail handler should reject invalid ids')

    const invalidStrategy = await callHandler(recommendHandler, { method: 'GET', query: { strategy: 'surprise-me' } })
    assert(invalidStrategy.statusCode === 400, 'recommend handler should reject invalid strategies')
  })
}

function checkSupabaseFiles() {
  const migrationPath = path.join(root, 'supabase/migrations/202605080001_initial_schema.sql')
  assert(fs.existsSync(migrationPath), 'missing Supabase initial schema migration')

  const migration = fs.readFileSync(migrationPath, 'utf8')
  const rlsTables = [
    'admin_users',
    'profiles',
    'user_trust',
    'restaurants',
    'dishes',
    'reviews',
    'favorites',
    'submissions',
    'audit_logs'
  ]

  for (const table of rlsTables) {
    assert(migration.includes(`create table if not exists public.${table}`), `migration missing table ${table}`)
    assert(migration.includes(`alter table public.${table} enable row level security`), `migration missing RLS for ${table}`)
  }

  const requiredPolicies = [
    'anyone can read published restaurants',
    'anyone can read published dishes',
    'anyone can read approved reviews',
    'users can read own favorites',
    'users can insert own favorites',
    'users can delete own favorites',
    'users can create pending submissions',
    'admins can manage submissions',
    'admins can read audit logs'
  ]

  for (const policy of requiredPolicies) {
    assert(migration.includes(`create policy "${policy}"`), `migration missing policy: ${policy}`)
  }

  assert(migration.includes('constraint profiles_preferences_length'), 'migration missing preferences length guard')
  assert(migration.includes('constraint submissions_payload_size'), 'migration missing submissions payload size guard')
  assert(migration.includes("restaurants.status = 'published'"), 'migration missing published restaurant guard')

  run(process.execPath, ['scripts/generate-supabase-seed.cjs', '--check'])
}

async function main() {
  checkJavaScript()
  checkJson()
  checkLegacyRestaurantData()
  checkSeedData()
  await checkApiService()
  await checkApiHandlers()
  checkSupabaseFiles()
  console.log('check ok')
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
