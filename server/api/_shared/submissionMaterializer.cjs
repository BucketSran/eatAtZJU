const DEFAULT_COORDS_BY_CAMPUS = {
  紫金港: { latitude: 30.3088, longitude: 120.0865 },
  玉泉: { latitude: 30.2654, longitude: 120.1236 },
  西溪: { latitude: 30.2767, longitude: 120.1392 },
  华家池: { latitude: 30.2693, longitude: 120.1969 },
  之江: { latitude: 30.1974, longitude: 120.1292 },
  海宁: { latitude: 30.5164, longitude: 120.6798 }
}
const DEFAULT_COORDS = DEFAULT_COORDS_BY_CAMPUS.紫金港

function cleanText(value, fallback = '') {
  return typeof value === 'string' && value.trim() ? value.trim() : fallback
}

function cleanTags(value) {
  if (!Array.isArray(value)) return []
  return [...new Set(value.filter((tag) => typeof tag === 'string').map((tag) => tag.trim()).filter(Boolean))].slice(0, 12)
}

function cleanMealPeriods(payload) {
  const periods = cleanTags(payload.mealPeriods)
  if (periods.length) return periods
  const period = cleanText(payload.mealPeriod)
  return period ? [period] : []
}

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function toNumber(value, fallback, min, max) {
  const number = Number(value)
  if (!Number.isFinite(number)) return fallback
  return Math.min(max, Math.max(min, number))
}

function idFromSubmission(prefix, submissionId) {
  const compact = String(submissionId || '').replace(/[^0-9a-z]/gi, '').slice(-24)
  return `${prefix}_${compact || Date.now().toString(36)}`
}

function getCoverIcon(title) {
  const first = cleanText(title, '饭').trim()[0]
  return first || '饭'
}

function getCampusCoords(campus) {
  return DEFAULT_COORDS_BY_CAMPUS[cleanText(campus)] || DEFAULT_COORDS
}

function buildSourceRefs(submission, reviewerId) {
  return [
    {
      type: 'submission',
      id: submission.id,
      submitter_id: submission.submitter_id,
      reviewer_id: reviewerId,
      reviewed_at: new Date().toISOString()
    }
  ]
}

function buildRestaurantRow(submission, reviewerId) {
  const payload = submission.payload || {}
  const title = cleanText(payload.title, '学生推荐餐厅')
  const campus = cleanText(payload.campus, '紫金港')
  const campusCoords = getCampusCoords(campus)
  const distance = toNumber(payload.distance, 1, 0, 20)
  const tags = cleanTags(payload.tags)
  const diningMode = cleanText(payload.serviceMode === '都可以' ? '' : payload.serviceMode, cleanText(payload.diningMode))
  const mealPeriods = cleanMealPeriods(payload)
  const mealPeriod = mealPeriods[0] || cleanText(payload.mealPeriod)
  const serviceModes = cleanTags(payload.serviceModes || (diningMode ? [diningMode] : []))
  const scenarioTags = cleanTags(payload.scenarioTags)
  const constraintTags = cleanTags(payload.constraintTags || [
    payload.spiceLevel && payload.spiceLevel !== '不限' ? payload.spiceLevel : '',
    payload.loadLevel && payload.loadLevel !== '不限' ? payload.loadLevel : '',
    ...cleanTags(payload.dietaryTags)
  ])
  const preferenceTags = cleanTags(payload.preferenceTags)
  const suitedFor = [...new Set([diningMode, ...mealPeriods, ...cleanTags(payload.suitedFor)].filter(Boolean))]

  return {
    id: idFromSubmission('r_sub', submission.id),
    name: title,
    canonical_name: title,
    aliases: [],
    campus_label: campus,
    campus_key: cleanText(payload.campusKey || payload.campus_key),
    campus_distance: distance,
    area: cleanText(payload.area, campus ? `${campus}待补充区域` : '待补充区域'),
    distance,
    walk_minutes: Math.max(1, Math.round(toNumber(payload.walkMinutes, distance * 12, 1, 240))),
    cuisine: cleanText(payload.cuisine, '学生推荐'),
    price: Math.round(toNumber(payload.price, 30, 1, 999)),
    rating: toNumber(payload.rating, 4.2, 0, 5),
    student_score: 0,
    checkins: 0,
    latitude: toNumber(payload.latitude, campusCoords.latitude, -90, 90),
    longitude: toNumber(payload.longitude, campusCoords.longitude, -180, 180),
    cover_icon: cleanText(payload.coverIcon, getCoverIcon(title)),
    cover_color: cleanText(payload.coverColor, '#f0aa38'),
    tags,
    suited_for: suitedFor,
    service_modes: serviceModes,
    meal_periods: mealPeriods,
    scenario_tags: scenarioTags,
    constraint_tags: constraintTags,
    preference_tags: preferenceTags,
    reason: cleanText(payload.content, '来自学生贡献，管理员已审核。'),
    source_refs: buildSourceRefs(submission, reviewerId),
    status: 'published',
    created_by: submission.submitter_id
  }
}

