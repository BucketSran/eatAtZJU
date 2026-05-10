import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { GlassCard } from '../components/GlassCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { TagGroupSelector } from '../components/TagGroupSelector'
import { getPresetAvatar, presetAvatars } from '../lib/avatars'
import { createAccountLinkCode, type AccountLinkCode } from '../services/accountLinkService'
import { fetchCampusTrustStatus, verifyCampusEmail, type CampusTrustStatus } from '../services/campusVerificationService'
import { ensureProfile, getCurrentAuthState, isSupabaseBrowserConfigured, onAuthChange, signInWithEmail, signOut, syncPreferencesToProfile, verifyEmailOtp, type AuthState } from '../services/authService'
import { ensureAppUserProfile, updateAppUserProfile, uploadAppUserAvatar, type AppUserProfile } from '../services/appUserProfileService'
import { mergeFavoritesWithSupabase, pullFavoritesFromSupabase, syncLocalFavoritesToSupabase } from '../services/favoriteSyncService'
import { defaultPreferences, getDefaultCampus, getPreferenceTags, resetPreferenceTags, setDefaultCampus, setPreferenceTags } from '../services/preferenceStore'
import { describeApiSource, getRecommendedRestaurant, getRecommendedRestaurantRemote } from '../services/restaurantService'
import type { RestaurantSummary } from '../types'
import { campusOptions, preferenceExclusiveGroups, preferenceTagGroups, type CampusOption } from '../constants/restaurantTaxonomy'

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

type StatusTone = 'info' | 'success' | 'error'
type ProfileAction = 'loading' | 'savingName' | 'savingAvatar' | 'savingCampus' | 'uploadingAvatar' | 'syncingPreferences' | 'syncingFavorites' | 'verifyingCampus' | 'creatingLinkCode' | null

