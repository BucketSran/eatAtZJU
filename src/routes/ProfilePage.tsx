import { GlassCard } from '../components/GlassCard'

export function ProfilePage() {
  return (
    <div className="route-stack">
      <div className="page-heading">
        <p className="eyebrow">PROFILE</p>
        <h1>偏好与说明</h1>
        <p>偏好会先保存在本地，等 Supabase Auth 接入后再同步到用户资料。</p>
      </div>
      <GlassCard>
        <h2>Demo 边界</h2>
        <p>当前阶段不开放真实 UGC、登录、图片上传和约饭，只验证美食发现核心体验。</p>
      </GlassCard>
    </div>
  )
}