function buildDishRow(submission) {
  const payload = submission.payload || {}
  const restaurantId = cleanText(payload.restaurantId || payload.restaurant_id)
  if (!restaurantId) return null

  return {
    id: idFromSubmission('dish_sub', submission.id),
    restaurant_id: restaurantId,
    name: cleanText(payload.title, '学生推荐菜品'),
    price: Math.round(toNumber(payload.price, 20, 1, 999)),
    heat: Math.round(toNumber(payload.heat, 50, 0, 100)),
    tags: cleanTags(payload.tags),
    status: 'published'
  }
}

function buildReviewRow(submission) {
  const payload = submission.payload || {}
  const restaurantId = cleanText(payload.restaurantId || payload.restaurant_id)
  if (!restaurantId) return null
  const avatarSnapshot = payload.avatarSnapshot && typeof payload.avatarSnapshot === 'object'
    ? payload.avatarSnapshot
    : {
        type: 'preset',
        preset: 'rice',
        text: '饭',
        color: '#f0aa38'
      }

  return {
    id: idFromSubmission('rv_sub', submission.id),
    restaurant_id: restaurantId,
    user_id: submission.submitter_id,
    display_name_snapshot: cleanText(payload.displayName, 'ZJU student'),
    avatar_snapshot: avatarSnapshot,
    rating: Math.round(toNumber(payload.rating, 4, 1, 5)),
    text: cleanText(payload.content, cleanText(payload.title, '学生贡献评价')).slice(0, 500),
    tags: cleanTags(payload.tags),
    status: 'approved'
  }
}

async function upsertRow(client, table, row) {
  const { data, error } = await client
    .from(table)
    .upsert(row, { onConflict: 'id' })
    .select('*')
    .single()

  if (error) throw error
  return data
}

async function getRestaurantRow(client, id) {
  const restaurantId = cleanText(id)
  if (!restaurantId) return null
  const { data, error } = await client
    .from('restaurants')
    .select('*')
    .eq('id', restaurantId)
    .maybeSingle()

  if (error) throw error
  return data || null
}

function appendUniqueTags(existing, tags) {
  return cleanTags([...cleanTags(tags), ...cleanTags(existing)])
}

function buildOpsSourceRef(submission, reviewerId, action) {
  return {
    type: 'admin_ops',
    action,
    submission_id: submission.id,
    submitter_id: submission.submitter_id,
    reviewer_id: reviewerId,
    reviewed_at: new Date().toISOString()
  }
}

function appendSourceRef(existing, sourceRef) {
  const refs = Array.isArray(existing) ? existing : []
  return [...refs, sourceRef].slice(-20)
}

