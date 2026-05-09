import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { setFavoriteInSupabase } from '../services/favoriteSyncService'
import { getPreferenceTags } from '../services/preferenceStore'
import { describeApiSource, getRandomRestaurantRemote, getRecommendedRestaurant, getRecommendedRestaurantRemote, getRestaurantMetadata, listRestaurants, listRestaurantsRemote } from '../services/restaurantService'
import type { RestaurantSummary } from '../types'

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

export function HomePage() {
  const navigate = useNavigate()
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const [randomPick, setRandomPick] = useState<RestaurantSummary | null>(null)
  const [topRestaurants, setTopRestaurants] = useState<RestaurantSummary[]>(() => listRestaurants({}, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }).slice(0, 3))
  const [topPick, setTopPick] = useState<RestaurantSummary | null>(() => getRecommendedRestaurant({}, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)
  const metadata = getRestaurantMetadata()

  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: favoriteIds }), [favoriteIds, preferences])

  useEffect(() => {
    const controller = new AbortController()
    setIsLoading(true)

    Promise.all([listRestaurantsRemote({}, context, controller.signal), getRecommendedRestaurantRemote({}, context, controller.signal)])
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
  }, [context])

  function toggleFavorite(id: string) {
    const nextIds = toggleFavoriteRestaurant(id)
    setFavoriteIds(nextIds)
    setFavoriteInSupabase(id, nextIds.includes(id))
      .then(setFavoriteIds)
      .catch(() => {
        setDataSource('收藏已先保存在本地，登录后可同步云端')
      })
  }

  async function surpriseMe() {
    const result = await getRandomRestaurantRemote({}, context)
    setRandomPick(result.data)
    setDataSource(describeApiSource(result.source, result.fallbackReason))
  }

  return (
    <div className="route-stack">
      <section className="hero-panel">
        <p className="eyebrow">ZJU FOOD DEMO</p>
        <h1>今天吃什么？</h1>
        <p className="hero-copy">用学生口碑、距离和偏好标签，帮你在 30 秒内做出一顿饭的决定。</p>
        <div className="hero-actions">
          <button className="primary-action" type="button" onClick={surpriseMe}>
            随机一餐
          </button>
          <button className="secondary-action" type="button" onClick={() => navigate('/discover')}>
            浏览附近
          </button>
          <button className="secondary-action" type="button" onClick={() => navigate('/leaderboards')}>
            看榜单
          </button>
        </div>
      </section>

      <div className="status-strip">
        <span>{isLoading ? '正在同步后端数据...' : dataSource}</span>
      </div>

      {randomPick ? (
        <GlassCard className="result-card">
          <p className="eyebrow">RANDOM PICK</p>
          <h2>{randomPick.name}</h2>
          <p>
            {randomPick.area} · {randomPick.cuisine} · ¥{randomPick.price}/人。{randomPick.reason}
          </p>
          <div className="hero-actions compact-actions">
            <Link className="primary-action" to={`/restaurants/${randomPick.id}`}>
              看详情
            </Link>
            <button className="secondary-action" type="button" onClick={surpriseMe}>
              再摇一次
            </button>
          </div>
        </GlassCard>
      ) : null}

      <div className="section-heading">
        <div>
          <p className="eyebrow">TOP PICK</p>
          <h2>今日首推</h2>
        </div>
        <Link className="text-link" to="/discover">
          查看全部
        </Link>
      </div>

      {topPick ? <RestaurantCard restaurant={topPick} onToggleFavorite={toggleFavorite} /> : null}

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
        <p>本周热吃、30 元以内、夜宵、一人食、聚餐场景已经整理成榜单，适合 demo 时快速展示“学生到底怎么做饭点决策”。</p>
        <Link className="secondary-action inline-action" to="/leaderboards">
          打开校园美食榜
        </Link>
      </GlassCard>

      <div className="section-heading">
        <div>
          <p className="eyebrow">STUDENT SIGNALS</p>
          <h2>学生口碑热推</h2>
        </div>
      </div>
      <div className="restaurant-list">
        {topRestaurants.map((restaurant) => (
          <RestaurantCard key={restaurant.id} restaurant={restaurant} onToggleFavorite={toggleFavorite} />
        ))}
      </div>
    </div>
  )
}
