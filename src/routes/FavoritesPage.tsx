import { Link } from 'react-router-dom'
import { useMemo, useState } from 'react'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { getPreferenceTags } from '../services/preferenceStore'
import { getFavoriteRestaurants, getRecommendedRestaurant } from '../services/restaurantService'

export function FavoritesPage() {
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: favoriteIds }), [favoriteIds, preferences])
  const restaurants = getFavoriteRestaurants(context)
  const fallbackPick = getRecommendedRestaurant({}, context)

  function toggleFavorite(id: string) {
    setFavoriteIds(toggleFavoriteRestaurant(id))
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
