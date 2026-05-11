import { adminFetch } from './adminApiClient'
import type { SubmissionType } from './submissionService'

export type ContentChangeAction = 'demote' | 'archive' | 'edit' | 'add'
export type ContentChangeStatus = 'draft' | 'queued' | 'materialized' | 'rejected'

export type ContentChangeRequestInput = {
  action: ContentChangeAction
  targetId?: string
  targetName: string
  summary: string
  payload: Record<string, unknown>
  submissionType: Extract<SubmissionType, 'restaurant' | 'correction'>
  submissionPayload: Record<string, unknown>
}

export type AdminContentChangeRequest = ContentChangeRequestInput & {
  id: string
  status: ContentChangeStatus
  targetTable: 'restaurants'
  sourceSubmissionId: string | null
  requesterId: string | null
  reviewerId: string | null
  reviewedAt: string | null
  materializedAt: string | null
  materializedTargetTable?: string | null
  materializedTargetId?: string | null
  queuedAt?: string | null
  reviewNote?: string | null
  createdAt: string
  updatedAt: string
}

export type ContentChangeStats = {
  total: number
  byStatus: Partial<Record<ContentChangeStatus, number>>
  byAction: Partial<Record<ContentChangeAction, number>>
}

function buildQuery(filters: { status?: string; action?: string; q?: string } = {}) {
  const params = new URLSearchParams()
  if (filters.status && filters.status !== '全部') params.set('status', filters.status)
  if (filters.action && filters.action !== '全部') params.set('action', filters.action)
  if (filters.q) params.set('q', filters.q)
  const query = params.toString()
  return `/api/admin/content-change-requests${query ? `?${query}` : ''}`
}

export async function listContentChangeRequests(filters: { status?: string; action?: string; q?: string } = {}) {
  const body = await adminFetch<{ requests?: AdminContentChangeRequest[]; stats?: ContentChangeStats }>(buildQuery(filters), undefined, 'Content change request failed')
  return {
    requests: (body.requests || []) as AdminContentChangeRequest[],
    stats: (body.stats || { total: 0, byStatus: {}, byAction: {} }) as ContentChangeStats
  }
}

export async function createContentChangeRequest(request: ContentChangeRequestInput, submitToQueue = false) {
  const body = await adminFetch<{ request: AdminContentChangeRequest }>('/api/admin/content-change-requests', {
    method: 'POST',
    body: JSON.stringify({ request, submitToQueue })
  }, 'Content change request failed')
  return body.request as AdminContentChangeRequest
}

export async function submitContentChangeRequests(ids: string[]) {
  const body = await adminFetch<{ requests?: AdminContentChangeRequest[] }>('/api/admin/content-change-requests', {
    method: 'PATCH',
    body: JSON.stringify({ ids, submitToQueue: true })
  }, 'Content change request failed')
  return (body.requests || []) as AdminContentChangeRequest[]
}

export async function updateContentChangeRequestStatus(ids: string[], status: Extract<ContentChangeStatus, 'rejected'>, reviewNote?: string) {
  const body = await adminFetch<{ requests?: AdminContentChangeRequest[] }>('/api/admin/content-change-requests', {
    method: 'PATCH',
    body: JSON.stringify({ ids, status, reviewNote })
  }, 'Content change request failed')
  return (body.requests || []) as AdminContentChangeRequest[]
}
