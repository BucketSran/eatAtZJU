const { ensureAppUserForAuth, mapAppUser, updateAppUser, uploadAvatar } = require('../_shared/appProfile.cjs')
const { requireAuthenticatedUser } = require('../_shared/auth.cjs')
const { readJsonBody } = require('../_shared/requestBody.cjs')
const { applyRateLimit, checkRateLimit, getClientKey } = require('../_shared/rateLimit.cjs')

function sendError(res, error, fallback = 'Avatar upload failed') {
  const status = error.status || error.statusCode || 500
  return res.status(status).json({ error: error.message || fallback })
}

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const rateLimit = checkRateLimit(getClientKey(req, 'avatar-upload'), { limit: 12, windowMs: 60 * 60 * 1000 })
  if (applyRateLimit(res, rateLimit)) return

  const auth = await requireAuthenticatedUser(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  try {
    const body = await readJsonBody(req)
    if (!body || typeof body !== 'object' || !body.base64Data) {
      return res.status(400).json({ error: 'Avatar upload payload is empty' })
    }
    const appUser = await ensureAppUserForAuth(auth.serviceClient || auth.client, auth.user)
    const writeClient = auth.serviceClient || auth.client
    const result = await uploadAvatar(writeClient, appUser.id, body)
    const nextUser = await updateAppUser(auth.client, appUser.id, {
      avatarType: 'custom',
      avatarUrl: result.avatarUrl
    })
    return res.status(200).json({ ...result, profile: mapAppUser(nextUser) })
  } catch (error) {
    if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
    return sendError(res, error)
  }
}
