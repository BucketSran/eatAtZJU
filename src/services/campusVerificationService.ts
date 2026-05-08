import { getSupabaseBrowserClient } from './supabaseBrowserClient'

export type CampusTrustStatus = {
  campusEmail: string | null
  campusEmailVerified: boolean
  contributionCount: number
  creditScore: number
}

async function getAccessToken() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data, error } = await client.auth.getSession()
  if (error) throw error
  if (!data.session?.access_token) throw new Error('Please sign in first')
  return data.session.access_token
}

export async function fetchCampusTrustStatus() {
  const client = getSupabaseBrowserClient()
  if (!client) return null

  const { data: userData, error: userError } = await client.auth.getUser()
  if (userError) throw userError
  if (!userData.user) return null

  const { data, error } = await client
    .from('user_trust')
    .select('campus_email,campus_email_verified,credit_score,contribution_count')
    .eq('user_id', userData.user.id)
    .maybeSingle()

  if (error) throw error
  if (!data) return null

  return {
    campusEmail: data.campus_email,
    campusEmailVerified: Boolean(data.campus_email_verified),
    contributionCount: Number(data.contribution_count || 0),
    creditScore: Number(data.credit_score || 50)
  } satisfies CampusTrustStatus
}

export async function verifyCampusEmail() {
  const accessToken = await getAccessToken()
  const response = await fetch('/api/auth/campus-verify', {
    method: 'POST',
    headers: {
      authorization: `Bearer ${accessToken}`
    }
  })

  const body = await response.json().catch(() => null)
  if (!response.ok) throw new Error(body?.error || `Campus verification failed with ${response.status}`)
  return body as CampusTrustStatus & { allowedDomains: string[] }
}
