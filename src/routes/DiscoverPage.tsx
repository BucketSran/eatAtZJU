import { GlassCard } from '../components/GlassCard'

export function DiscoverPage() {
  return (
    <div className="route-stack">
      <div className="page-heading">
        <p className="eyebrow">DISCOVER</p>
        <h1>发现餐厅</h1>
        <p>搜索、筛选和排序会在下一步接入 seed 数据与服务层。</p>
      </div>
      <GlassCard>
        <h2>筛选区占位</h2>
        <p>这里将放置搜索框、口味 chips、预算 segmented control 和餐厅列表。</p>
      </GlassCard>
    </div>
  )
}
