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
  const apiService = require('../server/api/_shared/restaurantService.cjs')
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
    const apiRepository = require('../server/api/_shared/restaurantRepository.cjs')
    const repositoryList = await apiRepository.listRestaurants({ preferences: '近,实惠,辣' })
    assert(repositoryList.source === 'seed', 'api repository should fall back to seed when Supabase is not configured')
    assert(repositoryList.data.length > 0, 'api repository fallback list should return restaurants')
    assert(repositoryList.fallbackReason === 'supabase_not_configured', 'api repository should report missing Supabase config')
  })
}

async function checkProfileContracts() {
  const { readJsonBody } = require('../server/api/_shared/requestBody.cjs')
  const { mapAppUser, updateAppUser } = require('../server/api/_shared/appProfile.cjs')
  const webProfileService = fs.readFileSync(path.join(root, 'src/services/appUserProfileService.ts'), 'utf8')
  const apiProfileService = fs.readFileSync(path.join(root, 'server/api/_shared/appProfile.cjs'), 'utf8')
  const apiProfileRoute = fs.readFileSync(path.join(root, 'server/api/profile/index.js'), 'utf8')
  const avatarHandler = fs.readFileSync(path.join(root, 'server/api/profile/avatar.js'), 'utf8')
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
  assert(homeRoute.includes('randomCampus') && homeRoute.includes('getCategoryTags(mealCategory)'), 'home page recommendations must be constrained by selected campus and meal category')
  assert(homeRoute.includes('isRandomLoading') && homeRoute.includes('再摇一次'), 'home random pick must expose repeatable loading feedback')
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
  assert(!leaderboardRoute.includes('setDefaultCampus'), 'leaderboard campus selector must not silently rewrite profile default campus')
  assert(leaderboardService.includes('buildLeaderboards') && leaderboardService.includes('isCanteenRestaurant'), 'leaderboard service must build boards from provided restaurants and respect non-canteen preference')
  assert(leaderboardService.includes('b.boardScore') && leaderboardService.includes('a.boardScore'), 'leaderboard restaurants must be sorted by boardScore desc')
  assert(leaderboardService.includes("'breakfast'") && leaderboardService.includes('requiredTags') && leaderboardService.includes('excludeTags'), 'leaderboards must include breakfast and hard board boundaries')
  assert(taxonomy.includes('非食堂'), 'taxonomy must expose 非食堂 preference')
  assert(apiClient.includes('API_CACHE_TTL_MS') && apiClient.includes('API_CACHE_MAX_ENTRIES') && apiClient.includes('setCachedResponse'), 'api client must cache repeated GET requests with a bounded cache')
  assert(apiClient.includes("cache: strategy !== 'random'"), 'random recommendation requests must bypass client GET cache')
}

function checkMapNavigationContracts() {
  const mapLinks = fs.readFileSync(path.join(root, 'src/lib/mapLinks.ts'), 'utf8')
  const mapComponent = fs.readFileSync(path.join(root, 'src/components/MapNavigationLinks.tsx'), 'utf8')
  const detailRoute = fs.readFileSync(path.join(root, 'src/routes/RestaurantDetailPage.tsx'), 'utf8')
  const restaurantCard = fs.readFileSync(path.join(root, 'src/components/RestaurantCard.tsx'), 'utf8')

  assert(mapLinks.includes('uri.amap.com/navigation'), 'map links must include AMap navigation URI')
  assert(mapLinks.includes('api.map.baidu.com/direction'), 'map links must include Baidu direction URI')
  assert(mapLinks.includes('maps.apple.com'), 'map links must include Apple Maps URI')
  assert(mapLinks.includes('gcj02ToBd09'), 'Baidu links should convert GCJ-02 coordinates to BD-09')
  assert(mapComponent.includes('target="_blank"') && mapComponent.includes('rel="noreferrer"'), 'map links must open safely in a new tab')
  assert(detailRoute.includes('MapNavigationLinks restaurant={restaurant}'), 'restaurant detail page must expose map navigation links')
  assert(restaurantCard.includes('MapNavigationLinks compact'), 'restaurant cards must expose compact map navigation menu')
}

