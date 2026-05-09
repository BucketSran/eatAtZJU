const fs = require('fs')
const path = require('path')

const root = path.resolve(__dirname, '..')
const center = { longitude: 120.081964, latitude: 30.302761 }
const radiusMeters = 3000
const maxPublishedRestaurants = 60
const minAutoPublishConfidence = 0.78
const amapRequestDelayMs = 450
const amapMaxRetries = 4
const today = new Date().toISOString().slice(0, 10).replace(/-/g, '')

const rawDir = path.join(root, 'data', 'raw')
const processedDir = path.join(root, 'data', 'processed')

const aroundKeywords = [
  '餐饮',
  '中餐',
  '快餐',
  '小吃',
  '面馆',
  '烧烤',
  '火锅',
  '咖啡',
  '甜品',
  '奶茶',
  '西餐',
  '日料',
  '韩餐',
  '清真',
  '食堂'
]

const webClues = [
  {
    keyword: 'Mojito&Mojar墨西哥餐吧 紫金港',
    title: 'Mojito&Mojar墨西哥餐吧(紫金港店) 公开餐厅页',
    url: 'https://www.cnpp100.com/shop/18988.html',
    publishedAt: '2026-01-01'
  },
  {
    keyword: '李桑炭火烤肉 浙大紫金港',
    title: '李桑炭火烤肉(浙大紫金港店) Trip.com 餐厅页',
    url: 'https://hk.trip.com/restaurant/china/hangzhou/detail/restaurant-142213787',
    publishedAt: '2025-06-24'
  },
  {
    keyword: '我们家私房纸包鱼 烧烤 浙大紫金港',
    title: '我们家私房纸包鱼&烧烤 公开餐厅页',
    url: 'https://www.cnpp100.com/shop/19074.html',
    publishedAt: '2025-10-08'
  },
  {
    keyword: 'Tony’s house 泰和路 浙江大学 紫金港',
    title: 'Reddit 杭州餐厅推荐提到 Tony’s House 与紫金港',
    url: 'https://www.reddit.com/r/hangzhou/comments/1jdcfb1',
    publishedAt: '2025-03-18'
  },
  {
    keyword: '跑马场三明治 浙江大学 紫金港',
    title: 'Reddit 杭州餐厅推荐提到跑马场三明治',
    url: 'https://www.reddit.com/r/hangzhou/comments/1jdcfb1',
    publishedAt: '2025-03-18'
  },
  {
    keyword: '紫金港餐饮中心 风味餐厅 浙江大学',
    title: 'Apple Maps 紫金港餐饮中心风味餐厅页面',
    url: 'https://maps.apple.com/place?auid=1118368631460667&lsp=57879',
    publishedAt: '2025-01-01'
  },
  {
    keyword: '澄月餐厅 浙江大学 紫金港',
    title: '2025 年浙江大学本科新生指引饮食消费页',
    url: 'https://zjuers.com/welcome/life/canteen/',
    publishedAt: '2025-01-01'
  },
  {
    keyword: '银泉餐厅 浙江大学 紫金港',
    title: '2025 年浙江大学本科新生指引校园区域页',
    url: 'https://welcome.zjuintl-share.top/life/campus/',
    publishedAt: '2025-01-01'
  },
  {
    keyword: '麦思威餐吧 浙江大学 紫金港',
    title: '2025 年浙江大学本科新生指引校园区域页',
    url: 'https://welcome.zjuintl-share.top/life/campus/',
    publishedAt: '2025-01-01'
  },
  {
    keyword: '临湖餐厅 浙江大学 紫金港',
    title: '2025 年浙江大学本科新生指引校园区域页',
    url: 'https://welcome.zjuintl-share.top/life/campus/',
    publishedAt: '2025-01-01'
  }
]

function ensureDir(dir) {
  fs.mkdirSync(dir, { recursive: true })
}

function readEnv(name) {
  const value = process.env[name]
  return value && value.trim() ? value.trim() : ''
}

function amapKey() {
  const key = readEnv('AMAP_WEB_SERVICE_KEY')
  if (!key) throw new Error('AMAP_WEB_SERVICE_KEY is required')
  return key
}

function toNumber(value, fallback = 0) {
  if (Array.isArray(value)) return fallback
  if (value === '' || value === null || value === undefined) return fallback
  const number = Number(value)
  return Number.isFinite(number) ? number : fallback
}

