const fs = require('fs')
const path = require('path')

const root = path.resolve(__dirname, '..')
const outputPath = path.join(root, 'supabase', 'seed.sql')

function readJson(relativePath) {
  return JSON.parse(fs.readFileSync(path.join(root, relativePath), 'utf8'))
}

function sqlString(value) {
  if (value === null || value === undefined) return 'null'
  return `'${String(value).replace(/'/g, "''")}'`
}

function sqlNumber(value) {
  if (typeof value !== 'number' || !Number.isFinite(value)) throw new Error(`Invalid number: ${value}`)
  return String(value)
}

function sqlArray(values) {
  if (!Array.isArray(values)) return 'array[]::text[]'
  if (!values.length) return 'array[]::text[]'
  return `array[${values.map(sqlString).join(', ')}]::text[]`
}

function sqlJson(value) {
  return `${sqlString(JSON.stringify(value))}::jsonb`
}

function hasAny(values, candidates) {
  const text = values.join(' ')
  return candidates.some((candidate) => text.includes(candidate))
}

function deriveTaxonomy(restaurant) {
  const values = [restaurant.area, restaurant.cuisine, ...(restaurant.tags || []), ...(restaurant.suitedFor || [])]
  const pick = (entries) => entries.filter((entry) => hasAny(values, entry.matches)).map((entry) => entry.label)

  return {
    serviceModes: pick([
      { label: '外卖', matches: ['快餐', '一人食', '实惠', '人均30内', '轻负担', '快速解决', '单人吃饭', '懒得出校', '赶时间'] },
      { label: '堂食', matches: ['校内', '聚餐', '下饭', '拍照', '暖胃', '清真友好', '多人拼桌', '多人约饭', '四人聚餐', '拍照打卡'] }
    ]),
    mealPeriods: pick([
      { label: '早餐', matches: ['暖胃', '面食', '校内', '近', '清真友好', '雨天热汤', '雨天热饭'] },
      { label: '中餐', matches: ['快餐', '实惠', '一人食', '校内', '人均30内', '午餐快吃', '课间午餐', '赶课午餐', '赶课午饭'] },
      { label: '下午茶', matches: ['咖啡', '甜品', '拍照', '轻负担', '下午自习', '拍照打卡', '嘴馋'] },
      { label: '晚餐', matches: ['聚餐', '下饭', '辣', '人均50内', '晚饭快吃', '晚饭改善', '晚餐聚餐', '重口晚饭'] },
      { label: '夜宵', matches: ['夜宵', '小吃', '暖胃', '晚归加餐', '夜跑后'] }
    ]),
    scenarioTags: pick([
      { label: '一人食', matches: ['一人食', '一个人', '单人吃饭', '独自觅食', '独处放空'] },
      { label: '聚餐', matches: ['聚餐', '多人拼桌', '多人约饭', '四人聚餐', '三五好友', '两人小聚'] },
      { label: '赶课快吃', matches: ['快餐', '赶课午餐', '赶课午饭', '课间午餐', '快速解决', '赶时间'] },
      { label: '自习后', matches: ['晚自习前', '下午自习', '晚课后'] },
      { label: '约会拍照', matches: ['拍照', '拍照打卡', '轻约会'] },
      { label: '运动后', matches: ['轻负担', '健身后', '夜跑后'] },
      { label: '懒得出校', matches: ['校内', '近', '懒得出校'] }
    ]),
    constraintTags: pick([
      { label: '辣', matches: ['辣', '微辣', '想吃辣', '重口晚饭'] },
      { label: '不辣', matches: ['不辣', '不想吃辣', '清淡晚饭'] },
      { label: '轻负担', matches: ['轻负担', '不想太油', '健身后'] },
      { label: '大份', matches: ['大份', '想吃大份', '大份下饭'] },
      { label: '快乐碳水', matches: ['快乐碳水'] },
      { label: '清真友好', matches: ['清真友好'] }
    ]),
    preferenceTags: pick([
      { label: '暖胃', matches: ['暖胃', '雨天热汤', '雨天热饭'] },
      { label: '下饭', matches: ['下饭', '大份下饭'] },
      { label: '面食', matches: ['面食', '面', '粉'] },
      { label: '小吃', matches: ['小吃'] },
      { label: '拍照', matches: ['拍照', '拍照打卡'] },
      { label: '清爽', matches: ['清爽', '清爽午餐', '清爽汤粉'] },
      { label: '快餐', matches: ['快餐', '快速解决'] },
      { label: '实惠', matches: ['实惠', '预算友好', '人均30内'] }
    ])
  }
}

