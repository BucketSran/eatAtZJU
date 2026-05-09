import { Link } from 'react-router-dom'
import { useEffect, useMemo, useState } from 'react'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { setFavoriteInSupabase } from '../services/favoriteSyncService'
import { getPreferenceTags } from '../services/preferenceStore'
import { describeApiSource, getFavoriteRestaurants, getFavoriteRestaurantsRemote, getRecommendedRestaurant, getRecommendedRestaurantRemote } from '../services/restaurantService'
import type { RestaurantSummary } from '../types'

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

export function FavoritesPage() {
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: favoriteIds }), [favoriteIds, preferences])
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>(() => getFavoriteRestaurants({ preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [fallbackPick, setFallbackPick] = useState<RestaurantSummary | null>(() => getRecommendedRestaurant({}, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)

  useEffect(() => {
    const controller = new AbortController()
    setIsLoading(true)

    Promise.all([getFavoriteRestaurantsRemote(context, controller.signal), getRecommendedRestaurantRemote({}, context, controller.signal)])
      .then(([favoritesResult, pickResult]) => {
        setRestaurants(favoritesResult.data)
        setFallbackPick(pickResult.data)
        setDataSource(describeApiSource(favoritesResult.source, favoritesResult.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) {
          setRestaurants(getFavoriteRestaurants(context))
          setFallbackPick(getRecommendedRestaurant({}, context))
        }
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

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">FAVORITES</p>
          <h1>我的收藏</h1>
          <p>Demo v0.1 收藏先保存在本地浏览器，后续接 Supabase Auth 后同步到个人账号。</p>
        </div>
        <span className="count-badge">{restaurants.length} 家</span>
      </div>

      <div className="status-strip">
        <span>{isLoading ? '正在同步后端数据...' : dataSource}</span>
      </div>

      {restaurants.length ? (
        <div className="restaurant-list">
          {restaurants.map((restaurant) => (
            <RestaurantCard key={restaurant.id} restaurant={restaurant} onToggleFavorite={toggleFavorite} />
          ))}
        </div>
      ) : (
        <GlassCard className="empty-state">
          <p className="eyebrow">EMPTY</p>
          <h2>收藏夹还没有餐厅。</h2>
          <p>先去发现页挑几家“下次一定吃”的店，之后这里就会变成你的校园饭点备忘录。</p>
          <div className="hero-actions compact-actions">
            <Link className="primary-action" to="/discover">
              去发现餐厅
            </Link>
            {fallbackPick ? (
              <Link className="secondary-action" to={`/restaurants/${fallbackPick.id}`}>
                看今日首推
              </Link>
            ) : null}
          </div>
        </GlassCard>
      )}
    </div>
  )
}
