const { ensureAppUserForAuth, mapAppUser, updateAppUser } = require('../_shared/appProfile.cjs')
const { requireAuthenticatedUser } = require('../_shared/auth.cjs')
const { readJsonBody } = require('../_shared/requestBody.cjs')

const PROFILE_PATCH_KEYS = new Set(['avatarPreset', 'avatarType', 'avatarUrl', 'displayName', 'preferences'])

function sendError(res, error, fallback = 'Profile request failed') {
  const status = error.status || error.statusCode || 500
  return res.status(status).json({ error: error.message || fallback })
}

function hasProfilePatch(body) {
  return Boolean(body && typeof body === 'object' && Object.keys(body).some((key) => PROFILE_PATCH_KEYS.has(key)))
}

module.exports = async function handler(req, res) {
  const auth = await requireAuthenticatedUser(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  try {
    const appUser = await ensureAppUserForAuth(auth.client, auth.user)

    if (req.method === 'GET') {
      return res.status(200).json({ profile: mapAppUser(appUser) })
    }

    if (req.method === 'PATCH') {
      const body = await readJsonBody(req)
      if (!hasProfilePatch(body)) return res.status(400).json({ error: 'Profile update payload is empty' })
      const nextUser = await updateAppUser(auth.client, appUser.id, body)
      return res.status(200).json({ profile: mapAppUser(nextUser) })
    }

    res.setHeader('Allow', 'GET, PATCH')
    return res.status(405).json({ error: 'Method not allowed' })
  } catch (error) {
    if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
    return sendError(res, error)
  }
}
