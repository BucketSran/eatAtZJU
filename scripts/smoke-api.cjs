const { execFile } = require('child_process')
const path = require('path')

const root = path.resolve(__dirname, '..')
const maxAttempts = Math.max(1, Number(process.env.SMOKE_RETRIES || 3))

function fail(message) {
  console.error(message)
  process.exit(1)
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

function fetchJsonWithCurl(url) {
  return new Promise((resolve, reject) => {
    execFile('curl', ['-sS', '-L', '--retry', '3', '--retry-delay', '1', '--connect-timeout', '10', '--max-time', '30', '-w', '\n__HTTP_STATUS__:%{http_code}', url], { maxBuffer: 5 * 1024 * 1024 }, (error, stdout, stderr) => {
      if (error) return reject(new Error(stderr || error.message))
      const marker = '\n__HTTP_STATUS__:'
      const markerIndex = stdout.lastIndexOf(marker)
      if (markerIndex === -1) return reject(new Error('curl smoke missing HTTP status'))
      const rawBody = stdout.slice(0, markerIndex)
      const status = Number(stdout.slice(markerIndex + marker.length).trim())
      let body = null
      try {
        body = rawBody ? JSON.parse(rawBody) : null
      } catch {
        body = null
      }
      resolve({ status, body })
    })
  })
}

async function fetchJson(url, attempt = 1) {
  try {
    const response = await fetch(url, { headers: { accept: 'application/json' } })
    const body = await response.json().catch(() => null)
    return { status: response.status, body }
  } catch (error) {
    if (attempt >= maxAttempts) return fetchJsonWithCurl(url)
    await sleep(300 * attempt)
    return fetchJson(url, attempt + 1)
  }
}

function createMockResponse() {
  return {
    body: undefined,
    headers: {},
    statusCode: 200,
    setHeader(key, value) {
      this.headers[key] = value
    },
    status(code) {
      this.statusCode = code
      return this
    },
    json(body) {
      this.body = body
      return this
    }
  }
}

async function callHandler(relativePath, req) {
  const handler = require(path.join(root, relativePath))
  const res = createMockResponse()
  await handler(req, res)
  return { status: res.statusCode, body: res.body }
}

function resolveBaseUrl() {
  const argUrl = process.argv.slice(2).find((arg) => /^https?:\/\//.test(arg))
  return argUrl || process.env.API_BASE_URL || ''
}

async function runRemote(baseUrl, expectedSource) {
  const normalized = baseUrl.replace(/\/$/, '')
  const restaurants = await fetchJson(`${normalized}/api/restaurants?tag=${encodeURIComponent('实惠')}&limit=3`)
  const detailId = restaurants.body?.restaurants?.[0]?.id || 'r001'
  return {
    mode: 'remote',
    baseUrl: normalized,
    restaurants,
    recommend: await fetchJson(`${normalized}/api/restaurants?campus=zijingang&sort=recommended&limit=3`),
    detail: await fetchJson(`${normalized}/api/restaurants/${encodeURIComponent(detailId)}`),
    today: await fetchJson(`${normalized}/api/recommend/today?strategy=recommended`),
    expectedSource
  }
}

async function runLocal(expectedSource) {
  return {
    mode: 'local',
    baseUrl: 'local handlers',
    restaurants: await callHandler('server/api/restaurants/index.js', { method: 'GET', query: { tag: '实惠', limit: '3' } }),
    recommend: await callHandler('server/api/restaurants/index.js', { method: 'GET', query: { campus: 'zijingang', sort: 'recommended', limit: '3' } }),
    detail: await callHandler('server/api/restaurants/[id].js', { method: 'GET', query: { id: 'r001' } }),
    today: await callHandler('server/api/recommend/today.js', { method: 'GET', query: { strategy: 'recommended' } }),
    expectedSource
  }
}

function assertResult(name, result, expectedSource) {
  if (result.status !== 200) fail(`${name} expected 200, got ${result.status}`)
  if (!result.body) fail(`${name} missing JSON body`)
  if (expectedSource && result.body.source !== expectedSource) {
    fail(`${name} expected source=${expectedSource}, got ${result.body.source}`)
  }
}

async function main() {
  const baseUrl = resolveBaseUrl()
  const expectedSource = process.env.EXPECT_API_SOURCE || (baseUrl ? 'supabase' : undefined)
  const result = baseUrl ? await runRemote(baseUrl, expectedSource) : await runLocal(expectedSource)

  assertResult('restaurants', result.restaurants, result.expectedSource)
  assertResult('recommend', result.recommend, result.expectedSource)
  assertResult('detail', result.detail, result.expectedSource)
  assertResult('today', result.today, result.expectedSource)

  console.log(JSON.stringify({
    mode: result.mode,
    baseUrl: result.baseUrl,
    expectedSource: result.expectedSource || 'not asserted',
    restaurants: { status: result.restaurants.status, source: result.restaurants.body.source, count: result.restaurants.body.restaurants?.length },
    recommend: { status: result.recommend.status, source: result.recommend.body.source, count: result.recommend.body.restaurants?.length },
    detail: { status: result.detail.status, source: result.detail.body.source, id: result.detail.body.restaurant?.id },
    today: { status: result.today.status, source: result.today.body.source, id: result.today.body.restaurant?.id }
  }, null, 2))
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