function unique(values) {
  return [...new Set(values.filter(Boolean))]
}

function haversineMeters(a, b) {
  const rad = Math.PI / 180
  const lat1 = a.latitude * rad
  const lat2 = b.latitude * rad
  const dLat = (b.latitude - a.latitude) * rad
  const dLon = (b.longitude - a.longitude) * rad
  const sinLat = Math.sin(dLat / 2)
  const sinLon = Math.sin(dLon / 2)
  const h = sinLat * sinLat + Math.cos(lat1) * Math.cos(lat2) * sinLon * sinLon
  return 6371000 * 2 * Math.atan2(Math.sqrt(h), Math.sqrt(1 - h))
}

function parseLocation(value) {
  if (!value || typeof value !== 'string') return null
  const [longitude, latitude] = value.split(',').map(Number)
  if (!Number.isFinite(longitude) || !Number.isFinite(latitude)) return null
  return { longitude, latitude }
}

function sleep(ms) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms)
  })
}

async function fetchAmap(endpoint, params) {
  const searchParams = new URLSearchParams({
    key: amapKey(),
    extensions: 'all',
    ...params
  })
  let lastError = null
  for (let attempt = 0; attempt <= amapMaxRetries; attempt += 1) {
    if (attempt > 0) await sleep(amapRequestDelayMs * (attempt + 1))
    else await sleep(amapRequestDelayMs)

    const response = await fetch(`https://restapi.amap.com/v3/place/${endpoint}?${searchParams.toString()}`)
    const body = await response.json()
    if (body.status === '1') return body

    lastError = new Error(`Amap ${endpoint} failed: ${body.info || 'unknown error'}`)
    if (!String(body.info || '').includes('CUQPS')) break
  }
  throw lastError
}

async function collectAroundPois() {
  const rows = []
  for (const keyword of aroundKeywords) {
    for (let page = 1; page <= 8; page += 1) {
      const body = await fetchAmap('around', {
        location: `${center.longitude},${center.latitude}`,
        keywords: keyword,
        types: '050000',
        radius: String(radiusMeters),
        offset: '25',
        page: String(page),
        sortrule: 'distance'
      })
      const pois = Array.isArray(body.pois) ? body.pois : []
      rows.push(...pois.map((poi) => ({ poi, source: { type: 'amap_around', keyword, page } })))
      if (pois.length < 25) break
    }
  }
  return rows
}

async function collectWebCluePois() {
  const rows = []
  for (const clue of webClues) {
    const body = await fetchAmap('text', {
      keywords: clue.keyword,
      city: '杭州',
      citylimit: 'true',
      types: '050000',
      offset: '10',
      page: '1'
    })
    const pois = Array.isArray(body.pois) ? body.pois : []
    rows.push(...pois.slice(0, 1).map((poi) => ({ poi, source: { type: 'web_clue', ...clue } })))
  }
  return rows
}

function normalizePoi(row) {
  const poi = row.poi
  const location = parseLocation(poi.location)
  if (!location) return null
  const computedDistanceMeters = haversineMeters(center, location)
  const reportedDistanceMeters = toNumber(poi.distance, computedDistanceMeters)
  const distanceMeters = reportedDistanceMeters > 0 ? reportedDistanceMeters : computedDistanceMeters
  const rating = toNumber(poi.biz_ext?.rating, 0)
  const cost = toNumber(poi.biz_ext?.cost, 0)
  const sourceRefs = [
    {
      type: 'amap_poi',
      poi_id: poi.id,
      name: poi.name,
      query: row.source,
      fetched_at: new Date().toISOString()
    }
  ]

  return {
    id: poi.id,
    name: String(poi.name || '').trim(),
    address: Array.isArray(poi.address) ? '' : String(poi.address || '').trim(),
    type: String(poi.type || ''),
    typecode: String(poi.typecode || ''),
    tag: Array.isArray(poi.tag) ? '' : String(poi.tag || poi.keytag || '').trim(),
    businessArea: Array.isArray(poi.business_area) ? '' : String(poi.business_area || '').trim(),
    adname: String(poi.adname || ''),
    longitude: location.longitude,
    latitude: location.latitude,
    distanceMeters,
    rating,
    cost,
    sourceRefs
  }
}

