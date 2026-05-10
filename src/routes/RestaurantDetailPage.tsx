import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { EmptyState } from '../components/EmptyState'
import { GlassCard } from '../components/GlassCard'
import { MapNavigationLinks } from '../components/MapNavigationLinks'
import { RestaurantCard } from '../components/RestaurantCard'
import { getPresetAvatar } from '../lib/avatars'
import { showToast } from '../lib/toast'
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

function SourceSummary({ sourceRefs }: { sourceRefs?: unknown[] }) {
  const count = sourceRefs?.length ?? 0
  return <strong>{count ? `${count} 条` : '待补充'}</strong>
}

function ScoreExplain({ restaurant }: { restaurant: RestaurantSummary }) {
  const breakdown = restaurant.matchBreakdown
  if (!breakdown) return null
  const isBlended = breakdown.mode === 'blended'
  return (
    <GlassCard>
      <p className="eyebrow">WHY THIS SCORE</p>
      <h2>推荐分怎么来的</h2>
      <p>{isBlended ? '这家店已经有学生信号，所以学生评价占主要权重。' : '这家店还没有学生评价，当前只把公开 POI 当作冷启动参考。'}</p>
      <div className="score-breakdown-grid">
        <span>学生权重 <strong>{Math.round(breakdown.studentWeight * 100)}%</strong></span>
        <span>公开权重 <strong>{Math.round(breakdown.publicWeight * 100)}%</strong></span>
        <span>公开评分 <strong>{breakdown.ratingScore ?? '-'}</strong></span>
        <span>距离便利 <strong>{breakdown.distanceScore ?? '-'}</strong></span>
        <span>价格友好 <strong>{breakdown.priceScore ?? '-'}</strong></span>
        <span>偏好匹配 <strong>{breakdown.preferenceScore ?? '-'}</strong></span>
      </div>
    </GlassCard>
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
    showToast(nextIds.includes(restaurantId) ? '已加入收藏，下一顿少纠结一点。' : '已取消收藏。', nextIds.includes(restaurantId) ? 'success' : 'info')
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
          <h1>{isLoading ? '正在加载餐厅…' : '没有找到这家餐厅'}</h1>
          <p>{isLoading ? '正在向后端确认餐厅详情。' : '可能是 demo seed 里还没有录入，或链接里的餐厅 ID 不存在。'}</p>
        </div>
        <EmptyState
          eyebrow="NOT FOUND"
          title="这家店暂时不在饭点地图里"
          description="可能是数据还没导入，也可能是链接里的 ID 失效。先回发现页继续找一口热乎的。"
          action={<Link className="secondary-action" to="/discover">回到发现页</Link>}
        />
      </div>
    )
  }

  const { restaurant, dishes, reviews } = detail
  const isFavorite = favoriteIds.includes(restaurant.id) || restaurant.isFavorite
  const scoreMode = restaurant.matchBreakdown?.mode === 'blended' ? '混合推荐分' : '冷启动分'
  const scoreDescription = restaurant.matchBreakdown?.mode === 'blended'
    ? `学生 ${(restaurant.matchBreakdown.studentWeight * 100).toFixed(0)}% + 公开信息 ${(restaurant.matchBreakdown.publicWeight * 100).toFixed(0)}%`
    : '暂无学生评价，暂由公开信息主导'

  return (
    <div className="route-stack">
      <div className="status-strip">
        <span aria-live="polite">{isLoading ? '正在同步后端数据…' : dataSource}</span>
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
            <button className={`primary-action favorite-hero ${isFavorite ? 'active' : ''}`} type="button" aria-pressed={isFavorite} onClick={() => toggleFavorite(restaurant.id)}>
              {isFavorite ? '已加入收藏' : '加入收藏'}
            </button>
            <Link className="secondary-action" to="/discover">
              继续发现
            </Link>
          </div>
          <MapNavigationLinks restaurant={restaurant} />
        </div>
      </section>

      <div className="stats-grid">
        <GlassCard className="stat-card">
          <span>高德评分</span>
          <strong>{restaurant.rating}</strong>
        </GlassCard>
        <GlassCard className="stat-card">
          <span>公开来源</span>
          <SourceSummary sourceRefs={restaurant.sourceRefs} />
        </GlassCard>
        <GlassCard className="stat-card">
          <span>{scoreMode}</span>
          <strong>{restaurant.recommendationScore ?? '-'}</strong>
          <small>{scoreDescription}</small>
        </GlassCard>
        <GlassCard className="stat-card">
          <span>学生打卡</span>
          <strong>{restaurant.checkins > 0 ? restaurant.checkins : '待补充'}</strong>
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

      <ScoreExplain restaurant={restaurant} />

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">DISHES</p>
            <h2>热门菜品</h2>
          </div>
          <span className="count-badge">{dishes.length} 道</span>
        </div>
        <div className="dish-list">
          {dishes.length ? dishes.map((dish) => (
            <div className="dish-row" key={dish.id}>
              <div>
                <strong>{dish.name}</strong>
                <span>热度 {dish.heat}</span>
              </div>
              <b>¥{dish.price}</b>
            </div>
          )) : (
            <p className="helper-text">菜品暂不从公开搜索中自动生成，等学生投稿或管理员审核后再展示，避免把未经验证的菜品写成事实。</p>
          )}
        </div>
      </GlassCard>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">REVIEWS</p>
            <h2>短评与公开整理</h2>
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
                <span>{review.tags?.includes('系统整理') ? '公开整理' : `★ ${review.rating}`}</span>
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
      <div className="detail-sticky-actions" aria-label={`${restaurant.name} 快捷操作`}>
        <button className={`favorite-button ${isFavorite ? 'active' : ''}`} type="button" aria-pressed={isFavorite} onClick={() => toggleFavorite(restaurant.id)}>
          {isFavorite ? '已收藏' : '收藏'}
        </button>
        <MapNavigationLinks compact restaurant={restaurant} />
        <Link className="secondary-action compact-action" to={`/contribute?type=correction&restaurantId=${encodeURIComponent(restaurant.id)}`}>
          报错/补充
        </Link>
      </div>
    </div>
  )
}
