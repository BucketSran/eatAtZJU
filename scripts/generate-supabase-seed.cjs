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

function inferCampusLabel(restaurant) {
  if (restaurant.campusLabel) return restaurant.campusLabel
  const campus = ['紫金港', '玉泉', '西溪', '华家池', '之江', '海宁'].find((label) => {
    const values = [restaurant.area, restaurant.reason, ...(restaurant.tags || []), ...(restaurant.suitedFor || [])]
    return values.some((value) => String(value || '').includes(label))
  })
  return campus || null
}

function campusKeyFor(label) {
  return {
    紫金港: 'zijingang',
    玉泉: 'yuquan',
    西溪: 'xixi',
    华家池: 'huajiachi',
    之江: 'zhijiang',
    海宁: 'haining'
  }[label] || null
}

function hasAny(values, candidates) {
  const text = values.join(' ')
  return candidates.some((candidate) => text.includes(candidate))
}

function deriveTaxonomy(restaurant) {
  if (
    Array.isArray(restaurant.serviceModes) &&
    Array.isArray(restaurant.mealPeriods) &&
    Array.isArray(restaurant.scenarioTags) &&
    Array.isArray(restaurant.constraintTags) &&
    Array.isArray(restaurant.preferenceTags)
  ) {
    return {
      serviceModes: restaurant.serviceModes,
      mealPeriods: restaurant.mealPeriods,
      scenarioTags: restaurant.scenarioTags,
      constraintTags: restaurant.constraintTags,
      preferenceTags: restaurant.preferenceTags
    }
  }

  const values = [restaurant.area, restaurant.cuisine, ...(restaurant.tags || []), ...(restaurant.suitedFor || [])]
  const pick = (entries) => entries.filter((entry) => hasAny(values, entry.matches)).map((entry) => entry.label)

  return {
    serviceModes: pick([
      { label: '外卖', matches: ['快餐', '一人食', '实惠', '人均30内', '轻负担', '快速解决', '单人吃饭', '懒得出校', '赶时间', '奶茶', '咖啡', '甜品'] },
      { label: '堂食', matches: ['校内', '食堂', '聚餐', '下饭', '拍照', '暖胃', '清真友好', '多人拼桌', '多人约饭', '四人聚餐', '拍照打卡', '烧烤', '火锅', '异国料理'] }
    ]),
    mealPeriods: pick([
      { label: '早餐', matches: ['暖胃', '面食', '校内', '近', '清真友好', '雨天热汤', '雨天热饭'] },
      { label: '中餐', matches: ['快餐', '实惠', '一人食', '校内', '人均30内', '午餐快吃', '课间午餐', '赶课午餐', '赶课午饭'] },
      { label: '下午茶', matches: ['咖啡', '甜品', '奶茶', '拍照', '轻负担', '下午自习', '拍照打卡', '嘴馋'] },
      { label: '晚餐', matches: ['聚餐', '下饭', '辣', '火锅', '烧烤', '人均50内', '晚饭快吃', '晚饭改善', '晚餐聚餐', '重口晚饭'] },
      { label: '夜宵', matches: ['夜宵', '小吃', '烧烤', '火锅', '奶茶', '暖胃', '晚归加餐', '夜跑后'] }
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
      { label: '实惠', matches: ['实惠', '预算友好', '人均30内'] },
      { label: '咖啡', matches: ['咖啡'] },
      { label: '甜品', matches: ['甜品'] },
      { label: '奶茶', matches: ['奶茶', '茶饮'] },
      { label: '烧烤', matches: ['烧烤'] },
      { label: '火锅', matches: ['火锅', '麻辣烫'] },
      { label: '异国料理', matches: ['异国料理', '异国简餐'] },
      { label: '食堂', matches: ['食堂', '校内食堂'] }
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
    '',
    "delete from public.dishes where id ~ '^d[0-9]{5}$';",
    "delete from public.reviews where id ~ '^rv[0-9]{5}$';",
    `update public.restaurants set status = 'archived' where id ~ '^r[0-9]+$' and id not in (${restaurants.map((restaurant) => sqlString(restaurant.id)).join(', ')});`,
    ''
  ]

  for (const restaurant of restaurants) {
    const taxonomy = deriveTaxonomy(restaurant)
    const campusLabel = inferCampusLabel(restaurant)
    const campusKey = restaurant.campusKey || campusKeyFor(campusLabel)
    const campusDistance = typeof restaurant.campusDistance === 'number' ? restaurant.campusDistance : restaurant.distance
    lines.push(`insert into public.restaurants (`)
    lines.push('  id, name, canonical_name, aliases, campus_key, campus_label, campus_distance, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status')
    lines.push(') values (')
    lines.push(`  ${sqlString(restaurant.id)}, ${sqlString(restaurant.name)}, ${sqlString(restaurant.name)}, array[]::text[], ${sqlString(campusKey)}, ${sqlString(campusLabel)}, ${sqlNumber(campusDistance)}, ${sqlString(restaurant.area)}, ${sqlNumber(restaurant.distance)}, ${sqlNumber(restaurant.walkMinutes)}, ${sqlString(restaurant.cuisine)}, ${sqlNumber(restaurant.price)}, ${sqlNumber(restaurant.rating)}, ${sqlNumber(restaurant.studentScore)}, ${sqlNumber(restaurant.checkins)}, ${sqlNumber(restaurant.latitude)}, ${sqlNumber(restaurant.longitude)}, ${sqlString(restaurant.coverIcon)}, ${sqlString(restaurant.coverColor)}, ${sqlArray(restaurant.tags)}, ${sqlArray(restaurant.suitedFor)}, ${sqlArray(taxonomy.serviceModes)}, ${sqlArray(taxonomy.mealPeriods)}, ${sqlArray(taxonomy.scenarioTags)}, ${sqlArray(taxonomy.constraintTags)}, ${sqlArray(taxonomy.preferenceTags)}, ${sqlString(restaurant.reason)}, ${sqlJson(restaurant.sourceRefs && restaurant.sourceRefs.length ? restaurant.sourceRefs : [{ type: 'seed', path: 'seed/restaurants.json' }])}, ${sqlString(restaurant.status)}`)
    lines.push(')')
    lines.push('on conflict (id) do update set')
    lines.push('  name = excluded.name,')
    lines.push('  canonical_name = excluded.canonical_name,')
    lines.push('  campus_key = excluded.campus_key,')
    lines.push('  campus_label = excluded.campus_label,')
    lines.push('  campus_distance = excluded.campus_distance,')
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
    lines.push('insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (')
    lines.push(`  ${sqlString(review.id)}, ${sqlString(review.restaurantId)}, null, ${sqlString(review.userName)}, ${sqlJson(review.avatarSnapshot || { type: 'preset', preset: 'rice', text: '搜', color: '#2f7df6' })}, ${sqlNumber(review.rating)}, ${sqlString(review.text)}, ${sqlArray(review.tags || [])}, ${sqlString(review.status)}`)
    lines.push(')')
    lines.push('on conflict (id) do update set')
    lines.push('  restaurant_id = excluded.restaurant_id,')
    lines.push('  display_name_snapshot = excluded.display_name_snapshot,')
    lines.push('  avatar_snapshot = excluded.avatar_snapshot,')
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
