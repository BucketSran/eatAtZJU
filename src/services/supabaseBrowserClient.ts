import { createClient, type SupabaseClient } from '@supabase/supabase-js'

let browserClient: SupabaseClient | null = null

function readEnv(name: 'VITE_SUPABASE_URL' | 'VITE_SUPABASE_ANON_KEY') {
  const value = import.meta.env[name]
  return value && value.trim() ? value : undefined
}

export function isSupabaseBrowserConfigured() {
  return Boolean(readEnv('VITE_SUPABASE_URL') && readEnv('VITE_SUPABASE_ANON_KEY'))
}

export function getSupabaseBrowserClient() {
  if (!isSupabaseBrowserConfigured()) return null
  if (!browserClient) {
    browserClient = createClient(readEnv('VITE_SUPABASE_URL')!, readEnv('VITE_SUPABASE_ANON_KEY')!)
  }
  return browserClient
}
