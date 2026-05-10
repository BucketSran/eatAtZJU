const fs = require('fs')
const path = require('path')
const { spawnSync } = require('child_process')

const root = path.resolve(__dirname, '..')
const EXPECTED_SCHEMA_VERSION = 1
const CAMPUS_LABELS = ['紫金港', '玉泉', '西溪', '华家池', '之江', '海宁']
const BAD_PUBLIC_NAME_PATTERN = /停车场|公共厕所|厕所|入口|出口|充电|公司|学校|宿舍|银行|超市|暂停营业|已停业|停业|歇业|撤店|建设中|装修|招商|取餐点|提货点|配送站|外卖柜|骑手/

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
    assert(!BAD_PUBLIC_NAME_PATTERN.test(restaurant.name), `seed restaurant ${restaurant.id} looks closed/non-restaurant: ${restaurant.name}`)
    assert(CAMPUS_LABELS.includes(restaurant.campusLabel), `seed restaurant ${restaurant.id} missing valid campusLabel`)
    assert(typeof restaurant.campusKey === 'string' && restaurant.campusKey.length > 0, `seed restaurant ${restaurant.id} missing campusKey`)
    assert(typeof restaurant.campusDistance === 'number' && restaurant.campusDistance >= 0, `seed restaurant ${restaurant.id} missing valid campusDistance`)
    assert(restaurant.tags.includes(restaurant.campusLabel), `seed restaurant ${restaurant.id} tags must include campusLabel`)
    const campusTagCount = restaurant.tags.filter((tag) => CAMPUS_LABELS.includes(tag)).length
    assert(campusTagCount === 1, `seed restaurant ${restaurant.id} must contain exactly one campus tag`)
    const categoryCount = Number(restaurant.tags.includes('正餐')) + Number(restaurant.tags.includes('饮品'))
    assert(categoryCount === 1, `seed restaurant ${restaurant.id} must be exactly one of 正餐/饮品`)
    if (restaurant.tags.includes('饮品')) {
      assert(!restaurant.mealPeriods?.includes('中餐') && !restaurant.mealPeriods?.includes('晚餐'), `drink seed ${restaurant.id} must not be mixed into lunch/dinner meal periods`)
    }
    if (restaurant.sourceRefs !== undefined) {
      assert(Array.isArray(restaurant.sourceRefs) && restaurant.sourceRefs.length > 0, `seed restaurant ${restaurant.id} sourceRefs must not be empty`)
    }
    const hasStudentUgcSource = Array.isArray(restaurant.sourceRefs) && restaurant.sourceRefs.some((source) => source?.type === 'student_ugc')
    if (!hasStudentUgcSource) {
      assert(restaurant.studentScore === 0, `seed restaurant ${restaurant.id} must not invent studentScore without student_ugc source`)
      assert(restaurant.checkins === 0, `seed restaurant ${restaurant.id} must not invent checkins without student_ugc source`)
      assert(restaurant.reason.includes('公开信息整理'), `seed restaurant ${restaurant.id} must disclose public-source reason`)
      assert(!/学生打卡|学生评价|学生评分/.test(restaurant.reason), `seed restaurant ${restaurant.id} must not imply student feedback without student_ugc source`)
    }
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
    if (review.userName === '互联网小助手') {
      assert(review.text.includes('公开信息整理'), `system review ${review.id} must disclose public-source summary`)
      assert(Array.isArray(review.tags) && review.tags.includes('系统整理'), `system review ${review.id} must include 系统整理 tag`)
    }
    reviewCounts.set(review.restaurantId, (reviewCounts.get(review.restaurantId) || 0) + 1)
  }

  for (const restaurantId of restaurantIds) {
    assert((reviewCounts.get(restaurantId) || 0) > 0, `restaurant ${restaurantId} must have at least one review`)
  }
}

