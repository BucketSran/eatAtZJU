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
    lines.push(`insert into public.restaurants (`)
    lines.push('  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status')
    lines.push(') values (')
    lines.push(`  ${sqlString(restaurant.id)}, ${sqlString(restaurant.name)}, ${sqlString(restaurant.name)}, array[]::text[], ${sqlString(restaurant.area)}, ${sqlNumber(restaurant.distance)}, ${sqlNumber(restaurant.walkMinutes)}, ${sqlString(restaurant.cuisine)}, ${sqlNumber(restaurant.price)}, ${sqlNumber(restaurant.rating)}, ${sqlNumber(restaurant.studentScore)}, ${sqlNumber(restaurant.checkins)}, ${sqlNumber(restaurant.latitude)}, ${sqlNumber(restaurant.longitude)}, ${sqlString(restaurant.coverIcon)}, ${sqlString(restaurant.coverColor)}, ${sqlArray(restaurant.tags)}, ${sqlArray(restaurant.suitedFor)}, ${sqlString(restaurant.reason)}, ${sqlJson([{ type: 'demo_seed', path: 'seed/restaurants.json' }])}, ${sqlString(restaurant.status)}`)
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