function mergeCandidates(rows) {
  const map = new Map()
  for (const row of rows) {
    const normalized = normalizePoi(row)
    if (!normalized) continue
    const key = normalized.id || `${normalized.name}:${normalized.address}`
    const existing = map.get(key)
    if (!existing) {
      map.set(key, normalized)
    } else {
      existing.sourceRefs.push(...normalized.sourceRefs)
      existing.rating = Math.max(existing.rating, normalized.rating)
      existing.cost = existing.cost || normalized.cost
    }
  }
  return [...map.values()]
}

function inferArea(candidate) {
  const text = `${candidate.name} ${candidate.address} ${candidate.businessArea}`
  if (/浙江大学|紫金港校区|校区|餐饮中心|食堂|银泉|澄月|临湖|麦思威/.test(text)) return '校内'
  if (/剑桥公社|剑桥/.test(text)) return '剑桥公社'
  if (/申花路|浙大紫金港店|紫金港店/.test(text)) return '紫金港东门'
  if (/余杭塘路|崇仁路|西溪天街|龙湖/.test(text)) return '紫金港南门'
  if (/池华街|墩祥街|紫萱路/.test(text)) return '紫金港北侧'
  if (candidate.distanceMeters <= 800) return '紫金港周边'
  return candidate.businessArea || candidate.adname || '紫金港周边'
}

function inferCuisine(candidate) {
  const text = `${candidate.name} ${candidate.type} ${candidate.tag}`
  if (/食堂|餐饮中心|银泉|澄月|临湖|麦思威/.test(text) && /浙江大学|紫金港|校区/.test(text)) return '校内食堂'
  if (/墨西哥|印度|韩国|日本|日料|寿司|东南亚|外国|西餐/.test(text)) return '异国简餐'
  if (/古茗|蜜雪冰城|爷爷不泡茶|厝内小眷村|奶茶|茶饮|饮品|冷饮/.test(text)) return '茶饮'
  if (/咖啡|Coffee|COFFEE/i.test(text)) return '咖啡'
  if (/甜品|蛋糕|面包|烘焙|糕点/.test(text)) return '甜品烘焙'
  if (/烧烤|烤肉|烤串|纸包鱼/.test(text)) return '烧烤烤肉'
  if (/火锅|冒菜|麻辣烫|串串/.test(text)) return '火锅麻辣烫'
  if (/面|粉|米线|馄饨|水饺|饺子|拉面/.test(text)) return '面食粉面'
  if (/汉堡|炸鸡|披萨/.test(text)) return '异国简餐'
  if (/小吃|快餐|简餐|盖浇饭|炒饭|炒粉/.test(text)) return '快餐小吃'
  return '中餐简餐'
}

function inferTags(candidate, cuisine, price) {
  const text = `${candidate.name} ${candidate.type} ${candidate.tag} ${cuisine}`
  const tags = []
  if (candidate.distanceMeters <= 900) tags.push('近')
  if (price <= 30) tags.push('实惠', '人均30内')
  else if (price <= 50) tags.push('人均50内')
  if (/浙江大学|紫金港校区|校区|食堂|餐饮中心|银泉|澄月|临湖|麦思威/.test(`${candidate.name} ${candidate.address}`)) tags.push('校内')
  if (/辣|川|湘|火锅|麻辣|串串|冒菜|烧烤/.test(text)) tags.push('辣')
  if (/咖啡|甜品|蛋糕|面包|奶茶|茶饮|西餐|墨西哥|印度|韩国|日本|拍照/.test(text)) tags.push('拍照')
  if (/咖啡/.test(text)) tags.push('咖啡')
  if (/甜品|蛋糕|面包|烘焙/.test(text)) tags.push('甜品')
  if (/奶茶|茶饮|饮品/.test(text)) tags.push('奶茶')
  if (/烧烤|烤肉|烤串/.test(text)) tags.push('烧烤')
  if (/火锅|冒菜|麻辣烫|串串/.test(text)) tags.push('火锅')
  if (/面|粉|米线|馄饨|水饺|饺子|拉面/.test(text)) tags.push('面食', '暖胃')
  if (/快餐|小吃|简餐|盖浇饭|炒饭|炒粉|汉堡|炸鸡/.test(text)) tags.push('快餐', '一人食')
  if (/食堂|中餐|家常|烤肉|火锅|烧烤|西餐|墨西哥|印度|韩国|日本/.test(text)) tags.push('聚餐')
  if (/夜宵|烧烤|烤串|火锅|酒吧|餐吧/.test(text)) tags.push('夜宵')
  if (/清真|兰州|新疆/.test(text)) tags.push('清真友好')
  if (/素|轻食|沙拉|咖啡|甜品/.test(text)) tags.push('轻负担')
  if (/外国|墨西哥|印度|韩国|日本|西餐|披萨/.test(text)) tags.push('异国料理')
  if (/食堂|餐饮中心/.test(text)) tags.push('食堂')
  if (!tags.includes('快餐') && price <= 35) tags.push('一人食')
  if (!tags.includes('下饭') && /中餐|家常|川|湘|炒|饭|烤肉|火锅/.test(text)) tags.push('下饭')
  return unique(tags).slice(0, 8)
}

