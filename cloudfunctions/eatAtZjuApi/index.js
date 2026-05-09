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

const DEFAULT_AVATAR = {
  type: 'preset',
  preset: 'rice',
  text: '饭',
  color: '#f0aa38'
}

const DEFAULT_CAMPUS_EMAIL_DOMAINS = ['zju.edu.cn', 'st.zju.edu.cn', 'intl.zju.edu.cn']
const AVATAR_BUCKET = 'app-avatars'
const MAX_AVATAR_BYTES = 1024 * 1024
const ALLOWED_AVATAR_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp', 'image/gif'])
const LINK_CODE_TTL_MINUTES = 15

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

function matchesTags(restaurant, tags = []) {
  if (!tags.length) return true
  return tags.every((tag) => matchesTag(restaurant, tag))
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
  const selectedTags = parseList(query.tags)
  const priceRange = findPriceRange(query.priceLabel || query.price)
  const filtered = restaurants.filter((restaurant) => {
    return (
      restaurant.status === 'published' &&
      matchesKeyword(restaurant, query.keyword) &&
      matchesTag(restaurant, selectedTags.length ? '全部' : (query.tag || '全部')) &&
      matchesTags(restaurant, selectedTags) &&
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
  return requestRest(pathname, { query })
}

function requestRest(pathname, options = {}) {
  const { key, url } = getSupabaseConfig()
  if (!url || !key) {
    const error = new Error('Supabase is not configured')
    error.code = 'supabase_not_configured'
    throw error
  }

  const target = new URL(`${url}/rest/v1/${pathname}`)
  const query = options.query || {}
  for (const [name, value] of Object.entries(query)) {
    if (value !== undefined && value !== null && value !== '') target.searchParams.set(name, value)
  }
  const body = options.body === undefined ? undefined : JSON.stringify(options.body)

  return new Promise((resolve, reject) => {
    const req = https.request(
      target,
      {
        method: options.method || 'GET',
        headers: {
          apikey: key,
          Authorization: `Bearer ${key}`,
          Accept: 'application/json',
          ...(body ? { 'Content-Type': 'application/json', 'Content-Length': Buffer.byteLength(body) } : {}),
          ...(options.prefer ? { Prefer: options.prefer } : {})
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
    if (body) req.write(body)
    req.end()
  })
}

function requestStorageObject(bucket, objectPath, options = {}) {
  const { key, url } = getSupabaseConfig()
  if (!url || !key) {
    const error = new Error('Supabase is not configured')
    error.code = 'supabase_not_configured'
    throw error
  }

  const target = new URL(`${url}/storage/v1/object/${bucket}/${objectPath}`)
  const body = options.body

  return new Promise((resolve, reject) => {
    const req = https.request(
      target,
      {
        method: options.method || 'POST',
        headers: {
          apikey: key,
          Authorization: `Bearer ${key}`,
          'Content-Type': options.contentType || 'application/octet-stream',
          'Content-Length': body ? body.length : 0,
          'x-upsert': options.upsert ? 'true' : 'false'
        },
        timeout: 15000
      },
      (res) => {
        let responseBody = ''
        res.setEncoding('utf8')
        res.on('data', (chunk) => {
          responseBody += chunk
        })
        res.on('end', () => {
          if (res.statusCode < 200 || res.statusCode >= 300) {
            const error = new Error(`Supabase Storage ${res.statusCode}: ${responseBody.slice(0, 300)}`)
            error.statusCode = res.statusCode
            reject(error)
            return
          }
          resolve(responseBody)
        })
      }
    )
    req.on('timeout', () => req.destroy(new Error('Supabase Storage request timeout')))
    req.on('error', reject)
    if (body) req.write(body)
    req.end()
  })
}

function requestAuth(pathname, options = {}) {
  const { url, key } = getSupabaseConfig()
  if (!url || !key) {
    const error = new Error('Supabase is not configured')
    error.code = 'supabase_not_configured'
    throw error
  }

  const target = new URL(`${url}/auth/v1/${pathname}`)
  const body = options.body === undefined ? undefined : JSON.stringify(options.body)

  return new Promise((resolve, reject) => {
    const req = https.request(
      target,
      {
        method: options.method || 'POST',
        headers: {
          apikey: key,
          Authorization: `Bearer ${key}`,
          Accept: 'application/json',
          ...(body ? { 'Content-Type': 'application/json', 'Content-Length': Buffer.byteLength(body) } : {})
        },
        timeout: 15000
      },
      (res) => {
        let responseBody = ''
        res.setEncoding('utf8')
        res.on('data', (chunk) => {
          responseBody += chunk
        })
        res.on('end', () => {
          if (res.statusCode < 200 || res.statusCode >= 300) {
            const error = new Error(`Supabase Auth ${res.statusCode}: ${responseBody.slice(0, 300)}`)
            error.statusCode = res.statusCode
            reject(error)
            return
          }

          try {
            resolve(responseBody ? JSON.parse(responseBody) : null)
          } catch (error) {
            reject(error)
          }
        })
      }
    )
    req.on('timeout', () => req.destroy(new Error('Supabase Auth request timeout')))
    req.on('error', reject)
    if (body) req.write(body)
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
  const avatar = row.avatar_snapshot || DEFAULT_AVATAR
  return {
    id: row.id,
    restaurantId: row.restaurant_id,
    userName: row.display_name_snapshot,
    avatar,
    text: row.text,
    rating: row.rating,
    status: row.status
  }
}

function normalizeDisplayName(value) {
  const name = String(value || 'ZJU Student').trim().slice(0, 40)
  return name || 'ZJU Student'
}

function getAllowedCampusEmailDomains() {
  const raw = process.env.CAMPUS_EMAIL_DOMAINS
  if (!raw) return DEFAULT_CAMPUS_EMAIL_DOMAINS
  return raw
    .split(',')
    .map((domain) => domain.trim().toLowerCase())
    .filter(Boolean)
}

function isAllowedCampusEmail(email) {
  const domain = String(email || '').toLowerCase().split('@').pop()
  return Boolean(domain && getAllowedCampusEmailDomains().some((allowedDomain) => {
    if (allowedDomain.startsWith('*.')) return domain.endsWith(`.${allowedDomain.slice(2)}`)
    return domain === allowedDomain
  }))
}

function normalizeEmail(email) {
  return String(email || '').trim().toLowerCase()
}

function generateLinkCode() {
  return Math.random().toString(36).slice(2, 6).toUpperCase() + Math.random().toString(36).slice(2, 6).toUpperCase()
}

function summarizeProfile(row) {
  const mapped = mapAppUser(row)
  return {
    id: mapped.id,
    displayName: mapped.displayName,
    avatarType: mapped.avatarType,
    avatarPreset: mapped.avatarPreset,
    avatarUrl: mapped.avatarUrl,
    preferences: mapped.preferences
  }
}

function hasUsefulDisplayName(profile) {
  const value = normalizeDisplayName(profile && profile.display_name)
  return !['ZJU Student', 'ZJU student'].includes(value)
}

function hasUsefulAvatar(profile) {
  return Boolean(profile && (profile.avatar_type === 'custom' || (profile.avatar_preset && profile.avatar_preset !== 'rice')))
}

function buildMergePreview(source, target) {
  const sourcePrefs = Array.isArray(source.preferences) ? source.preferences : []
  const targetPrefs = Array.isArray(target.preferences) ? target.preferences : []
  const unionPrefs = [...new Set([...targetPrefs, ...sourcePrefs])].slice(0, 20)
  return {
    source: summarizeProfile(source),
    target: summarizeProfile(target),
    recommended: {
      displayName: hasUsefulDisplayName(source) && !hasUsefulDisplayName(target) ? 'source' : 'target',
      avatar: hasUsefulAvatar(source) && !hasUsefulAvatar(target) ? 'source' : 'target',
      preferences: 'union'
    },
    unionPreferences: unionPrefs,
    expiresInMinutes: LINK_CODE_TTL_MINUTES
  }
}

function normalizeAvatar(profile = {}) {
  const avatarType = profile.avatarType === 'custom' ? 'custom' : 'preset'
  const avatarPreset = String(profile.avatarPreset || 'rice').slice(0, 40)
  const avatarUrl = String(profile.avatarUrl || '').slice(0, 500)
  return {
    avatarType,
    avatarPreset,
    avatarUrl
  }
}

function mapAppUser(row) {
  return {
    id: row.id,
    displayName: row.display_name,
    username: row.display_name,
    avatarType: row.avatar_type || 'preset',
    avatarPreset: row.avatar_preset || 'rice',
    avatarUrl: row.avatar_url || '',
    avatarTempPath: row.avatar_url || '',
    preferences: row.preferences || []
  }
}

function getOpenId(event = {}) {
  return event.openId || event.openid || (event.userInfo && (event.userInfo.openId || event.userInfo.openid))
}

function sanitizePathSegment(value, fallback = 'avatar') {
  return String(value || fallback)
    .toLowerCase()
    .replace(/[^a-z0-9._-]/g, '-')
    .replace(/-+/g, '-')
    .slice(0, 80) || fallback
}

async function fetchAppUserById(appUserId) {
  const rows = await requestJson('app_users', {
    select: 'id,display_name,avatar_url,avatar_type,avatar_preset,preferences,primary_channel',
    id: `eq.${appUserId}`,
    limit: 1
  })
  return rows && rows[0] ? rows[0] : null
}

async function fetchIdentityLink(provider, providerUserId) {
  const rows = await requestJson('identity_links', {
    select: 'app_user_id,auth_user_id,provider,provider_user_id',
    provider: `eq.${provider}`,
    provider_user_id: `eq.${providerUserId}`,
    limit: 1
  })
  return rows && rows[0] ? rows[0] : null
}

async function ensureSupabaseAuthAppUser(authUser, email) {
  if (!authUser || !authUser.id) throw new Error('missing_supabase_auth_user')
  const existingLink = await fetchIdentityLink('supabase_auth', authUser.id)
  if (existingLink && existingLink.app_user_id) {
    const existing = await fetchAppUserById(existingLink.app_user_id)
    if (existing) return existing
  }

  let appUser = await fetchAppUserById(authUser.id)
  if (!appUser) {
    const users = await requestRest('app_users', {
      method: 'POST',
      prefer: 'return=representation',
      body: {
        id: authUser.id,
        display_name: normalizeDisplayName((email || authUser.email || '').split('@')[0] || 'ZJU Student'),
        avatar_type: 'preset',
        avatar_preset: 'rice',
        preferences: [],
        primary_channel: 'supabase_auth'
      }
    })
    appUser = users && users[0]
    if (!appUser) throw new Error('failed_to_create_email_app_user')
  }

  await requestRest('identity_links', {
    method: 'POST',
    prefer: 'return=minimal',
    body: {
      app_user_id: appUser.id,
      provider: 'supabase_auth',
      provider_user_id: authUser.id,
      auth_user_id: authUser.id,
      metadata: { source: 'mini_program_email_bind' },
      last_seen_at: new Date().toISOString()
    }
  })

  return appUser
}

async function ensureWechatAppUser(openId) {
  if (!openId) {
    const error = new Error('WeChat openId is required')
    error.code = 'cloud_identity_required'
    throw error
  }

  const links = await requestJson('identity_links', {
    select: 'app_user_id',
    provider: 'eq.wechat_miniapp',
    provider_user_id: `eq.${openId}`,
    limit: 1
  })
  if (links && links[0]) {
    await requestRest('identity_links', {
      method: 'PATCH',
      query: {
        provider: 'eq.wechat_miniapp',
        provider_user_id: `eq.${openId}`
      },
      body: { last_seen_at: new Date().toISOString() }
    })
    const existing = await fetchAppUserById(links[0].app_user_id)
    if (existing) return existing
  }

  const users = await requestRest('app_users', {
    method: 'POST',
    prefer: 'return=representation',
    body: {
      display_name: 'ZJU Student',
      avatar_type: 'preset',
      avatar_preset: 'rice',
      preferences: [],
      primary_channel: 'wechat_miniapp'
    }
  })
  const appUser = users && users[0]
  if (!appUser) throw new Error('failed_to_create_app_user')

  await requestRest('identity_links', {
    method: 'POST',
    prefer: 'return=minimal',
    body: {
      app_user_id: appUser.id,
      provider: 'wechat_miniapp',
      provider_user_id: openId,
      metadata: { source: 'mini_program' },
      last_seen_at: new Date().toISOString()
    }
  })

  return appUser
}

async function getUserProfile(event = {}) {
  const appUser = await ensureWechatAppUser(getOpenId(event))
  return {
    ok: true,
    profile: mapAppUser(appUser),
    source: 'supabase'
  }
}

async function updateUserProfile(event = {}) {
  const openId = getOpenId(event)
  const current = await ensureWechatAppUser(openId)
  const profile = event.profile || {}
  const avatar = normalizeAvatar(profile)
  const body = {
    display_name: normalizeDisplayName(profile.displayName || profile.username),
    avatar_type: avatar.avatarType,
    avatar_preset: avatar.avatarPreset,
    avatar_url: avatar.avatarUrl,
    preferences: Array.isArray(profile.preferences) ? profile.preferences.slice(0, 20) : current.preferences
  }

  const rows = await requestRest('app_users', {
    method: 'PATCH',
    query: { id: `eq.${current.id}` },
    prefer: 'return=representation',
    body
  })

  return {
    ok: true,
    profile: mapAppUser(rows && rows[0] ? rows[0] : { ...current, ...body }),
    source: 'supabase'
  }
}

async function uploadAvatar(event = {}) {
  const openId = getOpenId(event)
  const appUser = await ensureWechatAppUser(openId)
  const contentType = String(event.contentType || 'image/jpeg').toLowerCase()
  if (!ALLOWED_AVATAR_TYPES.has(contentType)) return { ok: false, error: 'unsupported_avatar_type' }

  const buffer = Buffer.from(String(event.base64Data || ''), 'base64')
  if (!buffer.length) return { ok: false, error: 'empty_avatar_file' }
  if (buffer.length > MAX_AVATAR_BYTES) return { ok: false, error: 'avatar_too_large' }

  const fileName = sanitizePathSegment(event.fileName || `avatar.${contentType.split('/')[1] || 'jpg'}`)
  const ext = sanitizePathSegment(fileName.split('.').pop() || 'jpg', 'jpg')
  const objectPath = `${appUser.id}/${Date.now()}-${Math.random().toString(36).slice(2)}.${ext}`
  await requestStorageObject(AVATAR_BUCKET, objectPath, {
    method: 'POST',
    contentType,
    body: buffer,
    upsert: false
  })

  const { url } = getSupabaseConfig()
  const publicUrl = `${url}/storage/v1/object/public/${AVATAR_BUCKET}/${objectPath}`
  return {
    ok: true,
    avatarUrl: publicUrl,
    objectPath,
    source: 'supabase'
  }
}

async function sendCampusEmailOtp(event = {}) {
  const email = normalizeEmail(event.email)
  if (!email || !email.includes('@')) return { ok: false, error: 'invalid_email' }
  if (!isAllowedCampusEmail(email)) {
    return {
      ok: false,
      error: 'unsupported_campus_email',
      allowedDomains: getAllowedCampusEmailDomains()
    }
  }

  await requestAuth('otp', {
    body: {
      email,
      create_user: true,
      data: { source: 'eatAtZJU_mini_program' }
    }
  })

  return {
    ok: true,
    email,
    allowedDomains: getAllowedCampusEmailDomains()
  }
}

async function verifyCampusEmailOtp(event = {}) {
  const openId = getOpenId(event)
  const source = await ensureWechatAppUser(openId)
  const email = normalizeEmail(event.email)
  const token = String(event.token || event.otp || '').replace(/\D/g, '').slice(0, 8)
  if (!email || !token) return { ok: false, error: 'missing_email_or_token' }
  if (!isAllowedCampusEmail(email)) return { ok: false, error: 'unsupported_campus_email', allowedDomains: getAllowedCampusEmailDomains() }

  const verified = await requestAuth('verify', {
    body: {
      email,
      token,
      type: 'email'
    }
  })
  const authUser = verified && verified.user
  if (!authUser || !authUser.id) return { ok: false, error: 'email_otp_verify_failed' }

  const target = await ensureSupabaseAuthAppUser(authUser, email)
  const trustRows = await requestJson('user_trust', {
    select: 'credit_score,contribution_count',
    user_id: `eq.${authUser.id}`,
    limit: 1
  })
  const existingTrust = trustRows && trustRows[0] ? trustRows[0] : {}
  await requestRest('user_trust', {
    method: 'POST',
    query: { on_conflict: 'user_id' },
    prefer: 'resolution=merge-duplicates,return=minimal',
    body: {
      user_id: authUser.id,
      campus_email: email,
      campus_email_verified: true,
      credit_score: Math.max(Number(existingTrust.credit_score || 50), 60),
      contribution_count: Number(existingTrust.contribution_count || 0)
    }
  })

  const code = generateLinkCode()
  const expiresAt = new Date(Date.now() + LINK_CODE_TTL_MINUTES * 60 * 1000).toISOString()
  await requestRest('account_link_codes', {
    method: 'POST',
    prefer: 'return=minimal',
    body: {
      code,
      app_user_id: target.id,
      created_by_provider: 'supabase_auth',
      created_by_identity: authUser.id,
      expires_at: expiresAt,
      metadata: {
        purpose: 'mini_campus_email_bind',
        email,
        auth_user_id: authUser.id,
        source_app_user_id: source.id,
        source_provider: 'wechat_miniapp'
      }
    }
  })

  return {
    ok: true,
    mergeToken: code,
    email,
    campusEmailVerified: true,
    preview: buildMergePreview(source, target)
  }
}

async function confirmCampusEmailBind(event = {}) {
  const openId = getOpenId(event)
  const source = await ensureWechatAppUser(openId)
  const mergeToken = String(event.mergeToken || event.code || '').trim().toUpperCase()
  const choices = event.choices || {}
  if (!mergeToken) return { ok: false, error: 'missing_merge_token' }

  const codes = await requestJson('account_link_codes', {
    select: 'id,code,app_user_id,metadata,expires_at,consumed_at',
    code: `eq.${mergeToken}`,
    consumed_at: 'is.null',
    limit: 1
  })
  const linkCode = codes && codes[0]
  if (!linkCode) return { ok: false, error: 'invalid_or_consumed_merge_token' }
  if (new Date(linkCode.expires_at).getTime() < Date.now()) return { ok: false, error: 'expired_merge_token' }
  if (linkCode.metadata && linkCode.metadata.source_app_user_id && linkCode.metadata.source_app_user_id !== source.id) {
    return { ok: false, error: 'merge_token_belongs_to_another_wechat_account' }
  }

  const target = await fetchAppUserById(linkCode.app_user_id)
  if (!target) return { ok: false, error: 'target_account_not_found' }
  const preview = buildMergePreview(source, target)
  const displayNameChoice = choices.displayName === 'source' ? 'source' : 'target'
  const avatarChoice = choices.avatar === 'source' ? 'source' : 'target'
  const preferenceChoice = ['source', 'target', 'union'].includes(choices.preferences) ? choices.preferences : 'union'

  const mergedPreferences = preferenceChoice === 'source'
    ? (source.preferences || [])
    : preferenceChoice === 'target'
      ? (target.preferences || [])
      : preview.unionPreferences
  const avatarSource = avatarChoice === 'source' ? source : target

  const rows = await requestRest('app_users', {
    method: 'PATCH',
    query: { id: `eq.${target.id}` },
    prefer: 'return=representation',
    body: {
      display_name: displayNameChoice === 'source' ? source.display_name : target.display_name,
      avatar_type: avatarSource.avatar_type || 'preset',
      avatar_preset: avatarSource.avatar_preset || 'rice',
      avatar_url: avatarSource.avatar_url || '',
      preferences: mergedPreferences.slice(0, 20),
      primary_channel: target.primary_channel === 'supabase_auth' ? 'supabase_auth' : 'wechat_miniapp'
    }
  })
  const merged = rows && rows[0] ? rows[0] : target

  await requestRest('identity_links', {
    method: 'PATCH',
    query: {
      provider: 'eq.wechat_miniapp',
      provider_user_id: `eq.${openId}`
    },
    body: {
      app_user_id: target.id,
      metadata: {
        source: 'mini_program_campus_email_bind',
        merged_from_app_user_id: source.id
      },
      last_seen_at: new Date().toISOString()
    }
  })

  await requestRest('account_link_codes', {
    method: 'PATCH',
    query: { code: `eq.${mergeToken}` },
    body: {
      consumed_at: new Date().toISOString(),
      consumed_by_provider: 'wechat_miniapp',
      consumed_by_identity: openId
    }
  })

  if (source.id !== target.id) {
    const remainingLinks = await requestJson('identity_links', {
      select: 'id',
      app_user_id: `eq.${source.id}`,
      limit: 1
    })
    if (!remainingLinks || !remainingLinks.length) {
      await requestRest('app_users', {
        method: 'DELETE',
        query: { id: `eq.${source.id}` }
      })
    }
  }

  return {
    ok: true,
    profile: mapAppUser(merged),
    campusEmailVerified: true,
    source: 'supabase'
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
      select: 'id,restaurant_id,display_name_snapshot,avatar_snapshot,rating,text,status',
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
    if (action === 'getUserProfile') return getUserProfile(event)
    if (action === 'updateUserProfile') return updateUserProfile(event)
    if (action === 'uploadAvatar') return uploadAvatar(event)
    if (action === 'sendCampusEmailOtp') return sendCampusEmailOtp(event)
    if (action === 'verifyCampusEmailOtp') return verifyCampusEmailOtp(event)
    if (action === 'confirmCampusEmailBind') return confirmCampusEmailBind(event)
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