function buildSeedSql() {
  const restaurants = readJson('seed/restaurants.json').restaurants
  const dishes = readJson('seed/dishes.json').dishes
  const reviews = readJson('seed/reviews.json').reviews

  const lines = [
    '-- Generated from seed/*.json by scripts/generate-supabase-seed.cjs.',
    '-- Re-run `npm run seed:sql:write` after editing seed JSON.',
    'begin;',
    ''
  ]

  for (const restaurant of restaurants) {
    const taxonomy = deriveTaxonomy(restaurant)
    lines.push(`insert into public.restaurants (`)
    lines.push('  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status')
    lines.push(') values (')
    lines.push(`  ${sqlString(restaurant.id)}, ${sqlString(restaurant.name)}, ${sqlString(restaurant.name)}, array[]::text[], ${sqlString(restaurant.area)}, ${sqlNumber(restaurant.distance)}, ${sqlNumber(restaurant.walkMinutes)}, ${sqlString(restaurant.cuisine)}, ${sqlNumber(restaurant.price)}, ${sqlNumber(restaurant.rating)}, ${sqlNumber(restaurant.studentScore)}, ${sqlNumber(restaurant.checkins)}, ${sqlNumber(restaurant.latitude)}, ${sqlNumber(restaurant.longitude)}, ${sqlString(restaurant.coverIcon)}, ${sqlString(restaurant.coverColor)}, ${sqlArray(restaurant.tags)}, ${sqlArray(restaurant.suitedFor)}, ${sqlArray(taxonomy.serviceModes)}, ${sqlArray(taxonomy.mealPeriods)}, ${sqlArray(taxonomy.scenarioTags)}, ${sqlArray(taxonomy.constraintTags)}, ${sqlArray(taxonomy.preferenceTags)}, ${sqlString(restaurant.reason)}, ${sqlJson([{ type: 'demo_seed', path: 'seed/restaurants.json' }])}, ${sqlString(restaurant.status)}`)
    lines.push(')')
    lines.push('on conflict (id) do update set')
    lines.push('  name = excluded.name,')
    lines.push('  canonical_name = excluded.canonical_name,')
    lines.push('  area = excluded.area,')
    lines.push('  distance = excluded.distance,')
    lines.push('  walk_minutes = excluded.walk_minutes,')
    lines.push('  cuisine = excluded.cuisine,')
    lines.push('  price = excluded.price,')
    lines.push('  rating = excluded.rating,')
    lines.push('  student_score = excluded.student_score,')
    lines.push('  checkins = excluded.checkins,')
    lines.push('  latitude = excluded.latitude,')
    lines.push('  longitude = excluded.longitude,')
    lines.push('  cover_icon = excluded.cover_icon,')
    lines.push('  cover_color = excluded.cover_color,')
    lines.push('  tags = excluded.tags,')
    lines.push('  suited_for = excluded.suited_for,')
    lines.push('  service_modes = excluded.service_modes,')
    lines.push('  meal_periods = excluded.meal_periods,')
    lines.push('  scenario_tags = excluded.scenario_tags,')
    lines.push('  constraint_tags = excluded.constraint_tags,')
    lines.push('  preference_tags = excluded.preference_tags,')
    lines.push('  reason = excluded.reason,')
    lines.push('  source_refs = excluded.source_refs,')
    lines.push('  status = excluded.status;')
    lines.push('')
  }

  for (const dish of dishes) {
    lines.push('insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (')
    lines.push(`  ${sqlString(dish.id)}, ${sqlString(dish.restaurantId)}, ${sqlString(dish.name)}, ${sqlNumber(dish.price)}, ${sqlNumber(dish.heat)}, array[]::text[], ${sqlString(dish.status)}`)
    lines.push(')')
    lines.push('on conflict (id) do update set')
    lines.push('  restaurant_id = excluded.restaurant_id,')
    lines.push('  name = excluded.name,')
    lines.push('  price = excluded.price,')
    lines.push('  heat = excluded.heat,')
    lines.push('  tags = excluded.tags,')
    lines.push('  status = excluded.status;')
    lines.push('')
  }

  for (const review of reviews) {
    lines.push('insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (')
    lines.push(`  ${sqlString(review.id)}, ${sqlString(review.restaurantId)}, null, ${sqlString(review.userName)}, ${sqlNumber(review.rating)}, ${sqlString(review.text)}, array[]::text[], ${sqlString(review.status)}`)
    lines.push(')')
    lines.push('on conflict (id) do update set')
    lines.push('  restaurant_id = excluded.restaurant_id,')
    lines.push('  display_name_snapshot = excluded.display_name_snapshot,')
    lines.push('  rating = excluded.rating,')
    lines.push('  text = excluded.text,')
    lines.push('  tags = excluded.tags,')
    lines.push('  status = excluded.status;')
    lines.push('')
  }

  lines.push('commit;')
  lines.push('')
  return lines.join('\n')
}

const sql = buildSeedSql()
if (process.argv.includes('--write')) {
  fs.writeFileSync(outputPath, sql)
  console.log(`wrote ${path.relative(root, outputPath)}`)
} else if (process.argv.includes('--check')) {
  const current = fs.existsSync(outputPath) ? fs.readFileSync(outputPath, 'utf8') : ''
  if (current !== sql) {
    console.error('supabase/seed.sql is out of date. Run `npm run seed:sql:write`.')
    process.exit(1)
  }
  console.log('seed sql ok')
} else {
  process.stdout.write(sql)
}