function inferTaxonomy(candidate, tags, cuisine) {
  const text = `${candidate.name} ${candidate.type} ${candidate.tag} ${cuisine} ${tags.join(' ')}`
  const serviceModes = unique([
    tags.some((tag) => ['快餐', '一人食', '实惠', '人均30内', '轻负担'].includes(tag)) ? '外卖' : '',
    '堂食'
  ])
  const mealPeriods = unique([
    /咖啡|甜品|奶茶|面包|烘焙/.test(text) ? '下午茶' : '',
    /烧烤|烤肉|火锅|夜宵|餐吧/.test(text) ? '夜宵' : '',
    /早餐|包子|豆浆|粥|面包|咖啡/.test(text) ? '早餐' : '',
    '中餐',
    /聚餐|烤肉|火锅|烧烤|西餐|墨西哥|印度|餐厅/.test(text) ? '晚餐' : ''
  ])
  const scenarioTags = unique([
    tags.includes('一人食') || tags.includes('快餐') ? '一人食' : '',
    tags.includes('聚餐') ? '聚餐' : '',
    tags.includes('快餐') || tags.includes('近') ? '赶课快吃' : '',
    tags.includes('拍照') ? '约会拍照' : '',
    tags.includes('校内') || tags.includes('近') ? '懒得出校' : ''
  ])
  const constraintTags = unique([
    tags.includes('辣') ? '辣' : '',
    tags.includes('轻负担') ? '轻负担' : '',
    tags.includes('清真友好') ? '清真友好' : '',
    /烤肉|火锅|烧烤/.test(text) ? '大份' : ''
  ])
  const preferenceTags = unique([
    tags.includes('暖胃') ? '暖胃' : '',
    tags.includes('下饭') ? '下饭' : '',
    tags.includes('面食') ? '面食' : '',
    /小吃|烧烤|火锅|奶茶/.test(text) ? '小吃' : '',
    tags.includes('拍照') ? '拍照' : '',
    tags.includes('轻负担') ? '清爽' : '',
    tags.includes('快餐') ? '快餐' : '',
    tags.includes('实惠') ? '实惠' : '',
    tags.includes('咖啡') ? '咖啡' : '',
    tags.includes('甜品') ? '甜品' : ''
  ])
  return { serviceModes, mealPeriods, scenarioTags, constraintTags, preferenceTags }
}

function confidenceFor(candidate, tags) {
  let score = 0
  if (candidate.id) score += 0.25
  if (candidate.distanceMeters <= radiusMeters) score += 0.2
  if (candidate.address) score += 0.15
  if (candidate.type.includes('餐饮服务')) score += 0.15
  if (candidate.rating || candidate.cost) score += 0.1
  if (tags.length >= 2) score += 0.1
  if (candidate.sourceRefs.some((source) => source.query?.type === 'web_clue')) score += 0.05
  if (candidate.rating && candidate.rating < 3.2) score -= 0.12
  if (candidate.distanceMeters > radiusMeters) score -= 0.25
  if (!candidate.type.includes('餐饮服务')) score -= 0.2
  return Math.max(0, Math.min(1, Number(score.toFixed(2))))
}

function publishScoreFor(candidate, confidence) {
  const ratingScore = (candidate.rating || 3.8) * 6
  const distanceScore = Math.max(0, radiusMeters - candidate.distanceMeters) / 90
  const priceScore = candidate.cost ? Math.max(0, 90 - candidate.cost) / 4 : 8
  const sourceScore = candidate.sourceRefs.some((source) => source.query?.type === 'web_clue') ? 5 : 0
  return confidence * 100 + ratingScore + distanceScore + priceScore + sourceScore
}

