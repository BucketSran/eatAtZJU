import { useMemo, useState } from 'react'
import { GlassCard } from '../components/GlassCard'
import { defaultPreferences, getPreferenceTags, resetPreferenceTags, togglePreferenceTag } from '../services/preferenceStore'
import { getRestaurantMetadata, getRecommendedRestaurant } from '../services/restaurantService'

export function ProfilePage() {
  const metadata = getRestaurantMetadata()
  const [preferences, setPreferences] = useState(() => getPreferenceTags())
  const recommended = useMemo(() => getRecommendedRestaurant({}, { preferences, favoriteRestaurantIds: [] }), [preferences])

  function toggleTag(tag: string) {
    setPreferences(togglePreferenceTag(tag))
  }

  function resetTags() {
    setPreferences(resetPreferenceTags())
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">PROFILE</p>
          <h1>偏好与说明</h1>
          <p>这里先用本地偏好驱动推荐排序，等 Supabase Auth 接入后再同步到用户资料。</p>
        </div>
        <span className="count-badge">{preferences.length} 个偏好</span>
      </div>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">TASTE PROFILE</p>
            <h2>选择你常用的吃饭偏好</h2>
          </div>
          <button className="text-button" type="button" onClick={resetTags}>
            恢复默认
          </button>
        </div>
        <div className="preference-grid">
          {metadata.tasteTags.filter((tag) => tag !== '全部').map((tag) => (
            <button key={tag} className={`preference-chip ${preferences.includes(tag) ? 'active' : ''}`} type="button" onClick={() => toggleTag(tag)}>
              {tag}
            </button>
          ))}
        </div>
        <p className="helper-text">默认偏好：{defaultPreferences.join('、')}。偏好会影响“今日首推”和推荐排序。</p>
      </GlassCard>

      <GlassCard className="result-card">
        <p className="eyebrow">CURRENT PICK</p>
        <h2>{recommended ? recommended.name : '暂无推荐'}</h2>
        <p>{recommended ? `基于当前偏好，系统更倾向推荐 ${recommended.area} 的 ${recommended.cuisine}：${recommended.reason}` : '请先补充 seed 数据。'}</p>
      </GlassCard>

      <GlassCard className="demo-note">
        <p className="eyebrow">DEMO BOUNDARY</p>
        <h2>当前演示边界</h2>
        <p>本阶段不开放真实登录、UGC、图片上传、约饭和后台审核，只验证“发现餐厅到筛选、详情、收藏/偏好推荐”的核心体验。</p>
        <div className="note-grid">
          <span>下一步：Supabase schema</span>
          <span>下一步：Vercel Preview</span>
          <span>下一步：真实种子数据</span>
        </div>
      </GlassCard>
    </div>
  )
}
