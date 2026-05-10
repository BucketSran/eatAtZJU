const { requirePlatformAdmin } = require('../../_shared/auth.cjs')
const { readJsonBody } = require('../../_shared/requestBody.cjs')
const { materializeSubmission } = require('../../_shared/submissionMaterializer.cjs')

const MAX_PAYLOAD_BYTES = 20_000

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

async function insertAuditLog(client, payload) {
  const { error } = await client.from('audit_logs').insert(payload)
  if (error) throw error
}

async function cleanupMaterializedSubmission(client, materialized) {
  if (!materialized || materialized.skipped || !materialized.targetTable || !materialized.targetId) return
  await client.from(materialized.targetTable).delete().eq('id', materialized.targetId)
}

async function restorePendingSubmission(client, before) {
  await client
    .from('submissions')
    .update({
      status: 'pending',
      payload: before.payload,
      reviewer_id: null,
      reviewed_at: null,
      review_note: before.review_note || null
    })
    .eq('id', before.id)
}

module.exports = async function handler(req, res) {
  const auth = await requirePlatformAdmin(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  if (req.method === 'GET') {
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

      const status = action === 'approve' ? 'approved' : 'rejected'
      const { data: before } = await auth.client.from('submissions').select('*').eq('id', id).maybeSingle()
      if (!before) return res.status(404).json({ error: 'Submission not found' })
      if (before.status !== 'pending') return res.status(409).json({ error: 'Submission has already been reviewed' })
      const reviewTarget = payloadOverride ? { ...before, payload: { ...(before.payload || {}), ...payloadOverride } } : before

      const materialized = action === 'approve'
        ? await materializeSubmission(auth.client, reviewTarget, auth.user.id)
        : { skipped: true, reason: 'rejected' }

      const { data, error } = await auth.client
        .from('submissions')
        .update({ status, payload: reviewTarget.payload, reviewer_id: auth.user.id, reviewed_at: new Date().toISOString(), review_note: reviewNote })
        .eq('id', id)
        .eq('status', 'pending')
        .select('id,status,reviewed_at')
        .single()

      if (error) {
        await cleanupMaterializedSubmission(auth.client, materialized)
        throw error
      }

      try {
        await insertAuditLog(auth.client, {
          actor_id: auth.user.id,
          action,
          target_table: 'submissions',
          target_id: id,
          before_data: before || null,
          after_data: { ...data, materialized },
          reason: reviewNote
        })

        if (!materialized.skipped) {
          await insertAuditLog(auth.client, {
            actor_id: auth.user.id,
            action: `materialize_${before.type}`,
            target_table: materialized.targetTable,
            target_id: materialized.targetId,
            before_data: null,
            after_data: materialized.data,
            reason: `Approved submission ${id}`
          })
        }
      } catch (auditError) {
        await cleanupMaterializedSubmission(auth.client, materialized)
        await restorePendingSubmission(auth.client, before)
        throw auditError
      }

      return res.status(200).json({ ...data, materialized })
    } catch (error) {
      if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
      return res.status(500).json({ error: 'Failed to review submission' })
    }
  }

  res.setHeader('Allow', 'GET, POST')
  return res.status(405).json({ error: 'Method not allowed' })
}
