const crypto = require('crypto')
const { ensureAppUserForAuth } = require('../_shared/appProfile.cjs')
const { requireAuthenticatedUser } = require('../_shared/auth.cjs')

function createCode() {
  return crypto.randomBytes(5).toString('base64url').toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 8)
}

function sendError(res, error, fallback = 'Account link request failed') {
  const status = error.status || error.statusCode || 500
  return res.status(status).json({ error: error.message || fallback })
}

module.exports = async function handler(req, res) {
  const auth = await requireAuthenticatedUser(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  try {
    const appUser = await ensureAppUserForAuth(auth.client, auth.user)

    if (req.method === 'GET') {
      const { data, error } = await auth.client
        .from('account_link_codes')
        .select('code,expires_at,consumed_at,created_at')
        .eq('app_user_id', appUser.id)
        .is('consumed_at', null)
        .gt('expires_at', new Date().toISOString())
        .order('created_at', { ascending: false })
        .limit(5)

      if (error) throw error
      return res.status(200).json({ codes: data || [] })
    }

    if (req.method === 'POST') {
      const expiresAt = new Date(Date.now() + 10 * 60 * 1000).toISOString()
      const row = {
        code: createCode(),
        app_user_id: appUser.id,
        created_by_provider: 'supabase_auth',
        created_by_identity: auth.user.id,
        metadata: { source: 'web_profile_api' },
        expires_at: expiresAt
      }
      const { data, error } = await auth.client
        .from('account_link_codes')
        .insert(row)
        .select('code,expires_at,created_at')
        .single()

      if (error) throw error
      return res.status(201).json({ code: data.code, expiresAt: data.expires_at, createdAt: data.created_at })
    }

    res.setHeader('Allow', 'GET, POST')
    return res.status(405).json({ error: 'Method not allowed' })
  } catch (error) {
    return sendError(res, error)
  }
}
