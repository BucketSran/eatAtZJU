const { requirePlatformAdmin } = require('../../_shared/auth.cjs')
const { readJsonBody } = require('../../_shared/requestBody.cjs')

const ROLLBACK_TABLES = new Set(['submissions', 'restaurants', 'dishes', 'reviews'])

function getPrimaryKeyField(table) {
  return table === 'user_trust' ? 'user_id' : 'id'
}

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

async function rollbackAuditLog(auth, auditLog, reason) {
  const table = auditLog.target_table
  const targetId = auditLog.target_id
  if (!ROLLBACK_TABLES.has(table)) throw new Error('Unsupported rollback target')

  const primaryKey = getPrimaryKeyField(table)
  const beforeData = isPlainObject(auditLog.before_data) ? auditLog.before_data : null
  const afterData = isPlainObject(auditLog.after_data) ? auditLog.after_data : null

  if (!beforeData && !afterData) throw new Error('Audit log has no rollback snapshot')

  if (beforeData) {
    const { error } = await auth.client.from(table).upsert(beforeData, { onConflict: primaryKey })
    if (error) throw error
  } else {
    const { error } = await auth.client.from(table).delete().eq(primaryKey, targetId)
    if (error) throw error
  }

  const { error: auditError } = await auth.client.from('audit_logs').insert({
    actor_id: auth.user.id,
    action: 'rollback',
    target_table: table,
    target_id: targetId,
    before_data: afterData,
    after_data: beforeData,
    reason
  })

  if (auditError) throw auditError
}

module.exports = async function handler(req, res) {
  const auth = await requirePlatformAdmin(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  if (req.method === 'GET') {
    const limit = Math.min(Math.max(Number(req.query?.limit) || 50, 1), 100)
    const { data, error } = await auth.client
      .from('audit_logs')
      .select('id,actor_id,action,target_table,target_id,before_data,after_data,reason,created_at')
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

      const { data: auditLog, error } = await auth.client
        .from('audit_logs')
        .select('id,action,target_table,target_id,before_data,after_data,reason,created_at')
        .eq('id', auditLogId)
        .maybeSingle()

      if (error) return res.status(500).json({ error: 'Failed to read audit log' })
      if (!auditLog) return res.status(404).json({ error: 'Audit log not found' })
      if (auditLog.action === 'rollback') return res.status(400).json({ error: 'Rollback logs cannot be rolled back directly' })

      await rollbackAuditLog(auth, auditLog, reason)
      return res.status(200).json({ status: 'rolled_back', auditLogId })
    } catch (error) {
      if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
      return res.status(500).json({ error: 'Failed to rollback audit log' })
    }
  }

  res.setHeader('Allow', 'GET, POST')
  return res.status(405).json({ error: 'Method not allowed' })
}
