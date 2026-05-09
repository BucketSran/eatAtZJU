import { getMealContext, type MealContext } from '../lib/timeContext'
import type { RecommendationContext, RestaurantSummary } from '../types'
import { listRestaurants } from './restaurantService'

export type LeaderboardKey = 'lunch' | 'dinner' | 'night' | 'delivery' | 'qizhen' | 'exam'

export type Leaderboard = {
  description: string
  id: LeaderboardKey
  isTimePriority: boolean
  restaurants: RestaurantSummary[]
  title: string
}

type LeaderboardSpec = {
  description: string
  id: LeaderboardKey
  mealKeys?: MealContext['key'][]
  tags: string[]
  title: string
}

const leaderboardSpecs: LeaderboardSpec[] = [
  {
    id: 'lunch',
    title: '午饭速决榜',
    description: '近、快、实惠，适合下课后 30 分钟内解决。',
    tags: ['近', '实惠', '快餐', '校内'],
    mealKeys: ['lunch']
  },
  {
    id: 'dinner',
    title: '晚饭改善榜',
    description: '更下饭、更适合约饭，给一天收个漂亮尾。',
    tags: ['聚餐', '下饭', '辣'],
    mealKeys: ['dinner']
  },
  {
    id: 'night',
    title: '夜宵快乐榜',
    description: '晚课、DDL、夜跑后的那口热乎和快乐碳水。',
    tags: ['夜宵', '小吃', '实惠'],
    mealKeys: ['night']
  },
  {
    id: 'delivery',
    title: '外卖友好榜',
    description: '包装稳定、出餐快，适合懒得出门但不想踩雷。',
    tags: ['快餐', '实惠', '一人食']
  },
  {
    id: 'qizhen',
    title: '启真湖散步榜',
    description: '吃完可以走走，适合轻食、甜点和湖边消食。',
    tags: ['不辣', '甜品', '拍照', '轻负担'],
    mealKeys: ['afternoon']
  },
  {
    id: 'exam',
    title: '考试周续命榜',
    description: '近、暖胃、不折腾，给复习日程留一点余量。',
    tags: ['近', '暖胃', '一人食', '面食'],
    mealKeys: ['breakfast', 'night']
  }
]

function hasAnyTag(restaurant: RestaurantSummary, tags: string[]) {
  const haystack = [restaurant.area, restaurant.cuisine, ...restaurant.tags, ...restaurant.suitedFor].join(' ')
  return tags.some((tag) => haystack.includes(tag))
}

function scoreForBoard(restaurant: RestaurantSummary, spec: LeaderboardSpec, mealContext: MealContext) {
  const tagHits = spec.tags.filter((tag) => hasAnyTag(restaurant, [tag])).length
  const mealBoost = spec.mealKeys?.includes(mealContext.key) ? 28 : 0
  const deliveryBoost = spec.id === 'delivery' && restaurant.distance <= 1.5 ? 8 : 0
  const baseScore = (restaurant.recommendationScore ?? 0) + restaurant.rating * 8 + restaurant.studentScore * 0.25
  return Math.round(baseScore + tagHits * 18 + mealBoost + deliveryBoost)
}

export function getLeaderboards(context?: Partial<RecommendationContext>, limit = 6, mealContext = getMealContext()): Leaderboard[] {
  const all = listRestaurants({}, context)

  return leaderboardSpecs
    .map((spec) => {
      const restaurants = all
        .filter((restaurant) => hasAnyTag(restaurant, spec.tags))
        .map((restaurant) => ({ ...restaurant, boardScore: scoreForBoard(restaurant, spec, mealContext) }))
        .sort((a, b) => (b.boardScore ?? 0) - (a.boardScore ?? 0))
        .slice(0, limit)

      return {
        id: spec.id,
        title: spec.title,
        description: spec.description,
        isTimePriority: Boolean(spec.mealKeys?.includes(mealContext.key)),
        restaurants
      }
    })
    .sort((a, b) => Number(b.isTimePriority) - Number(a.isTimePriority))
}
