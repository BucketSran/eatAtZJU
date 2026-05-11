const { requireAuthenticatedUser } = require('../_shared/auth.cjs')
const { getSupabaseConfig } = require('../_shared/supabaseClient.cjs')
const { getAllowedCampusEmailDomains, isAllowedCampusEmail } = require('../_shared/campusEmail.cjs')

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST')
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const auth = await requireAuthenticatedUser(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  const config = getSupabaseConfig()
  const serviceClient = auth.serviceClient
  if (config.keyType !== 'service_role' || !serviceClient) {
    return res.status(503).json({ error: 'Campus verification requires SUPABASE_SERVICE_ROLE_KEY' })
  }

  const email = auth.user.email ? auth.user.email.toLowerCase() : ''
  if (!email) return res.status(400).json({ error: 'Authenticated user has no email' })

  const verified = isAllowedCampusEmail(email)

  try {
    const { data: existing, error: selectError } = await serviceClient
      .from('user_trust')
      .select('credit_score,contribution_count')
      .eq('user_id', auth.user.id)
      .maybeSingle()

    if (selectError) throw selectError

    const currentCreditScore = typeof existing?.credit_score === 'number' ? existing.credit_score : 50
    const nextCreditScore = verified ? Math.max(currentCreditScore, 60) : currentCreditScore
    const contributionCount = typeof existing?.contribution_count === 'number' ? existing.contribution_count : 0

    const { data, error } = await serviceClient
      .from('user_trust')
      .upsert({
        user_id: auth.user.id,
        campus_email: verified ? email : null,
        campus_email_verified: verified,
        credit_score: nextCreditScore,
        contribution_count: contributionCount
      }, { onConflict: 'user_id' })
      .select('user_id,campus_email,campus_email_verified,credit_score,contribution_count')
      .single()

    if (error) throw error

    return res.status(200).json({
      campusEmail: data.campus_email,
      campusEmailVerified: data.campus_email_verified,
      contributionCount: data.contribution_count,
      creditScore: data.credit_score,
      allowedDomains: getAllowedCampusEmailDomains()
    })
  } catch (error) {
    return res.status(500).json({ error: 'Failed to verify campus email' })
  }
}
