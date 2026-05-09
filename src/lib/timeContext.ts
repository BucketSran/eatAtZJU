export type MealContextKey = 'breakfast' | 'lunch' | 'afternoon' | 'dinner' | 'night'

export type MealContext = {
  cta: string
  description: string
  key: MealContextKey
  tags: string[]
  title: string
}

export function getMealContext(now = new Date()): MealContext {
  const hour = now.getHours()

  if (hour >= 6 && hour < 10) {
    return {
      key: 'breakfast',
      title: '早八续命局',
      description: '现在更适合近一点、暖一点、负担轻一点的早餐/早午饭。',
      tags: ['近', '实惠', '校内', '暖胃', '面食'],
      cta: '早饭雷达已校准'
    }
  }

  if (hour >= 10 && hour < 14) {
    return {
      key: 'lunch',
      title: '午饭高峰局',
      description: '现在优先推荐近、快、预算友好的午餐，减少选择困难。',
      tags: ['近', '实惠', '快餐', '校内'],
      cta: '午饭榜优先'
    }
  }

  if (hour >= 14 && hour < 17) {
    return {
      key: 'afternoon',
      title: '下午摸鱼局',
      description: '这个点适合咖啡、甜点、轻食或适合坐一会儿的地方。',
      tags: ['甜品', '咖啡', '拍照', '不辣', '轻负担'],
      cta: '下午茶模式'
    }
  }

  if (hour >= 17 && hour < 21) {
    return {
      key: 'dinner',
      title: '晚饭改善局',
      description: '现在更适合下饭、聚餐、稍微走远一点也值得的晚餐。',
      tags: ['聚餐', '下饭', '辣', '人均50内'],
      cta: '晚饭榜置顶'
    }
  }

  return {
    key: 'night',
    title: '深夜加餐局',
    description: '现在优先考虑夜宵、小吃、暖胃和不会太折腾的选择。',
    tags: ['夜宵', '小吃', '暖胃', '实惠'],
    cta: '夜宵雷达启动'
  }
}
