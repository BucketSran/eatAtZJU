const fs = require('fs')
const path = require('path')
const { spawnSync } = require('child_process')

const root = path.resolve(__dirname, '..')

function walk(dir, matcher, acc = []) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (entry.name === '.git' || entry.name === 'node_modules' || entry.name === 'miniprogram_npm') continue
    const fullPath = path.join(dir, entry.name)
    if (entry.isDirectory()) walk(fullPath, matcher, acc)
    else if (matcher(fullPath)) acc.push(fullPath)
  }
  return acc
}

function run(command, args) {
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8' })
  if (result.status !== 0) {
    process.stderr.write(result.stdout)
    process.stderr.write(result.stderr)
    process.exit(result.status || 1)
  }
}

function checkJavaScript() {
  for (const file of walk(root, file => file.endsWith('.js'))) {
    run(process.execPath, ['--check', file])
  }
}

function checkJson() {
  for (const file of walk(root, file => file.endsWith('.json'))) {
    JSON.parse(fs.readFileSync(file, 'utf8'))
  }
}

function checkRestaurantData() {
  global.wx = {
    getStorageSync(key) {
      if (key === 'eatAtZjuFavorites') return ['r001']
      if (key === 'eatAtZjuPreferences') return ['近', '实惠', '辣']
      return null
    },
    setStorageSync() {}
  }

  const { restaurants, tasteTags, priceRanges } = require('../data/restaurants')
  const service = require('../services/restaurantService')

  const ids = new Set()
  for (const restaurant of restaurants) {
    const required = ['id', 'name', 'area', 'distance', 'walkMinutes', 'cuisine', 'price', 'rating', 'studentScore', 'checkins', 'latitude', 'longitude', 'tags', 'menu', 'comments']
    for (const key of required) {
      if (restaurant[key] === undefined || restaurant[key] === null || restaurant[key] === '') {
        throw new Error(`restaurant ${restaurant.id || restaurant.name || '<unknown>'} missing ${key}`)
      }
    }
    if (ids.has(restaurant.id)) throw new Error(`duplicate restaurant id: ${restaurant.id}`)
    ids.add(restaurant.id)
    if (!Array.isArray(restaurant.tags) || !restaurant.tags.length) throw new Error(`${restaurant.id} missing tags`)
    if (!Array.isArray(restaurant.menu) || !restaurant.menu.length) throw new Error(`${restaurant.id} missing menu`)
    if (restaurant.rating < 1 || restaurant.rating > 5) throw new Error(`${restaurant.id} rating out of range`)
    if (restaurant.price <= 0) throw new Error(`${restaurant.id} invalid price`)
  }

  if (!tasteTags.includes('全部')) throw new Error('tasteTags must include 全部')
  if (!priceRanges.length) throw new Error('priceRanges must not be empty')

  const filtered = service.listRestaurants({ tag: '实惠' }, ['近', '实惠', '辣'])
  if (!filtered.length) throw new Error('expected filtered restaurants')
  if (!service.getRestaurant('r001').isFavorite) throw new Error('favorite decoration failed')
  if (!service.randomRestaurant({}, ['近'])) throw new Error('random restaurant failed')
  if (service.getMarkers().length !== restaurants.length) throw new Error('marker count mismatch')
}

checkJavaScript()
checkJson()
checkRestaurantData()
console.log('check ok')