function normalizeRestaurantPatch(before, payload, reviewerId, submission) {
  const action = cleanText(payload.opsAction)
  const rawPatch = isPlainObject(payload.patch) ? payload.patch : {}
  const sourceRefs = appendSourceRef(before.source_refs, buildOpsSourceRef(submission, reviewerId, action || 'correction'))

  if (action === 'demote') {
    return {
      constraint_tags: appendUniqueTags(before.constraint_tags, ['不主推']),
      preference_tags: appendUniqueTags(before.preference_tags, ['不主推']),
      source_refs: sourceRefs
    }
  }

  if (action === 'archive') {
    return {
      status: 'archived',
      source_refs: sourceRefs
    }
  }

  if (action !== 'edit') return null

  const patch = { source_refs: sourceRefs }
  const nextName = cleanText(rawPatch.name)
  const nextArea = cleanText(rawPatch.area)
  const nextCuisine = cleanText(rawPatch.cuisine)
  const nextReason = cleanText(rawPatch.reason)
  const nextTags = cleanTags(rawPatch.tags)
  const nextPrice = rawPatch.price === undefined ? undefined : Math.round(toNumber(rawPatch.price, before.price, 1, 999))

  if (nextName) {
    patch.name = nextName
    patch.canonical_name = nextName
  }
  if (nextArea) patch.area = nextArea
  if (nextCuisine) patch.cuisine = nextCuisine
  if (nextReason) patch.reason = nextReason
  if (nextTags.length) patch.tags = nextTags
  if (nextPrice !== undefined) patch.price = nextPrice

  return patch
}

async function updateRestaurantRow(client, restaurantId, patch) {
  const { data, error } = await client
    .from('restaurants')
    .update(patch)
    .eq('id', restaurantId)
    .select('*')
    .single()

  if (error) throw error
  return data
}

async function materializeCorrectionSubmission(client, submission, reviewerId) {
  const payload = submission.payload || {}
  const action = cleanText(payload.opsAction)
  if (!['demote', 'archive', 'edit'].includes(action)) return { skipped: true, reason: 'manual_correction_only' }

  const target = isPlainObject(payload.opsTarget) ? payload.opsTarget : {}
  const restaurantId = cleanText(payload.restaurantId || payload.restaurant_id || target.targetId)
  if (!restaurantId) return { skipped: true, reason: 'missing_restaurant_id' }

  const before = await getRestaurantRow(client, restaurantId)
  if (!before) return { skipped: true, reason: 'restaurant_not_found' }

  const patch = normalizeRestaurantPatch(before, payload, reviewerId, submission)
  if (!patch || Object.keys(patch).length === 0) return { skipped: true, reason: 'empty_correction_patch' }

  const data = await updateRestaurantRow(client, restaurantId, patch)
  return {
    skipped: false,
    operation: 'update',
    targetTable: 'restaurants',
    targetId: data.id,
    beforeData: before,
    data
  }
}

async function materializeSubmission(client, submission, reviewerId) {
  if (submission.type === 'restaurant') {
    const row = buildRestaurantRow(submission, reviewerId)
    const data = await upsertRow(client, 'restaurants', row)
    return { skipped: false, operation: 'insert', targetTable: 'restaurants', targetId: data.id, beforeData: null, data }
  }

  if (submission.type === 'dish') {
    const row = buildDishRow(submission)
    if (!row) return { skipped: true, reason: 'missing_restaurant_id' }
    const data = await upsertRow(client, 'dishes', row)
    return { skipped: false, operation: 'insert', targetTable: 'dishes', targetId: data.id, beforeData: null, data }
  }

  if (submission.type === 'review' || submission.type === 'checkin') {
    const row = buildReviewRow(submission)
    if (!row) return { skipped: true, reason: 'missing_restaurant_id' }
    const data = await upsertRow(client, 'reviews', row)
    return { skipped: false, operation: 'insert', targetTable: 'reviews', targetId: data.id, beforeData: null, data }
  }

  if (submission.type === 'correction') return materializeCorrectionSubmission(client, submission, reviewerId)

  return { skipped: true, reason: 'manual_correction_only' }
}

module.exports = {
  buildDishRow,
  buildRestaurantRow,
  buildReviewRow,
  cleanTags,
  idFromSubmission,
  materializeCorrectionSubmission,
  materializeSubmission
}
