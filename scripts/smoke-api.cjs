const path = require('path')

const root = path.resolve(__dirname, '..')

function fail(message) {
  console.error(message)
  process.exit(1)
}

async function fetchJson(url) {
  const response = await fetch(url)
  const body = await response.json().catch(() => null)
  return { status: response.status, body }
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

async function runRemote(baseUrl, expectedSource) {
  const normalized = baseUrl.replace(/\/$/, '')
  return {
    restaurants: await fetchJson(`${normalized}/api/restaurants?tag=${encodeURIComponent('实惠')}`),
    detail: await fetchJson(`${normalized}/api/restaurants/r001`),
    today: await fetchJson(`${normalized}/api/recommend/today?strategy=recommended`),
    expectedSource
  }
}

async function runLocal(expectedSource) {
  return {
    restaurants: await callHandler('api/restaurants/index.js', { method: 'GET', query: { tag: '实惠' } }),
    detail: await callHandler('api/restaurants/[id].js', { method: 'GET', query: { id: 'r001' } }),
    today: await callHandler('api/recommend/today.js', { method: 'GET', query: { strategy: 'recommended' } }),
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
  const expectedSource = process.env.EXPECT_API_SOURCE || 'supabase'
  const result = process.env.API_BASE_URL ? await runRemote(process.env.API_BASE_URL, expectedSource) : await runLocal(expectedSource)

  assertResult('restaurants', result.restaurants, result.expectedSource)
  assertResult('detail', result.detail, result.expectedSource)
  assertResult('today', result.today, result.expectedSource)

  console.log(JSON.stringify({
    restaurants: { status: result.restaurants.status, source: result.restaurants.body.source, count: result.restaurants.body.restaurants?.length },
    detail: { status: result.detail.status, source: result.detail.body.source, id: result.detail.body.restaurant?.id },
    today: { status: result.today.status, source: result.today.body.source, id: result.today.body.restaurant?.id }
  }, null, 2))
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