export function ProfilePage() {
  const [preferences, setPreferences] = useState(() => getPreferenceTags())
  const [defaultCampus, setDefaultCampusState] = useState<CampusOption>(() => getDefaultCampus())
  const [recommended, setRecommended] = useState<RestaurantSummary | null>(() => getRecommendedRestaurant({ campus: getDefaultCampus(), tag: '正餐' }, { preferences: getPreferenceTags(), favoriteRestaurantIds: [] }))
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)
  const [authState, setAuthState] = useState<AuthState>({ isConfigured: isSupabaseBrowserConfigured(), user: null })
  const [campusTrust, setCampusTrust] = useState<CampusTrustStatus | null>(null)
  const [email, setEmail] = useState('')
  const [otpCode, setOtpCode] = useState('')
  const [otpEmail, setOtpEmail] = useState('')
  const [accountStatus, setAccountStatus] = useState('')
  const [accountStatusTone, setAccountStatusTone] = useState<StatusTone>('info')
  const [appProfile, setAppProfile] = useState<AppUserProfile | null>(null)
  const [accountLinkCode, setAccountLinkCode] = useState<AccountLinkCode | null>(null)
  const [displayNameDraft, setDisplayNameDraft] = useState('')
  const [profileAction, setProfileAction] = useState<ProfileAction>(null)
  const context = useMemo(() => ({ preferences: [defaultCampus, ...preferences], favoriteRestaurantIds: [] }), [defaultCampus, preferences])

  function showAccountStatus(message: string, tone: StatusTone = 'info') {
    setAccountStatus(message)
    setAccountStatusTone(tone)
  }

  useEffect(() => {
    async function hydrateUserState(state: AuthState) {
      setAuthState(state)
      if (!state.user) {
        setCampusTrust(null)
        setAppProfile(null)
        setDisplayNameDraft('')
        return
      }
      setProfileAction('loading')
      const profile = await ensureProfile(state.user)
      if (profile && 'avatarPreset' in profile) {
        setAppProfile(profile)
        setDisplayNameDraft(profile.displayName)
        setDefaultCampusState(setDefaultCampus(profile.defaultCampus))
      } else {
        const appUserProfile = await ensureAppUserProfile()
        setAppProfile(appUserProfile)
        setDisplayNameDraft(appUserProfile?.displayName ?? '')
        if (appUserProfile?.defaultCampus) setDefaultCampusState(setDefaultCampus(appUserProfile.defaultCampus))
      }
      setCampusTrust(await fetchCampusTrustStatus())
      setProfileAction(null)
    }

    getCurrentAuthState().then((state) => {
      hydrateUserState(state).catch((error: unknown) => {
        setProfileAction(null)
        showAccountStatus(error instanceof Error ? error.message : '资料同步失败', 'error')
      })
    })

    return onAuthChange((state) => {
      hydrateUserState(state).catch((error: unknown) => {
        setProfileAction(null)
        showAccountStatus(error instanceof Error ? error.message : '资料同步失败', 'error')
      })
    })
  }, [])

  useEffect(() => {
    const controller = new AbortController()
    setIsLoading(true)

    getRecommendedRestaurantRemote({ campus: defaultCampus, tag: '正餐' }, context, controller.signal)
      .then((result) => {
        setRecommended(result.data)
        setDataSource(describeApiSource(result.source, result.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) setRecommended(getRecommendedRestaurant({ campus: defaultCampus, tag: '正餐' }, context))
      })
      .finally(() => {
        if (!controller.signal.aborted) setIsLoading(false)
      })

    return () => controller.abort()
  }, [context, defaultCampus])

  function updatePreferenceSelection(tags: string[]) {
    setPreferences(setPreferenceTags(tags))
  }

  function resetTags() {
    setPreferences(resetPreferenceTags())
  }

  async function chooseDefaultCampus(campus: string) {
    const nextCampus = setDefaultCampus(campus)
    setDefaultCampusState(nextCampus)

    if (!authState.user || !appProfile) {
      showAccountStatus(`默认校区已保存在本地：${nextCampus}。登录后可以同步到云端。`, 'success')
      return
    }

    setProfileAction('savingCampus')
    showAccountStatus('正在保存默认校区…')
    try {
      const profile = await updateAppUserProfile({ defaultCampus: nextCampus })
      setAppProfile(profile)
      setDefaultCampusState(profile.defaultCampus)
      showAccountStatus(`默认校区已保存为 ${profile.defaultCampus}。首页和随机一餐会优先按它推荐。`, 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '默认校区保存失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function submitEmailLogin(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const normalizedEmail = email.trim().toLowerCase()
    showAccountStatus('正在发送邮箱验证码…')
    try {
      await signInWithEmail(normalizedEmail)
      setOtpEmail(normalizedEmail)
      showAccountStatus('验证码已发送，请从邮件中复制 6 位数字验证码。', 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '发送失败', 'error')
    }
  }

  async function submitEmailOtp(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    showAccountStatus('正在验证邮箱验证码…')
    try {
      await verifyEmailOtp(otpEmail, otpCode.trim())
      setOtpCode('')
      showAccountStatus('登录成功，正在加载你的名片。', 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '验证码验证失败', 'error')
    }
  }

  async function syncProfile() {
    setProfileAction('syncingPreferences')
    showAccountStatus('正在同步偏好…')
    try {
      await syncPreferencesToProfile(preferences)
      if (appProfile) setAppProfile(await updateAppUserProfile({ preferences, defaultCampus }))
      showAccountStatus('偏好已同步。', 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '同步失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function pushFavorites() {
    setProfileAction('syncingFavorites')
    showAccountStatus('正在同步收藏…')
    try {
      const result = await syncLocalFavoritesToSupabase()
      showAccountStatus(`已推送 ${result.pushed} 个本地收藏。`, 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '收藏同步失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function pullFavorites() {
    setProfileAction('syncingFavorites')
    showAccountStatus('正在拉取收藏…')
    try {
      const result = await pullFavoritesFromSupabase()
      showAccountStatus(`已拉取 ${result.pulled} 个云端收藏。`, 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '收藏拉取失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function mergeFavorites() {
    setProfileAction('syncingFavorites')
    showAccountStatus('正在合并本地与云端收藏…')
    try {
      const result = await mergeFavoritesWithSupabase()
      showAccountStatus(`收藏已合并：本地 ${result.local} 个，云端 ${result.cloud} 个，合并后 ${result.merged} 个。`, 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '收藏合并失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function createLinkCode() {
    setProfileAction('creatingLinkCode')
    showAccountStatus('正在生成账号合并码…')
    try {
      const code = await createAccountLinkCode()
      setAccountLinkCode(code)
      showAccountStatus('账号合并码已生成，10 分钟内有效。后续微信小程序接入后可用它绑定同一账号。', 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '账号合并码生成失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function verifyCampus() {
    setProfileAction('verifyingCampus')
    showAccountStatus('正在验证校园邮箱…')
    try {
      const result = await verifyCampusEmail()
      setCampusTrust(result)
      showAccountStatus(result.campusEmailVerified ? '校园邮箱已验证，后续贡献会获得更高可信度。' : `当前邮箱不在允许域名：${result.allowedDomains.join('、')}`, result.campusEmailVerified ? 'success' : 'error')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '校园邮箱验证失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function saveDisplayName(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const nextName = displayNameDraft.trim().slice(0, 40) || 'ZJU student'
    if (appProfile && nextName === appProfile.displayName) {
      showAccountStatus('用户名没有变化。')
      return
    }
    setProfileAction('savingName')
    showAccountStatus('正在保存用户名…')
    try {
      const profile = await updateAppUserProfile({ displayName: nextName })
      setAppProfile(profile)
      setDisplayNameDraft(profile.displayName)
      showAccountStatus('用户名已保存。', 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '用户名保存失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function chooseAvatarPreset(avatarPreset: string) {
    if (appProfile?.avatarType === 'preset' && appProfile.avatarPreset === avatarPreset) {
      showAccountStatus('已经是这个头像。')
      return
    }
    const previousProfile = appProfile
    if (previousProfile) {
      setAppProfile({ ...previousProfile, avatarType: 'preset', avatarPreset, avatarUrl: '' })
    }
    setProfileAction('savingAvatar')
    showAccountStatus('正在保存头像…')
    try {
      const profile = await updateAppUserProfile({ avatarType: 'preset', avatarPreset, avatarUrl: '' })
      setAppProfile(profile)
      showAccountStatus(`头像已切换为「${getPresetAvatar(profile.avatarPreset).label}」。`, 'success')
    } catch (error) {
      if (previousProfile) setAppProfile(previousProfile)
      showAccountStatus(error instanceof Error ? error.message : '头像同步失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  async function uploadCustomAvatar(file: File | null) {
    if (!file) return
    setProfileAction('uploadingAvatar')
    showAccountStatus('正在上传头像…')
    try {
      const profile = await uploadAppUserAvatar(file)
      setAppProfile(profile)
      showAccountStatus('自定义头像已上传并保存。', 'success')
    } catch (error) {
      showAccountStatus(error instanceof Error ? error.message : '头像上传失败', 'error')
    } finally {
      setProfileAction(null)
    }
  }

  const profileAvatar = getPresetAvatar(appProfile?.avatarPreset)
  const displayNameValue = displayNameDraft.trim().slice(0, 40)
  const isNameDirty = Boolean(appProfile && displayNameValue && displayNameValue !== appProfile.displayName)
  const isProfileBusy = profileAction !== null

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">PROFILE</p>
          <h1>偏好与说明</h1>
          <p>登录后会同步用户名、头像、默认校区、偏好和收藏；未登录时先保存在本地浏览器。</p>
        </div>
        <span className="count-badge">{preferences.length} 个偏好</span>
      </div>

      <div className="status-strip">
        <span aria-live="polite">{isLoading ? '正在同步后端数据…' : dataSource}</span>
      </div>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">ACCOUNT</p>
            <h2>登录与云端同步</h2>
            <p>{authState.isConfigured ? 'Supabase Auth 已可用时，可用邮箱验证码登录，无需打开外部 magic link。' : '当前未配置 VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY，登录能力处于待接入状态。'}</p>
          </div>
          {authState.user ? <button className="text-button" type="button" onClick={() => signOut()}>退出登录</button> : null}
        </div>

        {authState.user ? (
          <div className="form-stack">
            <div className="profile-console">
              <div className="profile-preview-panel">
                <div className="profile-preview-topline">
                  <span>当前账号</span>
                  <strong>{authState.user.email}</strong>
                </div>
                <div className="profile-preview-main">
                  <div className={`web-avatar hero-avatar ${profileAction === 'uploadingAvatar' || profileAction === 'savingAvatar' ? 'is-saving' : ''}`} style={{ background: appProfile?.avatarType === 'preset' ? profileAvatar.color : undefined }}>
                    {appProfile?.avatarType === 'custom' && appProfile.avatarUrl ? <img src={appProfile.avatarUrl} alt="" /> : profileAvatar.text}
                  </div>
                  <div>
                    <p className="profile-kicker">PUBLIC CARD</p>
                    <h3>{displayNameDraft || appProfile?.displayName || 'ZJU student'}</h3>
                    <p>{appProfile?.avatarType === 'custom' ? '自定义头像' : `${profileAvatar.label} · 预设头像`}</p>
                  </div>
                </div>
              </div>

              <form className="profile-edit-panel" onSubmit={saveDisplayName}>
                <div className="field-row">
                  <label className="search-label" htmlFor="display-name">用户名</label>
                  <span className={`dirty-dot ${isNameDirty ? 'active' : ''}`}>{isNameDirty ? '未保存' : '已同步'}</span>
                </div>
                <input id="display-name" className="search-input" value={displayNameDraft} maxLength={40} placeholder="取一个浙大饭搭子昵称" onChange={(event) => setDisplayNameDraft(event.target.value)} />
                <div className="inline-form-actions">
                  <button className="secondary-action" type="button" disabled={!isNameDirty || isProfileBusy} onClick={() => setDisplayNameDraft(appProfile?.displayName ?? '')}>撤销</button>
                  <button className="primary-action" type="submit" disabled={!isNameDirty || isProfileBusy}>{profileAction === 'savingName' ? '保存中…' : '保存用户名'}</button>
                </div>
              </form>
            </div>

            <div className="avatar-section">
              <div className="field-row">
                <div>
                  <p className="eyebrow">AVATAR</p>
                  <h3>选择头像</h3>
                </div>
                <span className="helper-inline">{profileAction === 'savingAvatar' ? '正在保存…' : '点击即预览并保存'}</span>
              </div>
              <div className="avatar-preset-grid">
                {presetAvatars.map((avatar) => {
                  const active = appProfile?.avatarType === 'preset' && appProfile.avatarPreset === avatar.id
                  return (
                    <button key={avatar.id} className={`avatar-preset-button ${active ? 'active' : ''}`} type="button" disabled={isProfileBusy} aria-pressed={active} onClick={() => chooseAvatarPreset(avatar.id)}>
                      <span style={{ background: avatar.color }}>{avatar.text}</span>
                      <strong>{avatar.label}</strong>
                      {active ? <em>当前使用</em> : null}
                    </button>
                  )
                })}
              </div>
              <label className={`avatar-upload-control ${profileAction === 'uploadingAvatar' ? 'is-uploading' : ''}`}>
                <span>{profileAction === 'uploadingAvatar' ? '上传中…' : '上传自定义头像（自动压缩到 0.5MB 内）'}</span>
                <input type="file" accept="image/jpeg,image/png,image/webp,image/gif" disabled={isProfileBusy} onChange={(event) => uploadCustomAvatar(event.currentTarget.files?.[0] ?? null)} />
              </label>
            </div>
            <div className={`trust-pill ${campusTrust?.campusEmailVerified ? 'verified' : ''}`}>
              <strong>{campusTrust?.campusEmailVerified ? '校园邮箱已验证' : '校园邮箱未验证'}</strong>
              <span>{campusTrust?.campusEmailVerified ? `${campusTrust.campusEmail} · 信用分 ${campusTrust.creditScore}` : '验证后可用于学生可信贡献、审核优先级和后续约饭身份。'}</span>
            </div>
            <div className="hero-actions compact-actions">
              <button className="secondary-action" type="button" disabled={isProfileBusy} onClick={verifyCampus}>{profileAction === 'verifyingCampus' ? '验证中…' : '验证校园邮箱'}</button>
              <button className="secondary-action" type="button" disabled={isProfileBusy} onClick={syncProfile}>{profileAction === 'syncingPreferences' ? '同步中…' : '同步偏好'}</button>
              <button className="secondary-action" type="button" disabled={isProfileBusy} onClick={mergeFavorites}>合并收藏</button>
              <button className="secondary-action" type="button" disabled={isProfileBusy} onClick={pushFavorites}>推送本地收藏</button>
              <button className="secondary-action" type="button" disabled={isProfileBusy} onClick={pullFavorites}>拉取云端收藏</button>
              <button className="secondary-action" type="button" disabled={isProfileBusy} onClick={createLinkCode}>{profileAction === 'creatingLinkCode' ? '生成中…' : '生成账号合并码'}</button>
            </div>
            {accountLinkCode ? (
              <div className="link-code-panel">
                <span>账号合并码</span>
                <strong>{accountLinkCode.code}</strong>
                <p>有效期至 {new Date(accountLinkCode.expiresAt).toLocaleString()}。这是给后续微信小程序绑定同一 `app_user` 用的临时码。</p>
              </div>
            ) : null}
          </div>
        ) : (
          <div className="form-stack">
            <form className="form-stack" onSubmit={submitEmailLogin}>
              <label className="search-label" htmlFor="login-email">邮箱</label>
              <input id="login-email" className="search-input" type="email" value={email} placeholder="yourname@example.com" onChange={(event) => setEmail(event.target.value)} disabled={!authState.isConfigured} required />
              <button className="primary-action" type="submit" disabled={!authState.isConfigured}>发送验证码</button>
            </form>

            {otpEmail ? (
              <form className="form-stack otp-panel" onSubmit={submitEmailOtp}>
                <label className="search-label" htmlFor="login-otp">邮箱验证码</label>
                <input id="login-otp" className="search-input otp-input" type="text" inputMode="numeric" autoComplete="one-time-code" value={otpCode} maxLength={6} placeholder="输入 6 位验证码" onChange={(event) => setOtpCode(event.target.value.replace(/\D/g, '').slice(0, 6))} required />
                <button className="primary-action" type="submit" disabled={otpCode.length !== 6}>验证并登录</button>
                <p className="helper-text">验证码已发送到 {otpEmail}。不用点击邮件里的 Supabase 外链，只复制数字验证码即可。</p>
              </form>
            ) : null}
          </div>
        )}

        {accountStatus ? <p className={`profile-status ${accountStatusTone}`} aria-live="polite">{accountStatus}</p> : null}
      </GlassCard>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">DEFAULT CAMPUS</p>
            <h2>先选你常驻哪个校区</h2>
            <p>这个选择会影响首页“今日首推”、首页随机一餐、发现页默认筛选和后续小程序推荐，不会把你无缘无故从紫金港摇到玉泉。</p>
          </div>
          <span className="count-badge">{defaultCampus}</span>
        </div>
        <SegmentedControl label="默认校区" options={campusOptions.map((campus) => ({ label: campus, value: campus }))} value={defaultCampus} onChange={chooseDefaultCampus} />
        <p className="helper-text">{authState.user ? '已登录时会同步到云端；换设备登录后也会带回来。' : '当前未登录，默认校区会先保存在本地浏览器。'}</p>
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
        <TagGroupSelector exclusiveGroups={preferenceExclusiveGroups} groups={preferenceTagGroups} selectedTags={preferences} onChange={updatePreferenceSelection} />
        <p className="helper-text">默认偏好：{defaultPreferences.join('、')}。偏好会和默认校区一起影响“今日首推”和推荐排序。</p>
      </GlassCard>

      <GlassCard className="result-card">
        <p className="eyebrow">CURRENT PICK</p>
        <h2>{recommended ? recommended.name : '暂无推荐'}</h2>
        <p>{recommended ? `基于 ${defaultCampus} 与当前偏好，系统更倾向推荐 ${recommended.area} 的 ${recommended.cuisine}：${recommended.reason}` : '请先补充 seed 数据。'}</p>
      </GlassCard>

      <GlassCard className="demo-note">
        <p className="eyebrow">DEMO BOUNDARY</p>
        <h2>当前演示边界</h2>
        <p>当前已接入登录、头像、默认校区、收藏/偏好同步、UGC 提交和审核 API；仍需继续补充真实学生评价、数据巡检和小程序主链路。</p>
        <div className="note-grid">
          <span>Supabase Auth</span>
          <span>submissions 审核</span>
          <span>Vercel Preview</span>
        </div>
      </GlassCard>
    </div>
  )
}
