import { Link } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'

export function FavoritesPage() {
  return (
    <div className="route-stack">
      <div className="page-heading">
        <p className="eyebrow">FAVORITES</p>
        <h1>我的收藏</h1>
        <p>Demo v0.1 收藏将先保存在本地浏览器。</p>
      </div>
      <GlassCard>
        <h2>收藏夹还没有餐厅。</h2>
        <p>等餐厅卡接入后，你收藏的餐厅会出现在这里。</p>
        <Link className="secondary-action inline-action" to="/discover">
          去发现餐厅
        </Link>
      </GlassCard>
    </div>
  )
}
