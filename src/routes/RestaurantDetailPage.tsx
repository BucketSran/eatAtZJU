import { Link, useParams } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { getPreferenceTags } from '../services/preferenceStore'
import { getRestaurantDetail, listRestaurants } from '../services/restaurantService'
import { useMemo, useState } from 'react'

export function RestaurantDetailPage() {
  const { id } = useParams()
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: favoriteIds }), [favoriteIds, preferences])
  const detail = id ? getRestaurantDetail(id, context) : null
  const relatedRestaurants = detail ? listRestaurants({ tag: detail.restaurant.tags[0] }, context).filter((restaurant) => restaurant.id !== detail.restaurant.id).slice(0, 2) : []

  function toggleFavorite(restaurantId: string) {
    setFavoriteIds(toggleFavoriteRestaurant(restaurantId))
  }

  if (!detail) {
    return (
      <div className="route-stack">
        <div className="page-heading">
          <p className="eyebrow">RESTAURANT</p>
          <h1>没有找到这家餐厅</h1>
          <p>可能是 demo seed 里还没有录入，或链接里的餐厅 ID 不存在。</p>
        </div>
        <GlassCard>
          <Link className="secondary-action inline-action" to="/discover">
            回到发现页
          </Link>
        </GlassCard>
      </div>
    )
  }

  const { restaurant, dishes, reviews } = detail

  return (
    <div className="route-stack">
      <section className="detail-hero glass-card">
        <div className="detail-mark" style={{ background: restaurant.coverColor }} aria-hidden="true">
          {restaurant.coverIcon}
        </div>
        <div className="detail-copy">
          <p className="eyebrow">RESTAURANT</p>
          <h1>{restaurant.name}</h1>
          <p>
            {restaurant.area} · {restaurant.cuisine} · 步行 {restaurant.walkMinutes} 分钟 · ¥{restaurant.price}/人
          </p>
          <p>{restaurant.reason}</p>
          <div className="tag-row">
            {restaurant.tags.map((tag) => (
              <Link key={tag} className="tag interactive" to={`/discover?tag=${encodeURIComponent(tag)}`}>
                {tag}
              </Link>
            ))}
          </div>
          <div className="hero-actions compact-actions">
            <button className={`primary-action favorite-hero ${restaurant.isFavorite ? 'active' : ''}`} type="button" onClick={() => toggleFavorite(restaurant.id)}>
              {restaurant.isFavorite ? '已加入收藏' : '加入收藏'}
            </button>
            <Link className="secondary-action" to="/discover">
              继续发现
            </Link>
          </div>
        </div>
      </section>

      <div className="stats-grid">
        <GlassCard className="stat-card">
          <span>评分</span>
          <strong>{restaurant.rating}</strong>
        </GlassCard>
        <GlassCard className="stat-card">
          <span>学生可信分</span>
          <strong>{restaurant.studentScore}</strong>
        </GlassCard>
        <GlassCard className="stat-card">
          <span>打卡量</span>
          <strong>{restaurant.checkins}</strong>
        </GlassCard>
        <GlassCard className="stat-card">
          <span>推荐分</span>
          <strong>{restaurant.recommendationScore ?? '-'}</strong>
        </GlassCard>
      </div>

      <GlassCard>
        <p className="eyebrow">BEST FOR</p>
        <h2>适合这些场景</h2>
        <div className="tag-row roomy-tags">
          {restaurant.suitedFor.map((scene) => (
            <span className="tag strong" key={scene}>
              {scene}
            </span>
          ))}
        </div>
      </GlassCard>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">DISHES</p>
            <h2>热门菜品</h2>
          </div>
          <span className="count-badge">{dishes.length} 道</span>
        </div>
        <div className="dish-list">
          {dishes.map((dish) => (
            <div className="dish-row" key={dish.id}>
              <div>
                <strong>{dish.name}</strong>
                <span>热度 {dish.heat}</span>
              </div>
              <b>¥{dish.price}</b>
            </div>
          ))}
        </div>
      </GlassCard>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">REVIEWS</p>
            <h2>学生短评</h2>
          </div>
          <span className="count-badge">{reviews.length} 条</span>
        </div>
        <div className="review-list">
          {reviews.map((review) => (
            <article className="review-card" key={review.id}>
              <div className="review-meta">
                <strong>{review.userName}</strong>
                <span>★ {review.rating}</span>
              </div>
              <p>{review.text}</p>
            </article>
          ))}
        </div>
      </GlassCard>

      {relatedRestaurants.length ? (
        <div className="route-stack">
          <div className="section-heading">
            <div>
              <p className="eyebrow">MORE LIKE THIS</p>
              <h2>类似口味</h2>
            </div>
          </div>
          <div className="restaurant-list">
            {relatedRestaurants.map((item) => (
              <RestaurantCard key={item.id} restaurant={item} onToggleFavorite={toggleFavorite} />
            ))}
          </div>
        </div>
      ) : null}
    </div>
  )
}
