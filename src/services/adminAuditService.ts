import { getSupabaseBrowserClient } from './supabaseBrowserClient'

export type AdminAuditLog = {
  id: string
  actor_id: string | null
  action: string
  target_table: string
  target_id: string
  before_data: Record<string, unknown> | null
  after_data: Record<string, unknown> | null
  reason: string | null
  created_at: string
}

async function getAccessToken() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data, error } = await client.auth.getSession()
  if (error) throw error
  if (!data.session?.access_token) throw new Error('Please sign in first')
  return data.session.access_token
}

async function adminFetch(path: string, init?: RequestInit) {
  const accessToken = await getAccessToken()
  const response = await fetch(path, {
    ...init,
    headers: {
      authorization: `Bearer ${accessToken}`,
      'content-type': 'application/json',
      ...init?.headers
    }
  })

  const body = await response.json().catch(() => null)
  if (!response.ok) throw new Error(body?.error || `Audit request failed with ${response.status}`)
  return body
}

export async function listAuditLogs() {
  const body = await adminFetch('/api/admin/audit-logs')
  return (body.auditLogs || []) as AdminAuditLog[]
}

export async function rollbackAuditLog(auditLogId: string, reason?: string) {
  return adminFetch('/api/admin/audit-logs', {
    method: 'POST',
    body: JSON.stringify({ auditLogId, reason })
  }) as Promise<{ status: 'rolled_back'; auditLogId: string }>
}
