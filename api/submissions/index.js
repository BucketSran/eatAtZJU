const { requireAuthenticatedUser } = require('../_shared/auth.cjs')
const { ensureAppUserForAuth, getAvatarSnapshot } = require('../_shared/appProfile.cjs')
const { readJsonBody } = require('../_shared/requestBody.cjs')

const ALLOWED_TYPES = new Set(['restaurant', 'dish', 'review', 'checkin', 'correction'])
const TAG_REQUIRED_TYPES = new Set(ALLOWED_TYPES)
const ALLOWED_DINING_MODES = new Set(['堂食', '外卖'])
const ALLOWED_MEAL_PERIODS = new Set(['早餐', '中餐', '下午茶', '晚餐', '夜宵'])
const MAX_PAYLOAD_BYTES = 20_000
const MAX_TAGS = 12
const MAX_TAG_LENGTH = 24

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function getStringArray(value) {
  if (!Array.isArray(value)) return []
  return value.filter((item) => typeof item === 'string').map((item) => item.trim()).filter(Boolean)
}

function validatePayload(type, payload) {
  const title = typeof payload.title === 'string' ? payload.title.trim() : ''
  const content = typeof payload.content === 'string' ? payload.content.trim() : ''
  const tags = getStringArray(payload.tags)
  const price = payload.price === undefined ? undefined : Number(payload.price)
  const rating = payload.rating === undefined ? undefined : Number(payload.rating)

  if (!title || title.length > 80) return 'Title is required and must be 80 characters or less'
  if (!content || content.length > 1000) return 'Content is required and must be 1000 characters or less'
  if (payload.serviceMode && payload.serviceMode !== '都可以' && !ALLOWED_DINING_MODES.has(payload.serviceMode)) return 'Invalid service mode'
  if (payload.diningMode && !ALLOWED_DINING_MODES.has(payload.diningMode)) return 'Invalid dining mode'
  if (payload.mealPeriod && !ALLOWED_MEAL_PERIODS.has(payload.mealPeriod)) return 'Invalid meal period'
  if (TAG_REQUIRED_TYPES.has(type) && !tags.length) return 'At least one tag is required'
  if (tags.length > MAX_TAGS) return 'Too many tags'
  if (tags.some((tag) => tag.length > MAX_TAG_LENGTH)) return 'Tag is too long'
  if (price !== undefined && (!Number.isFinite(price) || price < 1 || price > 999)) return 'Invalid price'
  if (rating !== undefined && (!Number.isFinite(rating) || rating < 1 || rating > 5)) return 'Invalid rating'
  return ''
}

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const auth = await requireAuthenticatedUser(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  try {
    const body = await readJsonBody(req)
    const type = typeof body.type === 'string' ? body.type : ''
    const payload = body.payload

    if (!ALLOWED_TYPES.has(type)) return res.status(400).json({ error: 'Invalid submission type' })
    if (!isPlainObject(payload)) return res.status(400).json({ error: 'Payload must be an object' })
    const validationError = validatePayload(type, payload)
    if (validationError) return res.status(400).json({ error: validationError })
    if (Buffer.byteLength(JSON.stringify(payload), 'utf8') > MAX_PAYLOAD_BYTES) return res.status(413).json({ error: 'Payload too large' })

    const appUser = await ensureAppUserForAuth(auth.client, auth.user)
    const payloadWithSnapshot = {
      ...payload,
      displayName: appUser.display_name || 'ZJU student',
      avatarSnapshot: getAvatarSnapshot(appUser)
    }

    const { data, error } = await auth.client
      .from('submissions')
      .insert({ type, payload: payloadWithSnapshot, submitter_id: auth.user.id, status: 'pending' })
      .select('id,status')
      .single()

    if (error) throw error
    return res.status(201).json(data)
  } catch (error) {
    if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
    return res.status(500).json({ error: 'Failed to create submission' })
  }
}
