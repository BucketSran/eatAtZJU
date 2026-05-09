import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { getPresetAvatar } from '../lib/avatars'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { getPreferenceTags } from '../services/preferenceStore'
import { describeApiSource, getRestaurantDetail, getRestaurantDetailRemote, listRestaurants, listRestaurantsRemote } from '../services/restaurantService'
import type { RestaurantDetail } from '../services/apiRestaurantClient'
import type { RestaurantSummary } from '../types'
import type { Review } from '../types'

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

function ReviewAvatar({ review }: { review: Review }) {
  const preset = getPresetAvatar(review.avatarSnapshot?.preset)
  const isCustom = review.avatarSnapshot?.type === 'custom' && review.avatarSnapshot.url
  return (
    <span className="review-avatar" style={{ background: isCustom ? undefined : review.avatarSnapshot?.color || preset.color }}>
      {isCustom ? <img src={review.avatarSnapshot?.url} alt="" /> : review.avatarSnapshot?.text || preset.text}
    </span>
  )
}

export function RestaurantDetailPage() {
  const { id } = useParams()
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: favoriteIds }), [favoriteIds, preferences])
  const [detail, setDetail] = useState<RestaurantDetail | null>(() => (id ? getRestaurantDetail(id, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }) : null))
  const [relatedRestaurants, setRelatedRestaurants] = useState<RestaurantSummary[]>(() => (detail ? listRestaurants({ tag: detail.restaurant.tags[0] }, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }).filter((restaurant) => restaurant.id !== detail.restaurant.id).slice(0, 2) : []))
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)

  useEffect(() => {
    if (!id) {
      setDetail(null)
      setRelatedRestaurants([])
      return
    }

    const controller = new AbortController()
    setIsLoading(true)

    getRestaurantDetailRemote(id, context, controller.signal)
      .then(async (result) => {
        setDetail(result.data)
        setDataSource(describeApiSource(result.source, result.fallbackReason))

        if (!result.data) {
          setRelatedRestaurants([])
          return
        }

        const related = await listRestaurantsRemote({ tag: result.data.restaurant.tags[0] }, context, controller.signal)
        setRelatedRestaurants(related.data.filter((restaurant) => restaurant.id !== result.data?.restaurant.id).slice(0, 2))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) {
          const local = getRestaurantDetail(id, context)
          setDetail(local)
          setRelatedRestaurants(local ? listRestaurants({ tag: local.restaurant.tags[0] }, context).filter((restaurant) => restaurant.id !== local.restaurant.id).slice(0, 2) : [])
        }
      })
      .finally(() => {
        if (!controller.signal.aborted) setIsLoading(false)
      })

    return () => controller.abort()
  }, [context, id])

  function toggleFavorite(restaurantId: string) {
    const nextIds = toggleFavoriteRestaurant(restaurantId)
    setFavoriteIds(nextIds)
    import('../services/favoriteSyncService')
      .then(({ setFavoriteInSupabase }) => setFavoriteInSupabase(restaurantId, nextIds.includes(restaurantId)))
      .then(setFavoriteIds)
      .catch(() => {
        setDataSource('收藏已先保存在本地，登录后可同步云端')
      })
  }

  if (!detail) {
    return (
      <div className="route-stack">
        <div className="page-heading">
          <p className="eyebrow">RESTAURANT</p>
          <h1>{isLoading ? '正在加载餐厅...' : '没有找到这家餐厅'}</h1>
          <p>{isLoading ? '正在向后端确认餐厅详情。' : '可能是 demo seed 里还没有录入，或链接里的餐厅 ID 不存在。'}</p>
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
      <div className="status-strip">
        <span>{isLoading ? '正在同步后端数据...' : dataSource}</span>
      </div>

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
                <div className="review-author">
                  <ReviewAvatar review={review} />
                  <strong>{review.userName}</strong>
                </div>
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
