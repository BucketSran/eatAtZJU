const DEFAULT_CAMPUS_EMAIL_DOMAINS = ['zju.edu.cn', 'st.zju.edu.cn', 'intl.zju.edu.cn']

function getAllowedCampusEmailDomains() {
  const raw = process.env.CAMPUS_EMAIL_DOMAINS
  if (!raw) return DEFAULT_CAMPUS_EMAIL_DOMAINS
  return raw
    .split(',')
    .map((domain) => domain.trim().toLowerCase())
    .filter(Boolean)
}

function getEmailDomain(email) {
  if (!email || typeof email !== 'string' || !email.includes('@')) return undefined
  return email.toLowerCase().split('@').pop()
}

function isAllowedCampusEmail(email) {
  const emailDomain = getEmailDomain(email)
  if (!emailDomain) return false

  return getAllowedCampusEmailDomains().some((allowedDomain) => {
    if (allowedDomain.startsWith('*.')) {
      const suffix = allowedDomain.slice(2)
      return emailDomain.endsWith(`.${suffix}`)
    }
    return emailDomain === allowedDomain
  })
}

module.exports = {
  DEFAULT_CAMPUS_EMAIL_DOMAINS,
  getAllowedCampusEmailDomains,
  getEmailDomain,
  isAllowedCampusEmail
}
