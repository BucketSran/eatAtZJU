const fs = require('fs')
const path = require('path')

const root = path.resolve(__dirname, '..')
const processedDir = path.join(root, 'data', 'processed')
const inputPath = process.argv[2]
  ? path.resolve(root, process.argv[2])
  : latestProcessedPath()

function latestProcessedPath() {
  const files = fs
    .readdirSync(processedDir)
    .filter((file) => /^real_restaurant_candidates_\d{8}\.json$/.test(file))
    .sort()
  if (!files.length) throw new Error('No processed real restaurant candidate file found')
  return path.join(processedDir, files[files.length - 1])
}

function unique(values) {
  return [...new Set(values.filter(Boolean))]
}

function writeJson(relativePath, value) {
  fs.writeFileSync(path.join(root, relativePath), `${JSON.stringify(value, null, 2)}\n`)
}

function normalizeReview(review) {
  return {
    ...review,
    userName: '互联网小助手',
    avatarSnapshot: {
      type: 'preset',
      preset: 'rice',
      text: '搜',
      color: '#2f7df6'
    },
    tags: unique([...(review.tags || []), '系统整理', '公开信息'])
  }
}

const data = JSON.parse(fs.readFileSync(inputPath, 'utf8'))
const restaurants = data.restaurants || []
const reviews = (data.reviews || []).map(normalizeReview)

if (!restaurants.length) throw new Error(`${path.relative(root, inputPath)} has no restaurants`)
if (restaurants.length !== reviews.length) {
  throw new Error(`restaurant/review count mismatch: ${restaurants.length}/${reviews.length}`)
}

const tasteTags = unique([
  '全部',
  '近',
  '实惠',
  '辣',
  '不辣',
  '夜宵',
  '一人食',
  '聚餐',
  '校内',
  '面食',
  '暖胃',
  '下饭',
  '快餐',
  '拍照',
  '轻负担',
  '清真友好',
  '咖啡',
  '甜品',
  '奶茶',
  '烧烤',
  '火锅',
  '食堂',
  '异国料理'
])

writeJson('seed/restaurants.json', {
  schemaVersion: 1,
  restaurants,
  tasteTags,
  priceRanges: [
    { label: '不限', min: 0, max: 999 },
    { label: '30以内', min: 0, max: 30 },
    { label: '30-50', min: 31, max: 50 },
    { label: '50+', min: 51, max: 999 }
  ]
})

writeJson('seed/dishes.json', {
  schemaVersion: 1,
  dishes: []
})

writeJson('seed/reviews.json', {
  schemaVersion: 1,
  reviews
})

console.log(JSON.stringify({
  input: path.relative(root, inputPath),
  restaurants: restaurants.length,
  dishes: 0,
  reviews: reviews.length,
  note: 'seed/dishes.json intentionally emptied until dish-level public sources or UGC approvals are available'
}, null, 2))
