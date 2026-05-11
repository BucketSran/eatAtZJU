const { requirePlatformAdmin } = require('../../_shared/auth.cjs')
const { readJsonBody } = require('../../_shared/requestBody.cjs')

function mapRollbackRpcError(error) {
  const message = error?.message || 'Failed to rollback audit log'
  if (message.includes('not found')) return { status: 404, error: message }
  if (message.includes('already been rolled back')) return { status: 409, error: message }
  if (message.includes('Admin access required')) return { status: 403, error: message }
  if (message.includes('Unsupported') || message.includes('cannot') || message.includes('Missing') || message.includes('snapshot')) return { status: 400, error: message }
  return { status: 500, error: 'Failed to rollback audit log' }
}

module.exports = async function handler(req, res) {
  const auth = await requirePlatformAdmin(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  if (req.method === 'GET') {
    const limit = Math.min(Math.max(Number(req.query?.limit) || 50, 1), 100)
    const { data, error } = await auth.client
      .from('audit_logs')
      .select('id,actor_id,action,target_table,target_id,before_data,after_data,reason,rollback_of,created_at')
      .order('created_at', { ascending: false })
      .limit(limit)

    if (error) return res.status(500).json({ error: 'Failed to list audit logs' })
    return res.status(200).json({ auditLogs: data || [] })
  }

  if (req.method === 'POST') {
    try {
      const body = await readJsonBody(req)
      const auditLogId = typeof body.auditLogId === 'string' ? body.auditLogId : ''
      const reason = typeof body.reason === 'string' && body.reason.trim() ? body.reason.slice(0, 500) : 'Manual rollback'
      if (!auditLogId) return res.status(400).json({ error: 'Missing auditLogId' })

      const { data, error } = await auth.client.rpc('rollback_audit_log_atomic', {
        p_audit_log_id: auditLogId,
        p_actor_id: auth.user.id,
        p_reason: reason
      })

      if (error) {
        const mapped = mapRollbackRpcError(error)
        return res.status(mapped.status).json({ error: mapped.error })
      }

      return res.status(200).json(data)
    } catch (error) {
      if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
      return res.status(500).json({ error: 'Failed to rollback audit log' })
    }
  }

  res.setHeader('Allow', 'GET, POST')
  return res.status(405).json({ error: 'Method not allowed' })
}
