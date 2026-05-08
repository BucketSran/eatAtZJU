import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { GlassCard } from '../components/GlassCard'
import { fetchCampusTrustStatus, verifyCampusEmail, type CampusTrustStatus } from '../services/campusVerificationService'
import { ensureProfile, getCurrentAuthState, isSupabaseBrowserConfigured, onAuthChange, signInWithEmail, signOut, syncPreferencesToProfile, type AuthState } from '../services/authService'
import { pullFavoritesFromSupabase, syncLocalFavoritesToSupabase } from '../services/favoriteSyncService'
import { defaultPreferences, getPreferenceTags, resetPreferenceTags, togglePreferenceTag } from '../services/preferenceStore'
import { describeApiSource, getRecommendedRestaurant, getRecommendedRestaurantRemote, getRestaurantMetadata } from '../services/restaurantService'
import type { RestaurantSummary } from '../types'

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

export function ProfilePage() {
  const metadata = getRestaurantMetadata()
  const [preferences, setPreferences] = useState(() => getPreferenceTags())
  const [recommended, setRecommended] = useState<RestaurantSummary | null>(() => getRecommendedRestaurant({}, { preferences: getPreferenceTags(), favoriteRestaurantIds: [] }))
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)
  const [authState, setAuthState] = useState<AuthState>({ isConfigured: isSupabaseBrowserConfigured(), user: null })
  const [campusTrust, setCampusTrust] = useState<CampusTrustStatus | null>(null)
  const [email, setEmail] = useState('')
  const [accountStatus, setAccountStatus] = useState('')
  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: [] }), [preferences])

  useEffect(() => {
    async function hydrateUserState(state: AuthState) {
      setAuthState(state)
      if (!state.user) {
        setCampusTrust(null)
        return
      }
      await ensureProfile(state.user)
      setCampusTrust(await fetchCampusTrustStatus())
    }

    getCurrentAuthState().then((state) => {
      hydrateUserState(state).catch((error: unknown) => setAccountStatus(error instanceof Error ? error.message : '资料同步失败'))
    })

    return onAuthChange((state) => {
      hydrateUserState(state).catch((error: unknown) => setAccountStatus(error instanceof Error ? error.message : '资料同步失败'))
    })
  }, [])

  useEffect(() => {
    const controller = new AbortController()
    setIsLoading(true)

    getRecommendedRestaurantRemote({}, context, controller.signal)
      .then((result) => {
        setRecommended(result.data)
        setDataSource(describeApiSource(result.source, result.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) setRecommended(getRecommendedRestaurant({}, context))
      })
      .finally(() => {
        if (!controller.signal.aborted) setIsLoading(false)
      })

    return () => controller.abort()
  }, [context])

  function toggleTag(tag: string) {
    setPreferences(togglePreferenceTag(tag))
  }

  function resetTags() {
    setPreferences(resetPreferenceTags())
  }

  async function submitEmailLogin(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    setAccountStatus('正在发送登录邮件...')
    try {
      await signInWithEmail(email)
      setAccountStatus('登录邮件已发送，请检查邮箱。')
    } catch (error) {
      setAccountStatus(error instanceof Error ? error.message : '发送失败')
    }
  }

  async function syncProfile() {
    setAccountStatus('正在同步偏好...')
    try {
      await syncPreferencesToProfile(preferences)
      setAccountStatus('偏好已同步到 Supabase profile。')
    } catch (error) {
      setAccountStatus(error instanceof Error ? error.message : '同步失败')
    }
  }

  async function pushFavorites() {
    setAccountStatus('正在同步收藏...')
    try {
      const result = await syncLocalFavoritesToSupabase()
      setAccountStatus(`已推送 ${result.pushed} 个本地收藏。`)
    } catch (error) {
      setAccountStatus(error instanceof Error ? error.message : '收藏同步失败')
    }
  }

  async function pullFavorites() {
    setAccountStatus('正在拉取收藏...')
    try {
      const result = await pullFavoritesFromSupabase()
      setAccountStatus(`已拉取 ${result.pulled} 个云端收藏。`)
    } catch (error) {
      setAccountStatus(error instanceof Error ? error.message : '收藏拉取失败')
    }
  }

  async function verifyCampus() {
    setAccountStatus('正在验证校园邮箱...')
    try {
      const result = await verifyCampusEmail()
      setCampusTrust(result)
      setAccountStatus(result.campusEmailVerified ? '校园邮箱已验证，后续贡献会获得更高可信度。' : `当前邮箱不在允许域名：${result.allowedDomains.join('、')}`)
    } catch (error) {
      setAccountStatus(error instanceof Error ? error.message : '校园邮箱验证失败')
    }
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

      <div className="status-strip">
        <span>{isLoading ? '正在同步后端数据...' : dataSource}</span>
      </div>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">ACCOUNT</p>
            <h2>登录与云端同步</h2>
            <p>{authState.isConfigured ? 'Supabase Auth 已可用时，可用邮箱 magic link 登录。' : '当前未配置 VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY，登录能力处于待接入状态。'}</p>
          </div>
          {authState.user ? <button className="text-button" type="button" onClick={() => signOut()}>退出登录</button> : null}
        </div>

        {authState.user ? (
          <div className="form-stack">
            <p className="helper-text">当前账号：{authState.user.email}</p>
            <div className={`trust-pill ${campusTrust?.campusEmailVerified ? 'verified' : ''}`}>
              <strong>{campusTrust?.campusEmailVerified ? '校园邮箱已验证' : '校园邮箱未验证'}</strong>
              <span>{campusTrust?.campusEmailVerified ? `${campusTrust.campusEmail} · 信用分 ${campusTrust.creditScore}` : '验证后可用于学生可信贡献、审核优先级和后续约饭身份。'}</span>
            </div>
            <div className="hero-actions compact-actions">
              <button className="secondary-action" type="button" onClick={verifyCampus}>验证校园邮箱</button>
              <button className="secondary-action" type="button" onClick={syncProfile}>同步偏好</button>
              <button className="secondary-action" type="button" onClick={pushFavorites}>推送本地收藏</button>
              <button className="secondary-action" type="button" onClick={pullFavorites}>拉取云端收藏</button>
            </div>
          </div>
        ) : (
          <form className="form-stack" onSubmit={submitEmailLogin}>
            <label className="search-label" htmlFor="login-email">邮箱</label>
            <input id="login-email" className="search-input" type="email" value={email} placeholder="yourname@example.com" onChange={(event) => setEmail(event.target.value)} disabled={!authState.isConfigured} required />
            <button className="primary-action" type="submit" disabled={!authState.isConfigured}>发送登录邮件</button>
          </form>
        )}

        {accountStatus ? <p className="helper-text">{accountStatus}</p> : null}
      </GlassCard>

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
        <p>当前已加入登录、收藏/偏好同步、UGC 提交和审核 API 骨架；在配置真实 Supabase/Vercel 前，它们保持安全降级。</p>
        <div className="note-grid">
          <span>Supabase Auth</span>
          <span>submissions 审核</span>
          <span>Vercel Preview</span>
        </div>
      </GlassCard>
    </div>
  )
}
