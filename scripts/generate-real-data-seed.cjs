const fs = require('fs')
const path = require('path')

const root = path.resolve(__dirname, '..')
const inputPath = path.resolve(root, process.argv[2] || 'seed/real-restaurants.json')
const outputPath = path.resolve(root, process.argv[3] || 'supabase/real-data-seed.sql')

function sqlString(value) {
  if (value === null || value === undefined) return 'null'
  return `'${String(value).replace(/'/g, "''")}'`
}

function sqlJson(value) {
  return `${sqlString(JSON.stringify(value || []))}::jsonb`
}

function sqlTextArray(value) {
  return `array[${(value || []).map(sqlString).join(', ')}]::text[]`
}

function assertNumber(name, value, min, max) {
  if (typeof value !== 'number' || Number.isNaN(value) || value < min || value > max) {
    throw new Error(`${name} must be a number between ${min} and ${max}`)
  }
}

function validateRestaurant(item) {
  for (const key of ['id', 'name', 'area', 'cuisine', 'reason']) {
    if (!item[key]) throw new Error(`restaurant missing ${key}`)
  }
  assertNumber(`${item.id}.distance`, item.distance, 0, 99)
  assertNumber(`${item.id}.walkMinutes`, item.walkMinutes, 0, 240)
  assertNumber(`${item.id}.price`, item.price, 1, 999)
  assertNumber(`${item.id}.rating`, item.rating, 0, 5)
  assertNumber(`${item.id}.studentScore`, item.studentScore, 0, 100)
  assertNumber(`${item.id}.latitude`, item.latitude, -90, 90)
  assertNumber(`${item.id}.longitude`, item.longitude, -180, 180)
  if (!Array.isArray(item.tags) || !item.tags.length) throw new Error(`${item.id}.tags required`)
  if (!Array.isArray(item.sourceRefs) || !item.sourceRefs.length) throw new Error(`${item.id}.sourceRefs required`)
  if (item.reason.length > 240) throw new Error(`${item.id}.reason should be an original short summary under 240 chars`)
}

function restaurantSql(item) {
  return `insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating,
  student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  ${sqlString(item.id)}, ${sqlString(item.name)}, ${sqlString(item.canonicalName || item.name)}, ${sqlTextArray(item.aliases)},
  ${sqlString(item.area)}, ${item.distance}, ${item.walkMinutes}, ${sqlString(item.cuisine)}, ${item.price}, ${item.rating},
  ${item.studentScore}, ${item.checkins || 0}, ${item.latitude}, ${item.longitude}, ${sqlString(item.coverIcon || '饭')}, ${sqlString(item.coverColor || '#f0aa38')},
  ${sqlTextArray(item.tags)}, ${sqlTextArray(item.suitedFor)}, ${sqlString(item.reason)}, ${sqlJson(item.sourceRefs)}, 'published'
) on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  aliases = excluded.aliases,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
  rating = excluded.rating,
  student_score = excluded.student_score,
  checkins = excluded.checkins,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  cover_icon = excluded.cover_icon,
  cover_color = excluded.cover_color,
  tags = excluded.tags,
  suited_for = excluded.suited_for,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;`
}

function dishSql(restaurantId, dish, index) {
  const id = dish.id || `${restaurantId}_d${String(index + 1).padStart(2, '0')}`
  return `insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  ${sqlString(id)}, ${sqlString(restaurantId)}, ${sqlString(dish.name)}, ${dish.price}, ${dish.heat || 60}, ${sqlTextArray(dish.tags)}, 'published'
) on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;`
}

function reviewSql(restaurantId, review, index) {
  const id = review.id || `${restaurantId}_rv${String(index + 1).padStart(2, '0')}`
  return `insert into public.reviews (id, restaurant_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  ${sqlString(id)}, ${sqlString(restaurantId)}, ${sqlString(review.displayNameSnapshot || '学生整理员')},
  ${sqlJson(review.avatarSnapshot || { type: 'preset', preset: 'rice', text: '饭', color: '#f0aa38' })},
  ${review.rating || 4}, ${sqlString(review.text)}, ${sqlTextArray(review.tags)}, 'approved'
) on conflict (id) do update set
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;`
}

if (!fs.existsSync(inputPath)) {
  throw new Error(`Missing ${path.relative(root, inputPath)}. Copy seed/real-restaurants.example.json to seed/real-restaurants.json first.`)
}

const data = JSON.parse(fs.readFileSync(inputPath, 'utf8'))
const restaurants = data.restaurants || []
if (!restaurants.length) throw new Error('restaurants array is empty')

const statements = [
  '-- Generated by scripts/generate-real-data-seed.cjs',
  '-- Review manually before running in Supabase SQL Editor.',
  'begin;'
]

for (const restaurant of restaurants) {
  validateRestaurant(restaurant)
  statements.push(restaurantSql(restaurant))
  ;(restaurant.dishes || []).forEach((dish, index) => statements.push(dishSql(restaurant.id, dish, index)))
  ;(restaurant.reviews || []).forEach((review, index) => statements.push(reviewSql(restaurant.id, review, index)))
}

statements.push('commit;')
fs.writeFileSync(outputPath, `${statements.join('\n\n')}\n`)
console.log(`wrote ${path.relative(root, outputPath)} with ${restaurants.length} restaurants`)
