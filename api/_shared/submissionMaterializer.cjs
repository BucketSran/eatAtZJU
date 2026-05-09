const DEFAULT_COORDS = {
  latitude: 30.3088,
  longitude: 120.0865
}

function cleanText(value, fallback = '') {
  return typeof value === 'string' && value.trim() ? value.trim() : fallback
}

function cleanTags(value) {
  if (!Array.isArray(value)) return []
  return [...new Set(value.filter((tag) => typeof tag === 'string').map((tag) => tag.trim()).filter(Boolean))].slice(0, 12)
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
  const distance = toNumber(payload.distance, 1, 0, 20)
  const tags = cleanTags(payload.tags)
  const diningMode = cleanText(payload.serviceMode === '都可以' ? '' : payload.serviceMode, cleanText(payload.diningMode))
  const mealPeriod = cleanText(payload.mealPeriod)
  const serviceModes = cleanTags(payload.serviceModes || (diningMode ? [diningMode] : []))
  const mealPeriods = cleanTags(payload.mealPeriods || (mealPeriod ? [mealPeriod] : []))
  const scenarioTags = cleanTags(payload.scenarioTags)
  const constraintTags = cleanTags(payload.constraintTags || [
    payload.spiceLevel && payload.spiceLevel !== '不限' ? payload.spiceLevel : '',
    payload.loadLevel && payload.loadLevel !== '不限' ? payload.loadLevel : '',
    ...cleanTags(payload.dietaryTags)
  ])
  const preferenceTags = cleanTags(payload.preferenceTags)
  const suitedFor = [...new Set([diningMode, mealPeriod, ...cleanTags(payload.suitedFor)].filter(Boolean))]

  return {
    id: idFromSubmission('r_sub', submission.id),
    name: title,
    canonical_name: title,
    aliases: [],
    area: cleanText(payload.area, '待补充区域'),
    distance,
    walk_minutes: Math.max(1, Math.round(toNumber(payload.walkMinutes, distance * 12, 1, 240))),
    cuisine: cleanText(payload.cuisine, '学生推荐'),
    price: Math.round(toNumber(payload.price, 30, 1, 999)),
    rating: toNumber(payload.rating, 4.2, 0, 5),
    student_score: Math.round(toNumber(payload.studentScore, 80, 0, 100)),
    checkins: Math.round(toNumber(payload.checkins, 1, 0, 999999)),
    latitude: toNumber(payload.latitude, DEFAULT_COORDS.latitude, -90, 90),
    longitude: toNumber(payload.longitude, DEFAULT_COORDS.longitude, -180, 180),
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

  return {
    id: idFromSubmission('rv_sub', submission.id),
    restaurant_id: restaurantId,
    user_id: submission.submitter_id,
    display_name_snapshot: cleanText(payload.displayName, 'ZJU student'),
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

async function materializeSubmission(client, submission, reviewerId) {
  if (submission.type === 'restaurant') {
    const row = buildRestaurantRow(submission, reviewerId)
    const data = await upsertRow(client, 'restaurants', row)
    return { skipped: false, targetTable: 'restaurants', targetId: data.id, data }
  }

  if (submission.type === 'dish') {
    const row = buildDishRow(submission)
    if (!row) return { skipped: true, reason: 'missing_restaurant_id' }
    const data = await upsertRow(client, 'dishes', row)
    return { skipped: false, targetTable: 'dishes', targetId: data.id, data }
  }

  if (submission.type === 'review' || submission.type === 'checkin') {
    const row = buildReviewRow(submission)
    if (!row) return { skipped: true, reason: 'missing_restaurant_id' }
    const data = await upsertRow(client, 'reviews', row)
    return { skipped: false, targetTable: 'reviews', targetId: data.id, data }
  }

  return { skipped: true, reason: 'manual_correction_only' }
}

module.exports = {
  buildDishRow,
  buildRestaurantRow,
  buildReviewRow,
  cleanTags,
  idFromSubmission,
  materializeSubmission
}
