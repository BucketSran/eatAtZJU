import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { campusOptions, type CampusOption } from '../constants/restaurantTaxonomy'
import { getMealContext } from '../lib/timeContext'
import { getFavoriteRestaurantIds } from '../services/favoriteStore'
import { buildLeaderboards, type Leaderboard } from '../services/leaderboardService'
import { getDefaultCampus, getPreferenceTags, normalizeCampus } from '../services/preferenceStore'
import { describeApiSource, listRestaurantsRemote } from '../services/restaurantService'
import type { RestaurantSummary } from '../types'

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

function getBoardSummary(board: Leaderboard) {
  if (!board.restaurants.length) return '还在等更多可信数据'
  const top = board.restaurants[0]
  return `Top 1 · ${top.name} · ${top.boardScore} 分`
}

export function LeaderboardsPage() {
  const mealContext = useMemo(() => getMealContext(), [])
  const [campus, setCampus] = useState<CampusOption>(() => getDefaultCampus())
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>([])
  const [dataSource, setDataSource] = useState('正在同步后端数据…')
  const [isLoading, setIsLoading] = useState(true)
  const preferences = useMemo(() => getPreferenceTags(), [])
  const context = useMemo(() => ({ preferences: [campus, ...preferences, ...mealContext.tags], favoriteRestaurantIds: getFavoriteRestaurantIds() }), [campus, mealContext.tags, preferences])
  const leaderboards = useMemo(() => buildLeaderboards(restaurants, context, 6, mealContext), [context, mealContext, restaurants])
  const candidateCount = restaurants.length

  useEffect(() => {
    const controller = new AbortController()
    setIsLoading(true)

    listRestaurantsRemote({ campus, sort: 'recommended' }, context, controller.signal)
      .then((result) => {
        setRestaurants(result.data)
        setDataSource(describeApiSource(result.source, result.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) {
          setRestaurants([])
          setDataSource('榜单数据同步失败，请稍后重试')
        }
      })
      .finally(() => {
        if (!controller.signal.aborted) setIsLoading(false)
      })

    return () => controller.abort()
  }, [campus, context])

  function chooseCampus(nextCampus: string) {
    setCampus(normalizeCampus(nextCampus))
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading leaderboard-hero-web">
        <div>
          <p className="eyebrow">TIME AWARE RANKINGS</p>
          <h1>校园美食榜</h1>
          <p>{mealContext.title}：{mealContext.description} 当前按 {campus} 与你的偏好生成榜单。</p>
        </div>
        <span className="count-badge">{leaderboards.length} 个榜单</span>
      </div>

      <GlassCard className="leaderboard-toolbar" id="campus-selector">
        <div>
          <p className="eyebrow">CAMPUS LENS</p>
          <h2>先选校区，再看榜单</h2>
          <p>榜单不是全站混排，会优先把当前校区、当前时间段和你的“非食堂”等偏好纳入排序。</p>
        </div>
        <SegmentedControl label="榜单校区" options={campusOptions.map((option) => ({ label: option, value: option }))} value={campus} onChange={chooseCampus} />
      </GlassCard>

      <div className="status-strip leaderboard-status">
        <span aria-live="polite">{isLoading ? '正在同步后端数据…' : dataSource}</span>
        <span>{candidateCount} 家候选餐厅</span>
      </div>

      <div className="leaderboard-grid" id="leaderboard-results">
        {leaderboards.map((board) => (
          <GlassCard className={`leaderboard-card ${board.isTimePriority ? 'priority-board' : ''}`} key={board.id}>
            <div className="section-heading card-heading">
              <div>
                <p className="eyebrow">{board.isTimePriority ? mealContext.cta : board.id.toUpperCase()}</p>
                <h2>{board.title}</h2>
                <p>{board.description}</p>
              </div>
              <span className="board-pill">{getBoardSummary(board)}</span>
            </div>
            <div className="ranking-list">
              {board.restaurants.map((restaurant, index) => (
                <Link className="ranking-row" key={restaurant.id} to={`/restaurants/${restaurant.id}`}>
                  <span className="ranking-index">{index + 1}</span>
                  <div>
                    <strong>{restaurant.name}</strong>
                    <p>
                      {restaurant.area} · ¥{restaurant.price}/人 · 高德 {restaurant.rating} · 推荐 {restaurant.recommendationScore ?? restaurant.boardScore}
                    </p>
                  </div>
                  <b>{restaurant.boardScore}</b>
                </Link>
              ))}
              {!board.restaurants.length ? <p className="helper-text">这个榜单暂时没有足够候选。可以换校区，或在发现页放宽标签。</p> : null}
            </div>
            <Link className="secondary-action inline-action" to={`/discover?campus=${encodeURIComponent(campus)}&sort=recommended`}>
              去发现页细筛
            </Link>
          </GlassCard>
        ))}
      </div>
    </div>
  )
}
