import { adminFetch } from './adminApiClient'

export type AdminAuditLog = {
  id: string
  actor_id: string | null
  action: string
  target_table: string
  target_id: string
  before_data: Record<string, unknown> | null
  after_data: Record<string, unknown> | null
  reason: string | null
  rollback_of?: string | null
  created_at: string
}

export async function listAuditLogs() {
  const body = await adminFetch<{ auditLogs?: AdminAuditLog[] }>('/api/admin/audit-logs', undefined, 'Audit request failed')
  return (body.auditLogs || []) as AdminAuditLog[]
}

export async function rollbackAuditLog(auditLogId: string, reason?: string) {
  return adminFetch<{ status: 'rolled_back'; auditLogId: string; rollbackAuditLogId?: string }>('/api/admin/audit-logs', {
    method: 'POST',
    body: JSON.stringify({ auditLogId, reason })
  }, 'Audit request failed')
}
