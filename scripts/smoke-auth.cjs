const { createClient } = require('@supabase/supabase-js')
const { execFile } = require('child_process')

const PLACEHOLDER_VALUES = new Set(['', 'server_only_do_not_expose', 'server_only_for_migrations_optional'])

function readEnv(name) {
  const value = process.env[name]
  if (!value || PLACEHOLDER_VALUES.has(value)) return undefined
  return value
}

function requireEnv(name) {
  const value = readEnv(name)
  if (!value) throw new Error(`${name} is required`)
  return value
}

function createPassword() {
  return `EatAtZJU-${Date.now()}-${Math.random().toString(36).slice(2)}!`
}

async function fetchJson(url, options = {}) {
  let lastError
  for (let attempt = 1; attempt <= 3; attempt += 1) {
    try {
      const response = await fetch(url, options)
      const body = await response.json().catch(() => ({}))
      if (!response.ok) {
        throw new Error(`${options.method || 'GET'} ${url} returned ${response.status}: ${body.error || 'unknown error'}`)
      }
      return body
    } catch (error) {
      lastError = error
      if (attempt < 3) await new Promise((resolve) => setTimeout(resolve, attempt * 1000))
    }
  }
  try {
    return await fetchJsonWithCurl(url, options)
  } catch (curlError) {
    throw lastError || curlError
  }
}

function fetchJsonWithCurl(url, options = {}) {
  return new Promise((resolve, reject) => {
    const args = ['-sS', '-L', '--retry', '3', '--retry-delay', '1', '--connect-timeout', '10', '--max-time', '30', '-w', '\n__HTTP_STATUS__:%{http_code}']
    if (options.method) args.push('-X', options.method)
    for (const [key, value] of Object.entries(options.headers || {})) {
      args.push('-H', `${key}: ${value}`)
    }
    if (options.body) args.push('--data-raw', options.body)
    args.push(url)

    execFile('curl', args, { maxBuffer: 5 * 1024 * 1024 }, (error, stdout, stderr) => {
      if (error) return reject(new Error(stderr || error.message))
      const marker = '\n__HTTP_STATUS__:'
      const markerIndex = stdout.lastIndexOf(marker)
      if (markerIndex === -1) return reject(new Error('curl smoke missing HTTP status'))
      const rawBody = stdout.slice(0, markerIndex)
      const status = Number(stdout.slice(markerIndex + marker.length).trim())
      const body = rawBody ? JSON.parse(rawBody) : {}
      if (status < 200 || status >= 300) {
        return reject(new Error(`${options.method || 'GET'} ${url} returned ${status}: ${body.error || 'unknown error'}`))
      }
      resolve(body)
    })
  })
}

async function main() {
  const supabaseUrl = requireEnv('SUPABASE_URL')
  const serviceRoleKey = requireEnv('SUPABASE_SERVICE_ROLE_KEY')
  const anonKey = readEnv('SUPABASE_ANON_KEY') || requireEnv('VITE_SUPABASE_ANON_KEY')
  const apiBaseUrl = (process.env.API_BASE_URL || 'https://eat-at-zju.vercel.app').replace(/\/$/, '')

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { autoRefreshToken: false, persistSession: false }
  })
  const authClient = createClient(supabaseUrl, anonKey, {
    auth: { autoRefreshToken: false, persistSession: false }
  })

  const suffix = `${Date.now()}${Math.random().toString(36).slice(2, 7)}`
  const email = `auth-smoke-${suffix}@example.com`
  const password = createPassword()
  let authUserId = ''
  let appUserId = ''

  try {
    const { data: created, error: createError } = await admin.auth.admin.createUser({
      email,
      password,
      email_confirm: true
    })
    if (createError) throw createError
    authUserId = created.user.id

    const { data: sessionData, error: signInError } = await authClient.auth.signInWithPassword({ email, password })
    if (signInError) throw signInError
    const token = sessionData.session?.access_token
    if (!token) throw new Error('Supabase did not return an access token')

    const headers = {
      accept: 'application/json',
      Authorization: `Bearer ${token}`
    }
    const jsonHeaders = {
      ...headers,
      'Content-Type': 'application/json'
    }

    const profile = await fetchJson(`${apiBaseUrl}/api/profile`, { headers })
    appUserId = profile.profile?.id || ''
    if (!appUserId) throw new Error('Profile API did not return app user id')

    const displayName = `烟测饭友${suffix.slice(-4)}`
    const updatedProfile = await fetchJson(`${apiBaseUrl}/api/profile`, {
      method: 'PATCH',
      headers: jsonHeaders,
      body: JSON.stringify({
        avatarPreset: 'duck',
        avatarType: 'preset',
        avatarUrl: '',
        defaultCampus: '玉泉',
        displayName,
        preferences: ['实惠', '近', '下饭']
      })
    })
    if (updatedProfile.profile?.displayName !== displayName || updatedProfile.profile?.avatarPreset !== 'duck' || updatedProfile.profile?.defaultCampus !== '玉泉') {
      throw new Error('Profile PATCH did not persist display name/avatar preset/default campus')
    }

    const favoriteSet = await fetchJson(`${apiBaseUrl}/api/favorites`, {
      method: 'POST',
      headers: jsonHeaders,
      body: JSON.stringify({ restaurantId: 'r001', favorite: true })
    })
    if (!favoriteSet.restaurantIds?.includes('r001')) throw new Error('Favorite POST did not include r001')

    const favoriteMerge = await fetchJson(`${apiBaseUrl}/api/favorites`, {
      method: 'PUT',
      headers: jsonHeaders,
      body: JSON.stringify({ restaurantIds: ['r001', 'r002'] })
    })
    if (!favoriteMerge.restaurantIds?.includes('r001') || !favoriteMerge.restaurantIds?.includes('r002')) {
      throw new Error('Favorite PUT did not merge expected ids')
    }

    const linkCode = await fetchJson(`${apiBaseUrl}/api/account/link-code`, {
      method: 'POST',
      headers
    })
    if (!linkCode.code || String(linkCode.code).length < 6) throw new Error('Account link code was not generated')

    console.log(JSON.stringify({
      ok: true,
      apiBaseUrl,
      authUserCreated: true,
      profile: {
        id: appUserId,
        displayName: updatedProfile.profile.displayName,
        avatarPreset: updatedProfile.profile.avatarPreset,
        defaultCampus: updatedProfile.profile.defaultCampus,
        preferences: updatedProfile.profile.preferences
      },
      favorites: favoriteMerge.restaurantIds,
      linkCodeGenerated: true
    }, null, 2))
  } finally {
    if (appUserId) {
      await admin.from('account_link_codes').delete().eq('app_user_id', appUserId)
      await admin.from('app_favorites').delete().eq('app_user_id', appUserId)
      await admin.from('identity_links').delete().eq('app_user_id', appUserId)
      await admin.from('app_users').delete().eq('id', appUserId)
    }
    if (authUserId) {
      await admin.from('favorites').delete().eq('user_id', authUserId)
      await admin.from('profiles').delete().eq('id', authUserId)
      await admin.from('user_trust').delete().eq('user_id', authUserId)
      await admin.auth.admin.deleteUser(authUserId)
    }
  }
}

main().catch((error) => {
  console.error(error.message)
  process.exit(1)
})
