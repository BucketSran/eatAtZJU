const { ensureAppUserForAuth, uploadAvatar } = require('../_shared/appProfile.cjs')
const { requireAuthenticatedUser } = require('../_shared/auth.cjs')
const { readJsonBody } = require('../_shared/requestBody.cjs')

function sendError(res, error, fallback = 'Avatar upload failed') {
  const status = error.status || error.statusCode || 500
  return res.status(status).json({ error: error.message || fallback })
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
    if (!body || typeof body !== 'object' || !body.base64Data) {
      return res.status(400).json({ error: 'Avatar upload payload is empty' })
    }
    const appUser = await ensureAppUserForAuth(auth.client, auth.user)
    const result = await uploadAvatar(auth.client, appUser.id, body)
    return res.status(200).json(result)
  } catch (error) {
    if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
    return sendError(res, error)
  }
}
