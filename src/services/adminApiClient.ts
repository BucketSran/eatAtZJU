import { getSupabaseBrowserClient } from './supabaseBrowserClient'

async function getAccessToken() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data, error } = await client.auth.getSession()
  if (error) throw error
  if (!data.session?.access_token) throw new Error('Please sign in first')
  return data.session.access_token
}

export async function adminFetch<T = unknown>(path: string, init?: RequestInit, fallbackMessage = 'Admin request failed'): Promise<T> {
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
  if (!response.ok) throw new Error(body?.error || `${fallbackMessage} with ${response.status}`)
  return body as T
}
