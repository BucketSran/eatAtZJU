import { getSupabaseBrowserClient } from './supabaseBrowserClient'

export type AccountLinkCode = {
  code: string
  createdAt?: string
  expiresAt: string
}

async function getAccessToken() {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')
  const { data, error } = await client.auth.getSession()
  if (error) throw error
  if (!data.session?.access_token) throw new Error('Please sign in first')
  return data.session.access_token
}

async function requestAccountLinkApi<T>(method: 'GET' | 'POST') {
  const token = await getAccessToken()
  const response = await fetch('/api/account/link-code', {
    method,
    headers: {
      accept: 'application/json',
      Authorization: `Bearer ${token}`
    }
  })
  const body = await response.json().catch(() => ({})) as { error?: string } & T
  if (!response.ok) throw new Error(body.error || `Account link API returned ${response.status}`)
  return body
}

export async function createAccountLinkCode() {
  const body = await requestAccountLinkApi<{ code: string, createdAt: string, expiresAt: string }>('POST')
  return { code: body.code, createdAt: body.createdAt, expiresAt: body.expiresAt }
}

export async function listAccountLinkCodes() {
  const body = await requestAccountLinkApi<{ codes: Array<{ code: string, created_at?: string, createdAt?: string, expires_at?: string, expiresAt?: string }> }>('GET')
  return (body.codes || []).map((code) => ({
    code: code.code,
    createdAt: code.createdAt || code.created_at,
    expiresAt: code.expiresAt || code.expires_at || ''
  })).filter((code) => Boolean(code.code && code.expiresAt)) as AccountLinkCode[]
}
