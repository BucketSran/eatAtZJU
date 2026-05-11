const { requirePlatformAdmin } = require('../../_shared/auth.cjs')
const { readJsonBody } = require('../../_shared/requestBody.cjs')

const MAX_PAYLOAD_BYTES = 20_000
const REVIEW_CLAIM_TTL_MS = 15 * 60 * 1000

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function mapReviewRpcError(error) {
  const message = error?.message || 'Failed to review submission'
  if (message.includes('not found')) return { status: 404, error: message }
  if (message.includes('already been claimed') || message.includes('already been reviewed')) return { status: 409, error: message }
  if (message.includes('Admin access required')) return { status: 403, error: message }
  if (message.includes('Invalid') || message.includes('Missing') || message.includes('too large') || message.includes('must be')) return { status: 400, error: message }
  return { status: 500, error: 'Failed to review submission' }
}

async function releaseStaleReviewClaims(client) {
  const cutoff = new Date(Date.now() - REVIEW_CLAIM_TTL_MS).toISOString()
  const { error } = await client
    .from('submissions')
    .update({ status: 'pending', reviewer_id: null })
    .eq('status', 'reviewing')
    .is('reviewed_at', null)
    .lt('updated_at', cutoff)

  if (error) throw error
}

module.exports = async function handler(req, res) {
  const auth = await requirePlatformAdmin(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  if (req.method === 'GET') {
    try {
      await releaseStaleReviewClaims(auth.client)
    } catch (error) {
      return res.status(500).json({ error: 'Failed to release stale review claims' })
    }

    const { data, error } = await auth.client
      .from('submissions')
      .select('id,type,payload,submitter_id,status,created_at,review_note')
      .eq('status', 'pending')
      .order('created_at', { ascending: true })
      .limit(50)

    if (error) return res.status(500).json({ error: 'Failed to list submissions' })
    return res.status(200).json({ submissions: data || [] })
  }

  if (req.method === 'POST') {
    try {
      const body = await readJsonBody(req)
      const id = typeof body.id === 'string' ? body.id : ''
      const action = body.action === 'approve' || body.action === 'reject' ? body.action : undefined
      const reviewNote = typeof body.reviewNote === 'string' ? body.reviewNote.slice(0, 500) : null
      if (!id || !action) return res.status(400).json({ error: 'Invalid review payload' })

      const payloadOverride = isPlainObject(body.payload) ? body.payload : null
      if (payloadOverride && Buffer.byteLength(JSON.stringify(payloadOverride), 'utf8') > MAX_PAYLOAD_BYTES) return res.status(413).json({ error: 'Payload too large' })

      const { data, error } = await auth.client.rpc('review_submission_atomic', {
        p_submission_id: id,
        p_action: action,
        p_reviewer_id: auth.user.id,
        p_review_note: reviewNote,
        p_payload_override: payloadOverride
      })

      if (error) {
        const mapped = mapReviewRpcError(error)
        return res.status(mapped.status).json({ error: mapped.error })
      }

      return res.status(200).json(data)
    } catch (error) {
      if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
      return res.status(500).json({ error: 'Failed to review submission' })
    }
  }

  res.setHeader('Allow', 'GET, POST')
  return res.status(405).json({ error: 'Method not allowed' })
}
