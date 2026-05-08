const { createClient } = require('@supabase/supabase-js')

const PLACEHOLDER_VALUES = new Set(['', 'server_only_do_not_expose', 'server_only_for_migrations_optional'])

function readEnv(name) {
  const value = process.env[name]
  if (!value || PLACEHOLDER_VALUES.has(value)) return undefined
  return value
}

function getSupabaseConfig() {
  const url = readEnv('SUPABASE_URL') || readEnv('VITE_SUPABASE_URL')
  const serviceRoleKey = readEnv('SUPABASE_SERVICE_ROLE_KEY')
  const anonKey = readEnv('SUPABASE_ANON_KEY') || readEnv('VITE_SUPABASE_ANON_KEY')
  const key = serviceRoleKey || anonKey

  return {
    hasConfig: Boolean(url && key),
    keyType: serviceRoleKey ? 'service_role' : anonKey ? 'anon' : 'missing',
    key,
    url
  }
}

function createServerSupabaseClient() {
  const config = getSupabaseConfig()
  if (!config.hasConfig) return null

  return createClient(config.url, config.key, {
    auth: {
      autoRefreshToken: false,
      persistSession: false
    }
  })
}

module.exports = {
  createServerSupabaseClient,
  getSupabaseConfig
}
