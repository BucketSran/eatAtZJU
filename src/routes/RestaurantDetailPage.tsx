import { useParams } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'

export function RestaurantDetailPage() {
  const { id } = useParams()

  return (
    <div className="route-stack">
      <div className="page-heading">
        <p className="eyebrow">RESTAURANT</p>
        <h1>餐厅详情</h1>
        <p>当前路由 ID：{id ?? '未提供'}</p>
      </div>
      <GlassCard>
        <h2>详情页占位</h2>
        <p>这里将展示评分、人均、步行时间、热门菜品、学生短评和收藏按钮。</p>
      </GlassCard>
    </div>
  )
}
