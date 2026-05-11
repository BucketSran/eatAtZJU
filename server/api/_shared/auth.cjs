const { createAuthSupabaseClient, createServiceRoleSupabaseClient, createUserRlsSupabaseClient } = require('./supabaseClient.cjs')

function getBearerToken(req) {
  const header = req.headers?.authorization || req.headers?.Authorization
  if (!header || typeof header !== 'string') return undefined
  const match = header.match(/^Bearer\s+(.+)$/i)
  return match?.[1]
}

async function requireAuthenticatedUser(req) {
  const token = getBearerToken(req)
  if (!token) return { error: 'Missing bearer token', status: 401 }

  const authClient = createAuthSupabaseClient()
  if (!authClient) return { error: 'Supabase is not configured', status: 503 }

  const { data, error } = await authClient.auth.getUser(token)
  if (error || !data.user) return { error: 'Invalid bearer token', status: 401 }

  const scopedClient = createUserRlsSupabaseClient(token)
  if (!scopedClient) return { error: 'Supabase database client is not configured', status: 503 }
  return {
    authClient,
    client: scopedClient,
    serviceClient: createServiceRoleSupabaseClient(),
    user: data.user
  }
}

async function requirePlatformAdmin(req) {
  const result = await requireAuthenticatedUser(req)
  if (result.error) return result

  const { data, error } = await result.client
    .from('admin_users')
    .select('user_id,role')
    .eq('user_id', result.user.id)
    .in('role', ['moderator', 'admin'])
    .maybeSingle()

  if (error) return { error: 'Failed to verify admin role', status: 500 }
  if (!data) return { error: 'Admin access required', status: 403 }
  if (!result.serviceClient) return { error: 'Admin workflow requires SUPABASE_SERVICE_ROLE_KEY', status: 503 }
  return {
    admin: data,
    client: result.serviceClient,
    serviceClient: result.serviceClient,
    user: result.user,
    userClient: result.client
  }
}

module.exports = {
  getBearerToken,
  requireAuthenticatedUser,
  requirePlatformAdmin
}
