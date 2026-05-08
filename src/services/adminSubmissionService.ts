import { getSupabaseBrowserClient } from './supabaseBrowserClient'
import type { SubmissionType } from './submissionService'

export type AdminSubmission = {
  id: string
  type: SubmissionType
  payload: Record<string, unknown>
  submitter_id: string
  status: 'pending' | 'approved' | 'rejected'
  created_at: string
  review_note: string | null
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
  if (!response.ok) throw new Error(body?.error || `Admin request failed with ${response.status}`)
  return body
}

export async function listPendingSubmissions() {
  const body = await adminFetch('/api/admin/submissions')
  return (body.submissions || []) as AdminSubmission[]
}

export async function reviewSubmission(id: string, action: 'approve' | 'reject', reviewNote?: string) {
  return adminFetch('/api/admin/submissions', {
    method: 'POST',
    body: JSON.stringify({ id, action, reviewNote })
  }) as Promise<{ id: string; status: 'approved' | 'rejected' }>
}
