import { adminFetch } from './adminApiClient'
import type { SubmissionType } from './submissionService'

export type AdminSubmission = {
  id: string
  type: SubmissionType
  payload: Record<string, unknown>
  submitter_id: string
  status: 'pending' | 'reviewing' | 'approved' | 'rejected'
  created_at: string
  review_note: string | null
}

export async function listPendingSubmissions() {
  const body = await adminFetch<{ submissions?: AdminSubmission[] }>('/api/admin/submissions')
  return (body.submissions || []) as AdminSubmission[]
}

export async function reviewSubmission(id: string, action: 'approve' | 'reject', reviewNote?: string, payload?: Record<string, unknown>) {
  return adminFetch<{
    id: string
    status: 'approved' | 'rejected'
    materialized?: {
      skipped: boolean
      reason?: string
      targetTable?: string
      targetId?: string
    }
  }>('/api/admin/submissions', {
    method: 'POST',
    body: JSON.stringify({ id, action, reviewNote, payload })
  })
}
