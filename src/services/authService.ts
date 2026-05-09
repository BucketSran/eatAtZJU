import type { User } from '@supabase/supabase-js'
import { getPreferenceTags, setPreferenceTags } from './preferenceStore'
import { getSupabaseBrowserClient, isSupabaseBrowserConfigured } from './supabaseBrowserClient'
import { ensureAppUserProfile, updateAppUserProfile } from './appUserProfileService'

export type AuthState = {
  isConfigured: boolean
  user: User | null
}

export async function getCurrentAuthState(): Promise<AuthState> {
  const client = getSupabaseBrowserClient()
  if (!client) return { isConfigured: false, user: null }
  const { data } = await client.auth.getUser()
  return { isConfigured: true, user: data.user }
}

export function onAuthChange(callback: (state: AuthState) => void) {
  const client = getSupabaseBrowserClient()
  if (!client) {
    callback({ isConfigured: false, user: null })
    return () => {}
  }

  const { data } = client.auth.onAuthStateChange((_event, session) => {
    callback({ isConfigured: true, user: session?.user ?? null })
  })

  return () => data.subscription.unsubscribe()
}

export async function signInWithEmail(email: string) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')
  const { error } = await client.auth.signInWithOtp({
    email
  })
  if (error) throw error
}

export async function verifyEmailOtp(email: string, token: string) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data, error } = await client.auth.verifyOtp({
    email,
    token,
    type: 'email'
  })

  if (error) throw error
  return data
}

export async function signOut() {
  const client = getSupabaseBrowserClient()
  if (!client) return
  const { error } = await client.auth.signOut()
  if (error) throw error
}

export async function ensureProfile(user: User) {
  const appProfile = await ensureAppUserProfile()
  if (appProfile?.preferences?.length) setPreferenceTags(appProfile.preferences)
  return appProfile ?? { id: user.id, display_name: user.email?.split('@')[0] || 'ZJU student', preferences: getPreferenceTags() }
}

export async function syncPreferencesToProfile(tags: string[]) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data: userData, error: userError } = await client.auth.getUser()
  if (userError) throw userError
  if (!userData.user) throw new Error('Please sign in first')

  await updateAppUserProfile({ preferences: tags })
}

export { isSupabaseBrowserConfigured }
