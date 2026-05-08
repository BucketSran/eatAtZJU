const { requirePlatformAdmin } = require('../../_shared/auth.cjs')
const { readJsonBody } = require('../../_shared/requestBody.cjs')

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

      const status = action === 'approve' ? 'approved' : 'rejected'
      const { data: before } = await auth.client.from('submissions').select('*').eq('id', id).maybeSingle()
      const { data, error } = await auth.client
        .from('submissions')
        .update({ status, reviewer_id: auth.user.id, reviewed_at: new Date().toISOString(), review_note: reviewNote })
        .eq('id', id)
        .select('id,status')
        .single()

      if (error) throw error

      await auth.client.from('audit_logs').insert({
        actor_id: auth.user.id,
        action,
        target_table: 'submissions',
        target_id: id,
        before_data: before || null,
        after_data: data,
        reason: reviewNote
      })

      return res.status(200).json(data)
    } catch (error) {
      if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
      return res.status(500).json({ error: 'Failed to review submission' })
    }
  }

  res.setHeader('Allow', 'GET, POST')
  return res.status(405).json({ error: 'Method not allowed' })
}
