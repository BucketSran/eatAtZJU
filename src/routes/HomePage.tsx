import { Link } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'

export function HomePage() {
  return (
    <div className="route-stack">
      <section className="hero-panel">
        <p className="eyebrow">ZJU FOOD DEMO</p>
        <h1>今天吃什么？</h1>
        <p className="hero-copy">先用学生口碑和轻量推荐，帮你在 30 秒内做出一顿饭的决定。</p>
        <div className="hero-actions">
          <Link className="primary-action" to="/discover">
            浏览附近
          </Link>
          <Link className="secondary-action" to="/discover?random=1">
            随机一餐
          </Link>
        </div>
      </section>

      <GlassCard>
        <p className="eyebrow">Demo v0.1</p>
        <h2>React/Vercel/Supabase 地基已就绪</h2>
        <p>下一步会把当前小程序原型的推荐、筛选、详情和收藏流程迁移到 Web/PWA。</p>
      </GlassCard>
    </div>
  )
}