function checkAdminReviewContracts() {
  const adminRoute = fs.readFileSync(path.join(root, 'src/routes/AdminPage.tsx'), 'utf8')
  const publishedOpsPanel = fs.readFileSync(path.join(root, 'src/components/PublishedContentOpsPanel.tsx'), 'utf8')
  const contentChangeService = fs.readFileSync(path.join(root, 'src/services/adminContentChangeService.ts'), 'utf8')
  const contentChangeApi = fs.readFileSync(path.join(root, 'server/api/admin/content-change-requests/index.js'), 'utf8')
  const materializer = fs.readFileSync(path.join(root, 'server/api/_shared/submissionMaterializer.cjs'), 'utf8')
  const adminSubmissions = fs.readFileSync(path.join(root, 'server/api/admin/submissions/index.js'), 'utf8')
  const adminAuditLogs = fs.readFileSync(path.join(root, 'server/api/admin/audit-logs/index.js'), 'utf8')
  const apiRestaurantService = fs.readFileSync(path.join(root, 'server/api/_shared/restaurantService.cjs'), 'utf8')
  const webRecommendation = fs.readFileSync(path.join(root, 'src/lib/recommendation.ts'), 'utf8')

  assert(adminRoute.includes('快审预览'), 'admin page must expose quick review preview')
  assert(adminRoute.includes('事实核验') && adminRoute.includes('口味判断'), 'admin page must split factual and taste review')
  assert(adminRoute.includes('通过并推荐') && adminRoute.includes('通过但不主推'), 'admin page must expose quick moderation actions')
  assert(adminRoute.includes('moderationSignals'), 'admin page must persist structured quick review signals on approval')
  assert(adminRoute.includes('PublishedContentOpsPanel'), 'admin page must include published content ops panel')
  assert(publishedOpsPanel.includes('已发布内容快改'), 'published ops panel must expose quick published-content editing')
  assert(publishedOpsPanel.includes('不主推') && publishedOpsPanel.includes('下架隐藏'), 'published ops panel must support hide/demote workflows')
  assert(publishedOpsPanel.includes('initialQuickAdd') && publishedOpsPanel.includes('可能已存在'), 'published ops panel must support quick add with duplicate hints')
  assert(publishedOpsPanel.includes('快改历史筛选') && publishedOpsPanel.includes('批量提交筛选草案'), 'published ops panel must expose filterable quick-edit history and batch actions')
  assert(publishedOpsPanel.includes('createContentChangeRequest') && publishedOpsPanel.includes('submitContentChangeRequests'), 'published ops panel must write drafts through content_change_requests')
  assert(contentChangeService.includes('/api/admin/content-change-requests') && contentChangeApi.includes('submitRequestsToQueue'), 'content change service/API must support queued batch submission')
  assert(publishedOpsPanel.includes("submissionType: 'correction'") && publishedOpsPanel.includes("submissionType: 'restaurant'"), 'published ops panel must route edits and additions through typed submissions')
  assert(materializer.includes('materializeCorrectionSubmission') && materializer.includes("opsAction") && materializer.includes("'demote', 'archive', 'edit'"), 'materializer must apply published content correction ops')
  assert(materializer.includes('beforeData: before') && materializer.includes("status: 'archived'") && materializer.includes('不主推'), 'materializer must keep rollback snapshots and support archive/demote')
  assert(adminSubmissions.includes("rpc('review_submission_atomic'"), 'admin review must delegate review/materialization to the atomic Supabase RPC')
  assert(adminSubmissions.includes('review_submission_atomic') && !adminSubmissions.includes('materializeSubmission'), 'admin review API must not materialize outside the database transaction')
  assert(adminAuditLogs.includes("rpc('rollback_audit_log_atomic'") && !adminAuditLogs.includes('.upsert('), 'audit rollback API must delegate rollback to the atomic Supabase RPC')
  assert(contentChangeApi.includes('MANUALLY_MUTABLE_STATUSES') && contentChangeApi.includes('source_content_change_request_id'), 'content change API must harden state transitions and idempotent queueing')
  assert(apiRestaurantService.includes('isNotRecommended') && webRecommendation.includes('isNotRecommended'), 'recommendation scoring must honor 不主推 in frontend and API paths')
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
    const listHandler = require('../server/api/restaurants/index.js')
    const detailHandler = require('../server/api/restaurants/[id].js')
    const recommendHandler = require('../server/api/recommend/today.js')
    const submissionsHandler = require('../server/api/submissions/index.js')
    const adminSubmissionsHandler = require('../server/api/admin/submissions/index.js')
    const adminContentChangeHandler = require('../server/api/admin/content-change-requests/index.js')
    const adminAuditLogsHandler = require('../server/api/admin/audit-logs/index.js')
    const campusVerifyHandler = require('../server/api/auth/campus-verify.js')

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

    const unauthenticatedContentChange = await callHandler(adminContentChangeHandler, { method: 'GET', headers: {} })
    assert(unauthenticatedContentChange.statusCode === 401, 'admin content change handler should require bearer auth')

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
  const contentChangeMigration = fs.readFileSync(path.join(root, 'supabase/migrations/202605110001_content_change_requests.sql'), 'utf8')
  assert(contentChangeMigration.includes('create table if not exists public.content_change_requests'), 'content change migration must create content_change_requests')
  assert(contentChangeMigration.includes("action in ('demote', 'archive', 'edit', 'add')"), 'content change migration must constrain action values')
  assert(contentChangeMigration.includes("status in ('draft', 'queued', 'materialized', 'rejected')"), 'content change migration must constrain status values')
  assert(contentChangeMigration.includes('source_submission_id text references public.submissions(id)'), 'content change migration must link to submissions')
  assert(contentChangeMigration.includes('content_change_target_name_length') && contentChangeMigration.includes('content_change_summary_length'), 'content change migration must constrain public text lengths')
  assert(contentChangeMigration.includes('alter table public.content_change_requests enable row level security'), 'content change migration must enable RLS')
  assert(contentChangeMigration.includes('admins can manage content change requests'), 'content change migration must restrict management to admins')
  assert(contentChangeMigration.includes('content_change_requests_status_idx') && contentChangeMigration.includes('content_change_requests_action_idx'), 'content change migration must add status/action indexes')
  assert(contentChangeMigration.includes('content_change_requests_source_submission_unique_idx'), 'content change migration must keep one request per queued submission')
  const reviewHardeningMigration = fs.readFileSync(path.join(root, 'supabase/migrations/202605110002_review_workflow_hardening.sql'), 'utf8')
  assert(reviewHardeningMigration.includes("status in ('pending', 'reviewing', 'approved', 'rejected')"), 'review hardening migration must add reviewing claim status')
  assert(reviewHardeningMigration.includes('source_content_change_request_id') && reviewHardeningMigration.includes('submissions_source_content_change_request_unique_idx'), 'review hardening migration must make queued content changes idempotent')
  assert(reviewHardeningMigration.includes('materialized_target_id'), 'review hardening migration must persist materialized targets for traceability')
  const reviewRpcMigration = fs.readFileSync(path.join(root, 'supabase/migrations/202605110003_review_submission_atomic_rpc.sql'), 'utf8')
  assert(reviewRpcMigration.includes('create or replace function public.review_submission_atomic'), 'review RPC migration must create review_submission_atomic')
  assert(reviewRpcMigration.includes('for update') && reviewRpcMigration.includes('insert into public.audit_logs'), 'review RPC must lock pending submissions and write audit logs transactionally')
  assert(reviewRpcMigration.includes('public.content_change_requests') && reviewRpcMigration.includes('materialized_target_id'), 'review RPC must sync content change request materialization targets')
  const auditRollbackMigration = fs.readFileSync(path.join(root, 'supabase/migrations/202605110004_audit_rollback_rpc_and_review_grants.sql'), 'utf8')
  assert(auditRollbackMigration.includes('grant execute on function public.review_submission_atomic') && auditRollbackMigration.includes('to service_role'), 'review RPC must be restricted to service_role execution')
  assert(auditRollbackMigration.includes('create or replace function public.rollback_audit_log_atomic'), 'audit rollback migration must create rollback_audit_log_atomic')
  assert(auditRollbackMigration.includes('rollback_of') && auditRollbackMigration.includes('Audit log has already been rolled back'), 'audit rollback must track and prevent duplicate rollbacks')
  const safeRollbackMigration = fs.readFileSync(path.join(root, 'supabase/migrations/202605110005_safe_restaurant_insert_rollback.sql'), 'utf8')
  assert(safeRollbackMigration.includes('Rollback would delete dependent restaurant content'), 'restaurant insert rollback must protect dependent dishes/reviews')

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

function checkServerSupabaseClientContracts() {
  const supabaseClient = fs.readFileSync(path.join(root, 'server/api/_shared/supabaseClient.cjs'), 'utf8')
  const authHelper = fs.readFileSync(path.join(root, 'server/api/_shared/auth.cjs'), 'utf8')
  const campusVerify = fs.readFileSync(path.join(root, 'server/api/auth/campus-verify.js'), 'utf8')
  const accountLink = fs.readFileSync(path.join(root, 'server/api/account/link-code.js'), 'utf8')

  assert(supabaseClient.includes('createUserRlsSupabaseClient'), 'server Supabase client must expose an explicit user RLS client')
  assert(supabaseClient.includes('createServiceRoleSupabaseClient'), 'server Supabase client must expose an explicit service-role client')
  assert(supabaseClient.includes('createAuthSupabaseClient'), 'server Supabase client must expose an explicit auth client')
  assert(!/function createUserRlsSupabaseClient[\\s\\S]*?serviceRoleKey/.test(supabaseClient), 'user RLS client must not fall back to service-role credentials')
  assert(authHelper.includes('createUserRlsSupabaseClient(token)'), 'authenticated requests must use the user RLS client by default')
  assert(authHelper.includes('serviceClient: createServiceRoleSupabaseClient()'), 'authenticated context must keep service role as an explicit separate seam')
  assert(authHelper.includes('Admin workflow requires SUPABASE_SERVICE_ROLE_KEY'), 'admin workflows must require service-role credentials explicitly')
  assert(campusVerify.includes('const serviceClient = auth.serviceClient') && campusVerify.includes('await serviceClient'), 'campus verification must use the explicit service-role seam for user_trust writes')
  assert(accountLink.includes('const writeClient = auth.serviceClient || auth.client'), 'account link code creation must use an explicit write client seam')
}

function toRequirePath(fromDir, targetFile) {
  const relativePath = path.relative(fromDir, targetFile).replace(/\\/g, '/')
  return relativePath.startsWith('.') ? relativePath : `./${relativePath}`
}

function checkApiWrapperContracts() {
  const apiDir = path.join(root, 'api')
  const serverApiDir = path.join(root, 'server/api')
  assert(fs.existsSync(apiDir), 'missing Vercel api directory')
  assert(fs.existsSync(serverApiDir), 'missing server/api implementation directory')

  const serverRoutes = walk(serverApiDir, (file) => file.endsWith('.js') && !file.includes(`${path.sep}_shared${path.sep}`))
  for (const serverRoute of serverRoutes) {
    const relativeRoute = path.relative(serverApiDir, serverRoute)
    const wrapperPath = path.join(apiDir, relativeRoute)
    assert(fs.existsSync(wrapperPath), `missing Vercel API wrapper for server route: api/${relativeRoute}`)

    const wrapper = fs.readFileSync(wrapperPath, 'utf8').trim()
    const expectedRequire = toRequirePath(path.dirname(wrapperPath), serverRoute)
    assert(wrapper.includes(`require('${expectedRequire}')`) || wrapper.includes(`require("${expectedRequire}")`), `api/${relativeRoute} must require ${expectedRequire}`)
  }

  const wrapperFiles = walk(apiDir, (file) => file.endsWith('.js'))
  assert(
    wrapperFiles.length <= 12,
    `Vercel Hobby allows at most 12 Serverless Functions; found ${wrapperFiles.length} api/**/*.js wrappers. Merge or remove API routes before deploying.`
  )
  for (const wrapperPath of wrapperFiles) {
    const wrapper = fs.readFileSync(wrapperPath, 'utf8')
    const match = wrapper.match(/require\(['"](.+?)['"]\)/)
    assert(match, `api wrapper must delegate with require(): ${path.relative(root, wrapperPath)}`)
    const target = path.resolve(path.dirname(wrapperPath), match[1])
    assert(target.startsWith(serverApiDir), `api wrapper must delegate into server/api: ${path.relative(root, wrapperPath)}`)
    assert(fs.existsSync(target), `api wrapper target does not exist: ${path.relative(root, wrapperPath)} -> ${match[1]}`)
  }

  const requiredSharedModules = [
    'auth.cjs',
    'requestBody.cjs',
    'requestValidation.cjs',
    'restaurantRepository.cjs',
    'restaurantService.cjs',
    'supabaseClient.cjs'
  ]
  for (const fileName of requiredSharedModules) {
    assert(fs.existsSync(path.join(serverApiDir, '_shared', fileName)), `missing server/api shared module: ${fileName}`)
  }
}

function checkFeatureWorkflowDocs() {
  const requiredDocs = [
    'docs/FEATURE_REGISTRY.md',
    'docs/FEATURE_WORKFLOW.md',
    'docs/MCP_INTEGRATION_MATRIX.md',
    'docs/ROADMAP.md'
  ]

  for (const relativePath of requiredDocs) {
    assert(fs.existsSync(path.join(root, relativePath)), `missing workflow doc: ${relativePath}`)
  }

  const registry = fs.readFileSync(path.join(root, 'docs/FEATURE_REGISTRY.md'), 'utf8')
  const workflow = fs.readFileSync(path.join(root, 'docs/FEATURE_WORKFLOW.md'), 'utf8')
  const matrix = fs.readFileSync(path.join(root, 'docs/MCP_INTEGRATION_MATRIX.md'), 'utf8')
  const roadmap = fs.readFileSync(path.join(root, 'docs/ROADMAP.md'), 'utf8')
  const agents = fs.readFileSync(path.join(root, 'AGENTS.md'), 'utf8')
  const featureTemplate = fs.readFileSync(path.join(root, '.github/ISSUE_TEMPLATE/feature_request.md'), 'utf8')
  const bugTemplate = fs.readFileSync(path.join(root, '.github/ISSUE_TEMPLATE/bug_report.md'), 'utf8')
  const prTemplate = fs.readFileSync(path.join(root, '.github/pull_request_template.md'), 'utf8')

  for (const id of ['F01', 'F03', 'F06', 'F08', 'F11', 'F15']) {
    assert(registry.includes(id), `feature registry missing ${id}`)
  }
  for (const milestone of ['M0', 'M1', 'M2', 'M3', 'M4', 'M5']) {
    assert(roadmap.includes(milestone), `roadmap missing ${milestone}`)
  }
  assert(workflow.includes('MCP') && workflow.includes('scripts/check.cjs'), 'feature workflow must require MCP review and contract checks')
  assert(matrix.includes('Browser Use') && matrix.includes('Supabase') && matrix.includes('Vercel') && matrix.includes('Maps'), 'MCP matrix must cover browser, Supabase, Vercel, and maps')
  assert(agents.includes('docs/FEATURE_REGISTRY.md') && agents.includes('docs/MCP_INTEGRATION_MATRIX.md'), 'AGENTS.md must reference feature workflow docs')
  assert(featureTemplate.includes('MCP / Tool Review') && featureTemplate.includes('Feature Registry'), 'feature issue template must include registry and MCP review')
  assert(bugTemplate.includes('归属与防回归') && bugTemplate.includes('Feature ID'), 'bug issue template must include ownership and regression guard')
  assert(prTemplate.includes('Feature Workflow') && prTemplate.includes('docs/MCP_INTEGRATION_MATRIX.md'), 'PR template must include feature workflow checks')
}

async function main() {
  checkJavaScript()
  checkJson()
  checkLegacyRestaurantData()
  checkSeedData()
  await checkApiService()
  await checkProfileContracts()
  checkLeaderboardContracts()
  checkMapNavigationContracts()
  checkAdminReviewContracts()
  await checkApiHandlers()
  checkSupabaseFiles()
  checkDeploymentScripts()
  checkServerSupabaseClientContracts()
  checkApiWrapperContracts()
  checkFeatureWorkflowDocs()
  console.log('check ok')
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