function coverFor(tags, cuisine) {
  if (tags.includes('辣') || tags.includes('火锅')) return { icon: '辣', color: '#c84b35' }
  if (tags.includes('咖啡')) return { icon: '咖', color: '#8c6338' }
  if (tags.includes('甜品') || tags.includes('奶茶')) return { icon: '甜', color: '#d9915d' }
  if (tags.includes('面食')) return { icon: '面', color: '#6d8fbd' }
  if (tags.includes('烧烤')) return { icon: '烤', color: '#9b5a31' }
  if (tags.includes('校内') || cuisine === '校内食堂') return { icon: '校', color: '#4f8b65' }
  if (tags.includes('异国料理')) return { icon: '异', color: '#4d79b8' }
  return { icon: '饭', color: '#f0aa38' }
}

function buildReason(candidate, tags, confidence) {
  const ratingText = candidate.rating ? `高德显示评分 ${candidate.rating.toFixed(1)}` : '高德 POI 已验证'
  const priceText = candidate.cost ? `人均约 ¥${Math.round(candidate.cost)}` : '人均待学生补充'
  const tagsText = tags.slice(0, 3).join('、')
  return `公开信息整理：${ratingText}，${priceText}，距离紫金港约 ${(candidate.distanceMeters / 1000).toFixed(1)}km；当前标签为 ${tagsText}，置信度 ${confidence.toFixed(2)}。`
}

function buildSystemReview(restaurant, candidate) {
  const ratingText = candidate.rating ? `高德 POI 显示评分 ${candidate.rating.toFixed(1)}` : '高德 POI 已验证位置'
  const costText = candidate.cost ? `、人均约 ¥${Math.round(candidate.cost)}` : ''
  return {
    id: `rv_${restaurant.id}_internet`,
    restaurantId: restaurant.id,
    userName: '互联网小助手',
    text: `系统整理：${ratingText}${costText}，地址为${candidate.address || restaurant.area}。本条是公开信息整理，不代表学生实地体验。`,
    rating: candidate.rating ? Math.max(1, Math.min(5, Math.round(candidate.rating))) : 4,
    status: 'approved'
  }
}

function candidateToRestaurant(candidate, index) {
  const cuisine = inferCuisine(candidate)
  const price = candidate.cost ? Math.round(candidate.cost) : cuisine.includes('校内') ? 20 : cuisine.includes('茶饮') || cuisine.includes('咖啡') ? 25 : 35
  const tags = inferTags(candidate, cuisine, price)
  const confidence = confidenceFor(candidate, tags)
  const taxonomy = inferTaxonomy(candidate, tags, cuisine)
  const cover = coverFor(tags, cuisine)
  const id = `r${String(index + 1).padStart(3, '0')}`

  const restaurant = {
    id,
    name: candidate.name,
    area: inferArea(candidate),
    distance: Number((candidate.distanceMeters / 1000).toFixed(2)),
    walkMinutes: Math.max(2, Math.round(candidate.distanceMeters / 75)),
    cuisine,
    price,
    rating: candidate.rating ? Number(candidate.rating.toFixed(1)) : 4.2,
    studentScore: 0,
    checkins: 0,
    latitude: candidate.latitude,
    longitude: candidate.longitude,
    coverIcon: cover.icon,
    coverColor: cover.color,
    tags,
    suitedFor: unique([...taxonomy.scenarioTags, ...taxonomy.mealPeriods, ...taxonomy.preferenceTags]).slice(0, 6),
    serviceModes: taxonomy.serviceModes,
    mealPeriods: taxonomy.mealPeriods,
    scenarioTags: taxonomy.scenarioTags,
    constraintTags: taxonomy.constraintTags,
    preferenceTags: taxonomy.preferenceTags,
    reason: buildReason(candidate, tags, confidence),
    sourceRefs: candidate.sourceRefs,
    status: 'published',
    confidence
  }

  return { restaurant, review: buildSystemReview(restaurant, candidate), candidate }
}

function isGoodCandidate(candidate) {
  if (!candidate.name || !candidate.address) return false
  if (!candidate.type.includes('餐饮服务')) return false
  if (candidate.distanceMeters > radiusMeters) return false
  if (/停车场|公共厕所|厕所|入口|出口|充电|公司|学校|宿舍|银行|超市|堕落街|暂停营业|建设中/.test(candidate.name)) return false
  return true
}

