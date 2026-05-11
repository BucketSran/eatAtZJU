const { getMealContext } = require('./timeContext')

const LEADERBOARD_SPECS = [
  {
    id: 'breakfast',
    kind: 'daily',
    title: '早餐启动榜',
    description: '早八、晨课和起晚后的第一口，优先近、热乎、负担轻。',
    requiredTags: ['早餐'],
    excludeTags: ['夜宵', '晚餐'],
    tags: ['近', '实惠', '暖胃', '面食', '校内'],
    priorityTags: ['暖胃', '面食', '校内'],
    mealKeys: ['breakfast']
  },
  {
    id: 'lunch',
    kind: 'daily',
    title: '午饭速决榜',
    description: '中午别远征，优先近、快、预算友好，适合下课后 30 分钟内解决。',
    requiredTags: ['中餐'],
    excludeTags: ['夜宵', '下午茶', '咖啡', '奶茶', '甜品'],
    tags: ['近', '实惠', '快餐', '午餐快吃', '人均30内', '一人食'],
    priorityTags: ['快餐', '人均30内', '课间午餐'],
    mealKeys: ['lunch']
  },
  {
    id: 'dinner',
    kind: 'daily',
    title: '晚饭正餐榜',
    description: '晚饭更像一顿饭：下饭、堂食、聚餐和稍微改善都放这里。',
    requiredTags: ['晚餐'],
    excludeTags: ['早餐', '下午茶', '奶茶', '咖啡', '甜品'],
    tags: ['下饭', '聚餐', '晚饭改善', '晚餐聚餐', '火锅', '烧烤'],
    priorityTags: ['堂食', '下饭', '聚餐'],
    mealKeys: ['dinner']
  },
  {
    id: 'night',
    kind: 'daily',
    title: '夜宵快乐榜',
    description: '晚课、DDL、夜跑后的那口热乎和快乐碳水。',
    requiredTags: ['夜宵'],
    excludeTags: ['早餐'],
    tags: ['夜宵', '小吃', '暖胃', '烧烤', '奶茶'],
    mealKeys: ['night']
  },
  {
    id: 'delivery',
    kind: 'daily',
    title: '外卖友好榜',
    description: '懒得出门但不想踩雷，优先外卖、快餐、一人食和预算稳定。',
    requiredTags: ['外卖'],
    excludeTags: ['聚餐'],
    tags: ['快餐', '实惠', '一人食', '人均30内', '轻负担'],
    priorityTags: ['外卖', '快餐', '一人食']
  },
  {
    id: 'exam',
    kind: 'special',
    title: '考试周续命榜',
    description: '近、暖胃、不折腾，给复习日程留一点余量。',
    excludeTags: ['聚餐', '火锅', '烧烤'],
    tags: ['近', '暖胃', '一人食', '面食', '咖啡'],
    priorityTags: ['近', '一人食', '暖胃', '面食']
  },
  {
    id: 'festival',
    kind: 'special',
    title: '节日聚会榜',
    description: '生日、节日和朋友小聚，优先多人友好、堂食和更有仪式感的店。',
    excludeTags: ['早餐', '一人食', '快餐'],
    tags: ['聚餐', '火锅', '烧烤', '异国料理', '拍照'],
    priorityTags: ['聚餐', '堂食', '拍照']
  },
  {
    id: 'ambience',
    kind: 'special',
    title: '氛围感小坐榜',
    description: '适合聊天、拍照、湖边散步或下午坐一会儿，不和正餐硬混排。',
    excludeTags: ['夜宵', '快餐'],
    tags: ['拍照', '约会拍照', '咖啡', '甜品', '轻负担'],
    priorityTags: ['拍照', '下午茶', '轻负担'],
    mealKeys: ['afternoon']
  }
]

function hasAnyTag(restaurant, tags = []) {
  const haystack = [
    restaurant.area,
    restaurant.cuisine,
    ...(restaurant.tags || []),
    ...(restaurant.suitedFor || []),
    ...(restaurant.serviceModes || []),
    ...(restaurant.mealPeriods || []),
    ...(restaurant.scenarioTags || []),
    ...(restaurant.constraintTags || []),
    ...(restaurant.preferenceTags || [])
  ].join(' ')
  return tags.some(tag => haystack.includes(tag))
}

function hasAllTags(restaurant, tags = []) {
  return tags.every(tag => hasAnyTag(restaurant, [tag]))
}

function matchesBoardSpec(restaurant, spec) {
  if (spec.requiredTags && spec.requiredTags.length && !hasAllTags(restaurant, spec.requiredTags)) return false
  if (spec.excludeTags && spec.excludeTags.length && hasAnyTag(restaurant, spec.excludeTags)) return false
  return !spec.tags || hasAnyTag(restaurant, spec.tags)
}

function scoreForBoard(restaurant, spec, mealContext) {
  const tagHits = (spec.tags || []).filter(tag => hasAnyTag(restaurant, [tag])).length
  const priorityHits = (spec.priorityTags || []).filter(tag => hasAnyTag(restaurant, [tag])).length
  const requiredHits = (spec.requiredTags || []).filter(tag => hasAnyTag(restaurant, [tag])).length
  const mealBoost = spec.mealKeys && spec.mealKeys.includes(mealContext.key) ? 28 : 0
  const baseScore = (restaurant.recommendationScore || 0) + restaurant.rating * 8 + restaurant.studentScore * 0.25
  const deliveryBoost = spec.id === 'delivery' && hasAnyTag(restaurant, ['外卖']) ? 10 : 0
  return Math.round(baseScore + tagHits * 18 + priorityHits * 8 + requiredHits * 10 + mealBoost + deliveryBoost)
}

function buildLeaderboards(restaurants = [], options = {}) {
  const mealContext = options.mealContext || getMealContext()
  const specOrder = new Map(LEADERBOARD_SPECS.map((spec, index) => [spec.id, index]))
  const boards = LEADERBOARD_SPECS.map(spec => {
    const ranked = restaurants
      .filter(restaurant => matchesBoardSpec(restaurant, spec))
      .map(restaurant => ({
        ...restaurant,
        boardScore: scoreForBoard(restaurant, spec, mealContext)
      }))
      .sort((a, b) => b.boardScore - a.boardScore)
      .slice(0, options.limit || 6)

    return {
      id: spec.id,
      kind: spec.kind,
      title: spec.title,
      description: spec.description,
      isTimePriority: Boolean(spec.mealKeys && spec.mealKeys.includes(mealContext.key)),
      restaurants: ranked
    }
  })

  return boards.sort((a, b) => {
    const timePriority = Number(b.isTimePriority) - Number(a.isTimePriority)
    if (timePriority) return timePriority
    const kindPriority = Number(a.kind === 'special') - Number(b.kind === 'special')
    if (kindPriority) return kindPriority
    return (specOrder.get(a.id) || 0) - (specOrder.get(b.id) || 0)
  })
}

module.exports = {
  LEADERBOARD_SPECS,
  buildLeaderboards
}
