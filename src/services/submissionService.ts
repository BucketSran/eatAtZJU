import { getSupabaseBrowserClient } from './supabaseBrowserClient'

export type SubmissionType = 'restaurant' | 'dish' | 'review' | 'checkin' | 'correction'

export async function submitContribution(type: SubmissionType, payload: Record<string, unknown>) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data: sessionData, error: sessionError } = await client.auth.getSession()
  if (sessionError) throw sessionError
  const accessToken = sessionData.session?.access_token
  if (!accessToken) throw new Error('Please sign in first')

  const response = await fetch('/api/submissions', {
    method: 'POST',
    headers: {
      authorization: `Bearer ${accessToken}`,
      'content-type': 'application/json'
    },
    body: JSON.stringify({ type, payload })
  })

  const body = await response.json().catch(() => null)
  if (!response.ok) throw new Error(body?.error || `Submission failed with ${response.status}`)
  return body as { id: string; status: 'pending' }
}
