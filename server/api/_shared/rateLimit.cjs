const buckets = new Map()

function getClientKey(req, suffix = 'global') {
  const forwardedFor = req.headers?.['x-forwarded-for'] || req.headers?.['X-Forwarded-For'] || ''
  const ip = String(forwardedFor).split(',')[0].trim() || req.socket?.remoteAddress || 'unknown'
  return `${suffix}:${ip}`
}

function prune(now) {
  if (buckets.size < 5000) return
  for (const [key, bucket] of buckets) {
    if (bucket.resetAt <= now) buckets.delete(key)
  }
}

function checkRateLimit(key, { limit, windowMs }) {
  const now = Date.now()
  prune(now)
  const current = buckets.get(key)
  if (!current || current.resetAt <= now) {
    buckets.set(key, { count: 1, resetAt: now + windowMs })
    return { allowed: true, remaining: limit - 1, resetAt: now + windowMs }
  }

  if (current.count >= limit) {
    return { allowed: false, remaining: 0, resetAt: current.resetAt }
  }

  current.count += 1
  return { allowed: true, remaining: limit - current.count, resetAt: current.resetAt }
}

function applyRateLimit(res, result) {
  res.setHeader('X-RateLimit-Remaining', String(result.remaining))
  res.setHeader('X-RateLimit-Reset', String(Math.ceil(result.resetAt / 1000)))
  if (result.allowed) return false
  res.setHeader('Retry-After', String(Math.max(1, Math.ceil((result.resetAt - Date.now()) / 1000))))
  res.status(429).json({ error: 'Too many requests, please slow down' })
  return true
}

module.exports = {
  applyRateLimit,
  checkRateLimit,
  getClientKey
}
