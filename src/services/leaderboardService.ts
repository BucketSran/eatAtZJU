import type { RecommendationContext, RestaurantSummary } from '../types'
import { listRestaurants } from './restaurantService'

export type LeaderboardKey = 'hot' | 'budget' | 'night' | 'solo' | 'party'

export type Leaderboard = {
  description: string
  id: LeaderboardKey
  restaurants: RestaurantSummary[]
  title: string
}

const leaderboardSpecs: Array<{ id: LeaderboardKey; title: string; description: string; tag?: string; sort?: (restaurants: RestaurantSummary[]) => RestaurantSummary[] }> = [
  {
    id: 'hot',
    title: '本周热吃',
    description: '按学生可信分、评分和打卡量综合排序。',
    sort: (restaurants) => [...restaurants].sort((a, b) => b.studentScore + b.checkins / 20 + b.rating * 10 - (a.studentScore + a.checkins / 20 + a.rating * 10))
  },
  {
    id: 'budget',
    title: '30 元以内',
    description: '预算友好，适合日常高频吃。',
    sort: (restaurants) => restaurants.filter((restaurant) => restaurant.price <= 30).sort((a, b) => (b.recommendationScore ?? 0) - (a.recommendationScore ?? 0))
  },
  {
    id: 'night',
    title: '夜宵续命',
    description: '晚课、DDL、夜跑后的小快乐。',
    tag: '夜宵'
  },
  {
    id: 'solo',
    title: '一人食友好',
    description: '一个人吃也舒服，不用硬凑饭搭子。',
    tag: '一人食'
  },
  {
    id: 'party',
    title: '适合聚餐',
    description: '多人分食、约饭改善、寝室小局。',
    tag: '聚餐'
  }
]

export function getLeaderboards(context?: Partial<RecommendationContext>, limit = 5): Leaderboard[] {
  const all = listRestaurants({}, context)

  return leaderboardSpecs.map((spec) => {
    const base = spec.tag ? listRestaurants({ tag: spec.tag }, context) : all
    const sorted = spec.sort ? spec.sort(base) : base

    return {
      id: spec.id,
      title: spec.title,
      description: spec.description,
      restaurants: sorted.slice(0, limit)
    }
  })
}