function brandKey(name) {
  return String(name)
    .replace(/\(.*?\)|（.*?）/g, '')
    .replace(/浙江大学|浙大|紫金港|杭州|校区|店|旗舰/g, '')
    .split(/[·•\-—\s]/)[0]
    .slice(0, 8)
}

function diversifyScoredCandidates(scored) {
  const selected = []
  const cuisineCounts = new Map()
  const brandCounts = new Map()
  const cuisineLimit = 9
  const brandLimit = 3

  for (const item of scored) {
    const cuisine = inferCuisine(item.candidate)
    const brand = brandKey(item.candidate.name)
    if ((cuisineCounts.get(cuisine) || 0) >= cuisineLimit) continue
    if ((brandCounts.get(brand) || 0) >= brandLimit) continue
    selected.push(item)
    cuisineCounts.set(cuisine, (cuisineCounts.get(cuisine) || 0) + 1)
    brandCounts.set(brand, (brandCounts.get(brand) || 0) + 1)
    if (selected.length >= maxPublishedRestaurants) return selected
  }

  for (const item of scored) {
    if (selected.includes(item)) continue
    selected.push(item)
    if (selected.length >= maxPublishedRestaurants) return selected
  }

  return selected
}

async function main() {
  ensureDir(rawDir)
  ensureDir(processedDir)

  const aroundRows = await collectAroundPois()
  const clueRows = await collectWebCluePois()
  const merged = mergeCandidates([...aroundRows, ...clueRows]).filter(isGoodCandidate)
  const scored = merged
    .map((candidate) => {
      const cuisine = inferCuisine(candidate)
      const price = candidate.cost ? Math.round(candidate.cost) : 35
      const tags = inferTags(candidate, cuisine, price)
      const confidence = confidenceFor(candidate, tags)
      return { candidate, confidence, publishScore: publishScoreFor(candidate, confidence) }
    })
    .filter((item) => item.confidence >= minAutoPublishConfidence)
    .sort((a, b) => {
      if (b.publishScore !== a.publishScore) return b.publishScore - a.publishScore
      if (b.confidence !== a.confidence) return b.confidence - a.confidence
      if ((b.candidate.rating || 0) !== (a.candidate.rating || 0)) return (b.candidate.rating || 0) - (a.candidate.rating || 0)
      return a.candidate.distanceMeters - b.candidate.distanceMeters
    })

  const built = diversifyScoredCandidates(scored).map((item, index) => candidateToRestaurant(item.candidate, index))
  const restaurants = built.map((item) => {
    const { confidence, ...restaurant } = item.restaurant
    return restaurant
  })
  const reviews = built.map((item) => item.review)

  const rawPath = path.join(rawDir, `real_data_amap_${today}.json`)
  const processedPath = path.join(processedDir, `real_restaurant_candidates_${today}.json`)
  const reportPath = path.join(processedDir, `real_data_report_${today}.json`)

  fs.writeFileSync(rawPath, JSON.stringify({ aroundKeywords, webClues, rows: [...aroundRows, ...clueRows] }, null, 2))
  fs.writeFileSync(processedPath, JSON.stringify({ restaurants, reviews }, null, 2))
  fs.writeFileSync(reportPath, JSON.stringify({
    generatedAt: new Date().toISOString(),
    center,
    radiusMeters,
    rawRows: aroundRows.length + clueRows.length,
    uniqueCandidates: merged.length,
    autoPublished: restaurants.length,
    minAutoPublishConfidence,
    rejectedOrPending: Math.max(0, merged.length - restaurants.length),
    sources: {
      amapAroundRows: aroundRows.length,
      webClueRows: clueRows.length
    },
    sample: built.slice(0, 8).map((item) => ({
      id: item.restaurant.id,
      name: item.restaurant.name,
      confidence: item.restaurant.confidence,
      rating: item.restaurant.rating,
      price: item.restaurant.price,
      distance: item.restaurant.distance,
      tags: item.restaurant.tags,
      sourceTypes: unique(item.restaurant.sourceRefs.map((source) => source.query?.type || source.type))
    }))
  }, null, 2))

  console.log(JSON.stringify({
    rawPath: path.relative(root, rawPath),
    processedPath: path.relative(root, processedPath),
    reportPath: path.relative(root, reportPath),
    rawRows: aroundRows.length + clueRows.length,
    uniqueCandidates: merged.length,
    autoPublished: restaurants.length
  }, null, 2))
}

main().catch((error) => {
  console.error(error.message)
  process.exit(1)
})