async function checkApiService() {
  const apiService = require('../api/_shared/restaurantService.cjs')
  const metadata = apiService.getMetadata()
  assert(metadata.tasteTags.includes('全部'), 'api metadata tasteTags must include 全部')
  assert(metadata.tasteTags.includes('非食堂'), 'api metadata tasteTags must include 非食堂')
  assert(metadata.priceRanges.some((range) => range.label === '不限'), 'api metadata priceRanges must include 不限')

  const all = apiService.listRestaurants({ preferences: '近,实惠,辣' })
  assert(all.length > 0, 'api listRestaurants should return published restaurants')
  assert(typeof all[0].recommendationScore === 'number', 'api listRestaurants should decorate recommendationScore')
  for (let index = 1; index < all.length; index += 1) {
    assert((all[index - 1].recommendationScore || 0) >= (all[index].recommendationScore || 0), 'api listRestaurants default order must be recommendationScore desc')
  }

  const filtered = apiService.listRestaurants({ tag: '实惠', price: '30以内', sort: 'recommended' })
  assert(filtered.length > 0, 'api filtered list should return restaurants')
  const meals = apiService.listRestaurants({ tag: '正餐', sort: 'recommended' })
  const drinks = apiService.listRestaurants({ tag: '饮品', sort: 'recommended' })
  const zijingangMeals = apiService.listRestaurants({ campus: '紫金港', tag: '正餐', sort: 'recommended' })
  const nonCanteenMeals = apiService.listRestaurants({ campus: '紫金港', preferences: '非食堂', sort: 'recommended' })
  assert(meals.length > 0 && meals.every((restaurant) => restaurant.tags.includes('正餐') && !restaurant.tags.includes('饮品')), 'api 正餐 filter must not mix drinks')
  assert(drinks.length > 0 && drinks.every((restaurant) => restaurant.tags.includes('饮品') && !restaurant.tags.includes('正餐')), 'api 饮品 filter must not mix meals')
  assert(zijingangMeals.length > 0 && zijingangMeals.every((restaurant) => restaurant.campusLabel === '紫金港'), 'api campus filter must keep results inside selected campus')
  assert(nonCanteenMeals.length > 0 && nonCanteenMeals.every((restaurant) => !/食堂|餐饮中心|校内食堂|学生餐厅|玉湖餐厅|麦香餐厅|风味餐厅|浙江大学.*餐厅|校区.*餐厅/.test([restaurant.name, restaurant.area, restaurant.cuisine, ...(restaurant.tags || [])].join(' '))), 'api 非食堂 preference must exclude canteen-style restaurants')

  const detail = apiService.getRestaurantDetail('r001', { preferences: '近,实惠' })
  assert(detail && detail.restaurant.id === 'r001', 'api getRestaurantDetail should return r001')
  assert(Array.isArray(detail.dishes), 'api detail should expose dishes array')
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

async function checkProfileContracts() {
  const { readJsonBody } = require('../api/_shared/requestBody.cjs')
  const { mapAppUser, updateAppUser } = require('../api/_shared/appProfile.cjs')
  const webProfileService = fs.readFileSync(path.join(root, 'src/services/appUserProfileService.ts'), 'utf8')
  const apiProfileService = fs.readFileSync(path.join(root, 'api/_shared/appProfile.cjs'), 'utf8')
  const apiProfileRoute = fs.readFileSync(path.join(root, 'api/profile/index.js'), 'utf8')
  const avatarHandler = fs.readFileSync(path.join(root, 'api/profile/avatar.js'), 'utf8')
  const profileRoute = fs.readFileSync(path.join(root, 'src/routes/ProfilePage.tsx'), 'utf8')
  const homeRoute = fs.readFileSync(path.join(root, 'src/routes/HomePage.tsx'), 'utf8')
  const discoverRoute = fs.readFileSync(path.join(root, 'src/routes/DiscoverPage.tsx'), 'utf8')
  const onboardingDialog = fs.readFileSync(path.join(root, 'src/components/OnboardingDialog.tsx'), 'utf8')
  const preferenceStore = fs.readFileSync(path.join(root, 'src/services/preferenceStore.ts'), 'utf8')
  const miniProfileService = fs.readFileSync(path.join(root, 'services/userProfileService.js'), 'utf8')

  const parsedBuffer = await readJsonBody({ body: Buffer.from(JSON.stringify({ displayName: 'BucketSran', avatarPreset: 'duck' })) })
  assert(parsedBuffer.displayName === 'BucketSran', 'request body parser must read Buffer JSON bodies')
  assert(parsedBuffer.avatarPreset === 'duck', 'request body parser must preserve avatarPreset from Buffer JSON bodies')

  const parsedUint8 = await readJsonBody({ body: new Uint8Array(Buffer.from(JSON.stringify({ avatarType: 'preset' }))) })
  assert(parsedUint8.avatarType === 'preset', 'request body parser must read Uint8Array JSON bodies')

  const apiProfile = mapAppUser({
    id: 'profile_contract_id',
    display_name: 'BucketSran',
    avatar_type: 'preset',
    avatar_preset: 'duck',
    avatar_url: '',
    default_campus: '玉泉',
    preferences: ['近', '辣']
  })
  assert(apiProfile.displayName === 'BucketSran', 'profile API contract must expose displayName')
  assert(apiProfile.avatarPreset === 'duck', 'profile API contract must expose avatarPreset')
  assert(apiProfile.avatarType === 'preset', 'profile API contract must expose avatarType')
  assert(apiProfile.defaultCampus === '玉泉', 'profile API contract must expose defaultCampus')

  const updates = []
  const mockClient = {
    from(table) {
      assert(table === 'app_users', 'profile update should write app_users')
      return {
        update(body) {
          updates.push(body)
          return {
            eq() {
              return {
                select() {
                  return {
                    single: async () => ({
                      data: {
                        id: 'profile_contract_id',
                        display_name: body.display_name,
                        avatar_type: body.avatar_type,
                        avatar_preset: body.avatar_preset,
                        avatar_url: body.avatar_url,
                        default_campus: body.default_campus,
                        preferences: body.preferences
                      },
                      error: null
                    })
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  const updated = await updateAppUser(mockClient, 'profile_contract_id', {
    displayName: 'BucketSran',
    avatarType: 'preset',
    avatarPreset: 'frog',
    avatarUrl: '',
    defaultCampus: '玉泉',
    preferences: ['近', '近', '实惠']
  })
  assert(updates[0].display_name === 'BucketSran', 'profile update must map displayName to display_name')
  assert(updates[0].avatar_preset === 'frog', 'profile update must map avatarPreset to avatar_preset')
  assert(updates[0].default_campus === '玉泉', 'profile update must map defaultCampus to default_campus')
  assert(updated.default_campus === '玉泉' && mapAppUser(updated).defaultCampus === '玉泉', 'profile update must return mappable defaultCampus')
  assert(updated.preferences.length === 2, 'profile update must deduplicate preferences')
  await updateAppUser(mockClient, 'profile_contract_id', { displayName: 'Only Name' })
  assert(Object.keys(updates[1]).length === 1 && updates[1].display_name === 'Only Name', 'profile update must PATCH only changed fields')
  assert(webProfileService.includes('const AVATAR_MAX_BYTES = 512 * 1024'), 'web avatar limit must be 0.5MB')
  assert(apiProfileService.includes('const MAX_AVATAR_BYTES = 512 * 1024'), 'api avatar limit must be 0.5MB')
  assert(miniProfileService.includes('const MAX_AVATAR_SIZE = 512 * 1024'), 'mini avatar limit must be 0.5MB')
  assert(!webProfileService.includes('const current = await ensureAppUserProfile()'), 'profile PATCH should not prefetch current profile before every save')
  assert(avatarHandler.includes('updateAppUser(auth.client, appUser.id'), 'avatar upload endpoint must persist avatar in the same request')
  assert(!profileRoute.includes('const avatarUrl = await uploadAppUserAvatar'), 'web avatar upload should not require a second profile PATCH')
  assert(apiProfileRoute.includes('defaultCampus'), 'profile PATCH allowlist must include defaultCampus')
  assert(preferenceStore.includes('getDefaultCampus') && preferenceStore.includes('setDefaultCampus'), 'preference store must expose default campus helpers')
  assert(profileRoute.includes('DEFAULT CAMPUS') && profileRoute.includes('chooseDefaultCampus'), 'profile page must expose default campus selector')
  assert(homeRoute.includes("tag: '正餐'") && homeRoute.includes('defaultCampus'), 'home page recommendations must be constrained by default campus and meal category')
  assert(discoverRoute.includes('查看详情') && discoverRoute.includes('/restaurants/${randomPick.id}'), 'discover random pick must link to restaurant detail')
  assert(discoverRoute.includes('useDeferredValue'), 'discover search should defer keyword-driven API calls')
  assert(onboardingDialog.includes('你好，灿若星辰的浙大人') && onboardingDialog.includes('eatAtZju:web:onboarding:v1'), 'onboarding dialog must include intro copy and one-time localStorage guard')
}

function checkLeaderboardContracts() {
  const leaderboardRoute = fs.readFileSync(path.join(root, 'src/routes/LeaderboardsPage.tsx'), 'utf8')
  const leaderboardService = fs.readFileSync(path.join(root, 'src/services/leaderboardService.ts'), 'utf8')
  const taxonomy = fs.readFileSync(path.join(root, 'src/constants/restaurantTaxonomy.ts'), 'utf8')
  const apiClient = fs.readFileSync(path.join(root, 'src/services/apiRestaurantClient.ts'), 'utf8')

  assert(leaderboardRoute.includes('listRestaurantsRemote'), 'leaderboard page must read async API/Supabase data')
  assert(leaderboardRoute.includes('SegmentedControl') && leaderboardRoute.includes('榜单校区'), 'leaderboard page must expose campus selector')
  assert(!leaderboardRoute.includes('getLeaderboards('), 'leaderboard page must not use empty sync restaurant list')
  assert(leaderboardService.includes('buildLeaderboards') && leaderboardService.includes('isCanteenRestaurant'), 'leaderboard service must build boards from provided restaurants and respect non-canteen preference')
  assert(taxonomy.includes('非食堂'), 'taxonomy must expose 非食堂 preference')
  assert(apiClient.includes('API_CACHE_TTL_MS') && apiClient.includes('responseCache'), 'api client must cache repeated GET requests')
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
    const submissionsHandler = require('../api/submissions/index.js')
    const adminSubmissionsHandler = require('../api/admin/submissions/index.js')
    const adminAuditLogsHandler = require('../api/admin/audit-logs/index.js')
    const campusVerifyHandler = require('../api/auth/campus-verify.js')

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

    const unauthenticatedSubmission = await callHandler(submissionsHandler, { method: 'POST', headers: {}, body: { type: 'restaurant', payload: { title: 'demo' } } })
    assert(unauthenticatedSubmission.statusCode === 401, 'submissions handler should require bearer auth')

    const unauthenticatedAdmin = await callHandler(adminSubmissionsHandler, { method: 'GET', headers: {} })
    assert(unauthenticatedAdmin.statusCode === 401, 'admin submissions handler should require bearer auth')

    const unauthenticatedAuditLogs = await callHandler(adminAuditLogsHandler, { method: 'GET', headers: {} })
    assert(unauthenticatedAuditLogs.statusCode === 401, 'admin audit logs handler should require bearer auth')

    const unauthenticatedCampusVerify = await callHandler(campusVerifyHandler, { method: 'POST', headers: {} })
    assert(unauthenticatedCampusVerify.statusCode === 401, 'campus verification should require bearer auth')
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
    'admins can read audit logs',
    'admins can insert audit logs'
  ]

  for (const policy of requiredPolicies) {
    assert(migration.includes(`create policy "${policy}"`), `migration missing policy: ${policy}`)
  }

  assert(migration.includes('constraint profiles_preferences_length'), 'migration missing preferences length guard')
  assert(migration.includes('constraint submissions_payload_size'), 'migration missing submissions payload size guard')
  assert(migration.includes("restaurants.status = 'published'"), 'migration missing published restaurant guard')
  const campusMigration = fs.readFileSync(path.join(root, 'supabase/migrations/202605100002_app_user_default_campus.sql'), 'utf8')
  assert(campusMigration.includes('default_campus'), 'campus migration must add app_users.default_campus')
  assert(campusMigration.includes('app_users_default_campus_valid'), 'campus migration must constrain valid campus values')

  run(process.execPath, ['scripts/generate-supabase-seed.cjs', '--check'])
}

function checkDeploymentScripts() {
  const applyScript = fs.readFileSync(path.join(root, 'scripts/apply-supabase.cjs'), 'utf8')
  const smokeScript = fs.readFileSync(path.join(root, 'scripts/smoke-api.cjs'), 'utf8')

  assert(applyScript.includes('SUPABASE_DB_URL'), 'apply script must require SUPABASE_DB_URL')
  assert(applyScript.includes('app_private.schema_migrations'), 'apply script must track applied migrations')
  assert(!applyScript.includes('console.log(process.env.SUPABASE_DB_URL)'), 'apply script must not print SUPABASE_DB_URL')
  assert(smokeScript.includes('EXPECT_API_SOURCE'), 'smoke script must verify expected API source')
  assert(smokeScript.includes('API_BASE_URL'), 'smoke script must support remote API_BASE_URL')
}

async function main() {
  checkJavaScript()
  checkJson()
  checkLegacyRestaurantData()
  checkSeedData()
  await checkApiService()
  await checkProfileContracts()
  checkLeaderboardContracts()
  await checkApiHandlers()
  checkSupabaseFiles()
  checkDeploymentScripts()
  console.log('check ok')
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
