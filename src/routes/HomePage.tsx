import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { EmptyState } from '../components/EmptyState'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { SkeletonList } from '../components/Skeleton'
import { getMealContext } from '../lib/timeContext'
import { showToast } from '../lib/toast'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { getDefaultCampus, getPreferenceTags } from '../services/preferenceStore'
import { describeApiSource, getRandomRestaurantRemote, getRecommendedRestaurant, getRecommendedRestaurantRemote, getRestaurantMetadata, listRestaurants, listRestaurantsRemote } from '../services/restaurantService'
import type { RestaurantSummary } from '../types'

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

export function HomePage() {
  const navigate = useNavigate()
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const [defaultCampus] = useState(() => getDefaultCampus())
  const [randomPick, setRandomPick] = useState<RestaurantSummary | null>(null)
  const homeFilters = useMemo(() => ({ campus: defaultCampus, tag: '正餐' }), [defaultCampus])
  const [topRestaurants, setTopRestaurants] = useState<RestaurantSummary[]>(() => listRestaurants(homeFilters, { preferences: [getDefaultCampus(), ...getPreferenceTags()], favoriteRestaurantIds: getFavoriteRestaurantIds() }).slice(0, 3))
  const [topPick, setTopPick] = useState<RestaurantSummary | null>(() => getRecommendedRestaurant(homeFilters, { preferences: [getDefaultCampus(), ...getPreferenceTags()], favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)
  const [isRandomLoading, setIsRandomLoading] = useState(false)
  const [randomMessage, setRandomMessage] = useState('')
  const metadata = getRestaurantMetadata()
  const mealContext = useMemo(() => getMealContext(), [])

  const context = useMemo(() => ({ preferences: [defaultCampus, ...preferences], favoriteRestaurantIds: favoriteIds }), [defaultCampus, favoriteIds, preferences])

  useEffect(() => {
    const controller = new AbortController()
    setIsLoading(true)

    Promise.all([listRestaurantsRemote(homeFilters, context, controller.signal), getRecommendedRestaurantRemote(homeFilters, context, controller.signal)])
      .then(([listResult, pickResult]) => {
        setTopRestaurants(listResult.data.slice(0, 3))
        setTopPick(pickResult.data)
        setDataSource(describeApiSource(listResult.source, listResult.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) setDataSource('本地 seed fallback')
      })
      .finally(() => {
        if (!controller.signal.aborted) setIsLoading(false)
      })

    return () => controller.abort()
  }, [context, homeFilters])

  function toggleFavorite(id: string) {
    const nextIds = toggleFavoriteRestaurant(id)
    setFavoriteIds(nextIds)
    showToast(nextIds.includes(id) ? '已加入收藏，饭点不用再找半天。' : '已取消收藏。', nextIds.includes(id) ? 'success' : 'info')
    import('../services/favoriteSyncService')
      .then(({ setFavoriteInSupabase }) => setFavoriteInSupabase(id, nextIds.includes(id)))
      .then(setFavoriteIds)
      .catch(() => {
        setDataSource('收藏已先保存在本地，登录后可同步云端')
      })
  }

  async function surpriseMe() {
    setIsRandomLoading(true)
    setRandomMessage('正在重新摇一餐…')
    try {
      const result = await getRandomRestaurantRemote(homeFilters, context)
      setRandomPick(result.data)
      setRandomMessage(result.data ? '' : '当前校区和正餐条件下暂时没有可随机的餐厅。')
      showToast(result.data ? `摇到：${result.data.name}` : '这组条件暂时没有结果。', result.data ? 'success' : 'info')
      setDataSource(describeApiSource(result.source, result.fallbackReason))
    } catch {
      setRandomMessage('这次没摇出来，可能是网络抖了一下，请再试一次。')
    } finally {
      setIsRandomLoading(false)
    }
  }

  return (
    <div className="route-stack">
      <section className="hero-panel">
        <p className="eyebrow">ZJU FOOD DEMO</p>
        <h1>今天吃什么？</h1>
        <p className="hero-copy">{mealContext.title}：{mealContext.description} 推荐分采用“学生评价 80% + 公开信息 20%”的长期模型；当前先按你的默认校区「{defaultCampus}」推荐正餐，避免饭点随机远征。</p>
        <div className="hero-actions">
          <button className="primary-action" type="button" disabled={isRandomLoading} onClick={surpriseMe}>
            {isRandomLoading ? '正在摇…' : '随机一餐'}
          </button>
          <button className="secondary-action" type="button" onClick={() => navigate('/discover')}>
            浏览附近
          </button>
          <button className="secondary-action" type="button" onClick={() => navigate('/leaderboards')}>
            看榜单
          </button>
          <button className="secondary-action" type="button" onClick={() => navigate('/profile')}>
            切换校区
          </button>
        </div>
      </section>

      <div className="status-strip">
        <span aria-live="polite">{isLoading ? '正在同步后端数据…' : dataSource}</span>
      </div>

      {randomPick ? (
        <GlassCard className="result-card">
          <p className="eyebrow">RANDOM PICK</p>
          <h2>{randomPick.name}</h2>
          <p>
            {defaultCampus} · 正餐随机结果：{randomPick.area} · {randomPick.cuisine} · ¥{randomPick.price}/人。{randomPick.reason}
          </p>
          {randomMessage ? <p className="helper-text" aria-live="polite">{randomMessage}</p> : null}
          <div className="hero-actions compact-actions">
            <Link className="primary-action" to={`/restaurants/${randomPick.id}`}>
              看详情
            </Link>
            <button className="secondary-action" type="button" disabled={isRandomLoading} onClick={surpriseMe}>
              {isRandomLoading ? '正在摇…' : '再摇一次'}
            </button>
          </div>
        </GlassCard>
      ) : randomMessage ? (
        <GlassCard className="result-card">
          <p className="eyebrow">RANDOM PICK</p>
          <h2>{isRandomLoading ? '正在摇一餐' : '还没摇到'}</h2>
          <p className="helper-text" aria-live="polite">{randomMessage}</p>
        </GlassCard>
      ) : null}

      <div className="section-heading">
        <div>
          <p className="eyebrow">TOP PICK</p>
          <h2>今日首推</h2>
          <p>{defaultCampus} · 正餐优先</p>
        </div>
        <Link className="text-link" to="/discover">
          查看全部
        </Link>
      </div>

      {isLoading && !topPick ? <SkeletonList count={1} /> : null}
      {topPick ? (
        <RestaurantCard restaurant={topPick} onToggleFavorite={toggleFavorite} />
      ) : !isLoading ? (
        <EmptyState
          eyebrow="TOP PICK"
          title="当前校区还没有首推"
          description="可以先去发现页放宽条件，或者在贡献页补一条你确信存在的餐厅。"
          action={<Link className="secondary-action" to="/discover">去发现页</Link>}
        />
      ) : null}

      <GlassCard>
        <p className="eyebrow">QUICK FILTERS</p>
        <h2>按场景快速找</h2>
        <div className="quick-filter-grid">
          {metadata.tasteTags.slice(1, 7).map((tag) => (
            <Link key={tag} className="quick-filter" to={`/discover?tag=${encodeURIComponent(tag)}`}>
              {tag}
            </Link>
          ))}
        </div>
      </GlassCard>

      <GlassCard className="demo-note">
        <p className="eyebrow">RANKINGS</p>
        <h2>五个榜单，快速解释产品价值</h2>
        <p>午饭速决、30 元以内、夜宵、一人食、聚餐场景已经整理成榜单，适合 demo 时快速展示“如何把选择变少”。</p>
        <Link className="secondary-action inline-action" to="/leaderboards">
          打开校园美食榜
        </Link>
      </GlassCard>

      <div className="section-heading">
        <div>
          <p className="eyebrow">PUBLIC SIGNALS</p>
          <h2>公开信息优先推荐</h2>
        </div>
      </div>
      <div className="restaurant-list">
        {isLoading && !topRestaurants.length ? <SkeletonList count={3} /> : null}
        {topRestaurants.map((restaurant) => (
          <RestaurantCard key={restaurant.id} restaurant={restaurant} onToggleFavorite={toggleFavorite} />
        ))}
      </div>
    </div>
  )
}
