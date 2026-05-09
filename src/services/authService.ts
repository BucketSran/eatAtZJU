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
  const client = getSupabaseBrowserClient()
  if (!client) return null

  const appProfile = await ensureAppUserProfile(user)

  const { data: existingProfile, error: selectError } = await client
    .from('profiles')
    .select('id,display_name,preferences')
    .eq('id', user.id)
    .maybeSingle()

  if (selectError) throw selectError
  if (existingProfile) {
    if (appProfile?.preferences?.length) setPreferenceTags(appProfile.preferences)
    else if (Array.isArray(existingProfile.preferences)) setPreferenceTags(existingProfile.preferences)
    return appProfile ?? existingProfile
  }

  const { data, error } = await client
    .from('profiles')
    .insert({ id: user.id, display_name: user.email?.split('@')[0] || 'ZJU student', preferences: getPreferenceTags() })
    .select('id,display_name,preferences')
    .single()

  if (error) throw error
  if (appProfile?.preferences?.length) setPreferenceTags(appProfile.preferences)
  else if (Array.isArray(data.preferences)) setPreferenceTags(data.preferences)
  return appProfile ?? data
}

export async function syncPreferencesToProfile(tags: string[]) {
  const client = getSupabaseBrowserClient()
  if (!client) throw new Error('Supabase browser client is not configured')

  const { data: userData, error: userError } = await client.auth.getUser()
  if (userError) throw userError
  if (!userData.user) throw new Error('Please sign in first')

  const { error } = await client
    .from('profiles')
    .upsert({ id: userData.user.id, display_name: userData.user.email?.split('@')[0] || 'ZJU student', preferences: tags }, { onConflict: 'id' })

  if (error) throw error
  await updateAppUserProfile({ preferences: tags })
}

export { isSupabaseBrowserConfigured }
