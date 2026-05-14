const fs = require('fs')
const path = require('path')
const { createClient } = require('@supabase/supabase-js')

const root = path.resolve(__dirname, '..')
const reportPath = path.join(root, 'docs/data-audit/meal-period-audit-2026-05-14.md')
const envPath = path.join(root, '.env.local')
const PERIODS = ['早餐', '中餐', '下午茶', '晚餐', '夜宵']

function loadDotEnv() {
  if (!fs.existsSync(envPath)) return
  const text = fs.readFileSync(envPath, 'utf8')
  for (const line of text.split(/\r?\n/)) {
    const match = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/)
    if (!match || process.env[match[1]]) continue
    process.env[match[1]] = match[2].replace(/^['"]|['"]$/g, '')
  }
}

function normalizeTags(value) {
  return Array.isArray(value) ? value.filter((item) => typeof item === 'string' && item.trim()).map((item) => item.trim()) : []
}

function normalizeRestaurant(row) {
  return {
    id: row.id,
    name: row.name,
    area: row.area,
    cuisine: row.cuisine,
    tags: [
      ...normalizeTags(row.tags),
      ...normalizeTags(row.suitedFor || row.suited_for),
      ...normalizeTags(row.scenarioTags || row.scenario_tags),
      ...normalizeTags(row.constraintTags || row.constraint_tags),
      ...normalizeTags(row.preferenceTags || row.preference_tags)
    ],
    mealPeriods: normalizeTags(row.mealPeriods || row.meal_periods)
  }
}

function addAll(target, values) {
  for (const value of values) target.add(value)
}

function inferExpectedMealPeriods(restaurant) {
  const text = [restaurant.name, restaurant.area, restaurant.cuisine, ...restaurant.tags].join(' ')
  const expected = new Set()
  const reasons = []
  const isDrinkOrDessert = /奶茶|咖啡|甜品|蛋糕|茶饮|面包|烘焙|柠檬茶|果茶|饮品/.test(text)
  const hasNightSignal = /夜宵|深夜|通宵|24\s*h?|24小时|酒馆|烧烤|烤肉|烤串|炸串|火锅|麻辣烫|冒菜|串串/.test(text)

  if (/早餐|早饭|包子|豆浆|粥|油条|饭团|烧饼|馒头|煎饼/.test(text)) {
    expected.add('早餐')
    reasons.push('早餐关键词')
  }
  if (/食堂|餐厅|餐饮中心|快餐|盖饭|面馆|粉面|米线|馄饨|水饺|饺子|简餐|下饭|中餐/.test(text)) {
    addAll(expected, ['中餐', '晚餐'])
    reasons.push('正餐/食堂/快餐关键词')
  }
  if (/烧烤|烤肉|烤串|火锅|麻辣烫|冒菜|串串|炸串|夜宵|酒馆/.test(text) || (!isDrinkOrDessert && /小吃/.test(text))) {
    addAll(expected, ['晚餐', '夜宵'])
    reasons.push('晚餐夜宵关键词')
  }
  if (isDrinkOrDessert) {
    expected.add('下午茶')
    reasons.push('饮品甜点关键词')
    if (hasNightSignal) expected.add('夜宵')
  }
  if (/便利|全家|罗森|便利店|麦当劳|肯德基|全天|24/.test(text)) {
    addAll(expected, ['中餐', '晚餐', '夜宵'])
    reasons.push('全天候/便利类关键词')
  }

  for (const period of restaurant.mealPeriods) {
    if (PERIODS.includes(period)) expected.add(period)
  }

  if (!expected.size) expected.add('中餐')
  return { expected: PERIODS.filter((period) => expected.has(period)), reasons }
}

function auditRestaurants(source, restaurants) {
  return restaurants
    .map(normalizeRestaurant)
    .map((restaurant) => {
      const current = restaurant.mealPeriods
      const { expected, reasons } = inferExpectedMealPeriods(restaurant)
      const missing = expected.filter((period) => !current.includes(period))
      const needsReview = !current.length || (current.length === 1 && expected.length > 1) || missing.length > 0
      const confidenceText = [restaurant.name, restaurant.cuisine, ...restaurant.tags].join(' ')
      const strongSignals = /食堂|餐饮中心|快餐|盖饭|面馆|粉面|米线|馄饨|水饺|饺子|烧烤|火锅|麻辣烫|冒菜|串串|炸串|包子|豆浆|粥|油条|饭团|烧饼|麦当劳|肯德基|便利店|全天|24/.test(confidenceText)
      const softDrinkSignal = /奶茶|咖啡|甜品|蛋糕|茶饮|面包|烘焙|柠檬茶|果茶|饮品/.test(confidenceText)
      const confidence = strongSignals || (reasons.length >= 2 && !softDrinkSignal) ? '可自动建议' : '需人工确认'
      return { ...restaurant, source, expected, missing, reasons, confidence, needsReview }
    })
    .filter((item) => item.needsReview)
}

function loadSeedRestaurants() {
  const seed = JSON.parse(fs.readFileSync(path.join(root, 'seed/restaurants.json'), 'utf8'))
  return Array.isArray(seed.restaurants) ? seed.restaurants : seed
}

async function loadSupabaseRestaurants() {
  loadDotEnv()
  const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY
  if (!url || !key) return { skipped: '缺少 Supabase 只读连接配置。', restaurants: [] }

  const client = createClient(url, key, { auth: { persistSession: false } })
  const { data, error } = await client
    .from('restaurants')
    .select('id,name,area,cuisine,tags,suited_for,meal_periods,scenario_tags,constraint_tags,preference_tags,status')
    .eq('status', 'published')
    .limit(1000)

  if (error) return { skipped: error.message, restaurants: [] }
  return { skipped: '', restaurants: data || [] }
}

function renderReport(seedFindings, supabaseFindings, supabaseSkipped) {
  const allFindings = [...seedFindings, ...supabaseFindings]
  const autoFixable = allFindings.filter((item) => item.confidence === '可自动建议')
  const needsAdmin = allFindings.filter((item) => item.confidence !== '可自动建议')

  const rows = allFindings.slice(0, 120).map((item) => (
    `| ${item.source} | ${item.id} | ${item.name} | ${item.mealPeriods.join(' / ') || '缺失'} | ${item.expected.join(' / ')} | ${item.missing.join(' / ') || '无'} | ${item.confidence} | ${item.reasons.join('、') || '弱信号'} |`
  ))

  return `# 餐段多选审计报告

生成日期：2026-05-14

## 摘要

- 本地 seed 待检查：${seedFindings.length} 条。
- Supabase 待读取结果：${supabaseSkipped ? `跳过（${supabaseSkipped}）` : `${supabaseFindings.length} 条待检查`}。
- 可自动建议补充：${autoFixable.length} 条。
- 需要管理员确认：${needsAdmin.length} 条。

## 审计原则

- 餐段是多选维度，不是互斥标签。
- 食堂、餐饮中心、快餐、盖饭、面馆通常适合中餐 + 晚餐。
- 烧烤、火锅、小吃、炸串通常适合晚餐 + 夜宵。
- 奶茶、咖啡、甜品通常适合下午茶，出现夜间信号时再加入夜宵。
- 包子、粥、豆浆、早餐关键词通常适合早餐。
- 全天候或便利类餐饮可考虑中餐 + 晚餐 + 夜宵。

## 可执行建议

- 先由管理员审核“可自动建议”项，再批量补充到正式数据。
- “需人工确认”项只进入待办清单，不应自动改线上数据。
- 新投稿入库时优先使用 payload.mealPeriods；旧投稿缺失数组时再回退到 payload.mealPeriod。

## 待检查明细

| 来源 | ID | 餐厅 | 当前餐段 | 建议餐段 | 建议新增 | 处理建议 | 命中理由 |
| --- | --- | --- | --- | --- | --- | --- | --- |
${rows.length ? rows.join('\n') : '| - | - | 暂无 | - | - | - | - | - |'}
`
}

async function main() {
  const seedFindings = auditRestaurants('seed', loadSeedRestaurants())
  const supabaseResult = await loadSupabaseRestaurants()
  const supabaseFindings = auditRestaurants('supabase', supabaseResult.restaurants)
  const report = renderReport(seedFindings, supabaseFindings, supabaseResult.skipped)

  if (process.argv.includes('--write')) {
    fs.mkdirSync(path.dirname(reportPath), { recursive: true })
    fs.writeFileSync(reportPath, report)
    console.log(path.relative(root, reportPath))
  } else {
    console.log(report)
  }
}

main().catch((error) => {
  console.error(error)
  process.exit(1)
})
