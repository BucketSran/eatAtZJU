async function readJsonBody(req) {
  if (Buffer.isBuffer(req.body)) {
    const raw = req.body.toString('utf8')
    return raw ? JSON.parse(raw) : {}
  }
  if (req.body instanceof Uint8Array) {
    const raw = Buffer.from(req.body).toString('utf8')
    return raw ? JSON.parse(raw) : {}
  }
  if (typeof req.body === 'string') return req.body ? JSON.parse(req.body) : {}
  if (req.body && typeof req.body === 'object') return req.body
  if (!req || typeof req[Symbol.asyncIterator] !== 'function') return {}

  const chunks = []
  for await (const chunk of req) chunks.push(Buffer.from(chunk))
  const raw = Buffer.concat(chunks).toString('utf8')
  return raw ? JSON.parse(raw) : {}
}

module.exports = { readJsonBody }
