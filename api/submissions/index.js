const { requireAuthenticatedUser } = require('../_shared/auth.cjs')
const { readJsonBody } = require('../_shared/requestBody.cjs')

const ALLOWED_TYPES = new Set(['restaurant', 'dish', 'review', 'checkin', 'correction'])
const MAX_PAYLOAD_BYTES = 20_000

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
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
    if (Buffer.byteLength(JSON.stringify(payload), 'utf8') > MAX_PAYLOAD_BYTES) return res.status(413).json({ error: 'Payload too large' })

    const { data, error } = await auth.client
      .from('submissions')
      .insert({ type, payload, submitter_id: auth.user.id, status: 'pending' })
      .select('id,status')
      .single()

    if (error) throw error
    return res.status(201).json(data)
  } catch (error) {
    if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
    return res.status(500).json({ error: 'Failed to create submission' })
  }
}
