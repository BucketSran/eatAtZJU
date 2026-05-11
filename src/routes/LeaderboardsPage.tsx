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
  const [activeBoardId, setActiveBoardId] = useState<Leaderboard['id'] | ''>('')
  const activeBoard = leaderboards.find((board) => board.id === activeBoardId) ?? leaderboards[0]
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

  useEffect(() => {
    if (!leaderboards.length) return
    if (!activeBoardId || !leaderboards.some((board) => board.id === activeBoardId)) {
      setActiveBoardId(leaderboards[0].id)
    }
  }, [activeBoardId, leaderboards])

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

      <GlassCard className="leaderboard-switcher" id="leaderboard-results">
        <div className="leaderboard-tab-row" role="tablist" aria-label="校园美食榜单">
          {leaderboards.map((board) => (
            <button
              key={board.id}
              className={`leaderboard-tab ${activeBoard?.id === board.id ? 'active' : ''} ${board.isTimePriority ? 'time-priority' : ''}`}
              type="button"
              role="tab"
              aria-selected={activeBoard?.id === board.id}
              onClick={() => setActiveBoardId(board.id)}
            >
              <strong>{board.title}</strong>
              <span>{board.isTimePriority ? mealContext.cta : `${board.restaurants.length} 家候选`}</span>
            </button>
          ))}
        </div>

        {activeBoard ? (
          <div className={`leaderboard-focus ${activeBoard.isTimePriority ? 'priority-board' : ''}`}>
            <div className="section-heading card-heading">
              <div>
                <p className="eyebrow">{activeBoard.isTimePriority ? mealContext.cta : activeBoard.id.toUpperCase()}</p>
                <h2>{activeBoard.title}</h2>
                <p>{activeBoard.description}</p>
              </div>
              <span className="board-pill">{getBoardSummary(activeBoard)}</span>
            </div>
            {activeBoard.restaurants[0] ? (
              <Link className="leaderboard-winner" to={`/restaurants/${activeBoard.restaurants[0].id}`}>
                <span className="ranking-index">1</span>
                <div>
                  <strong>{activeBoard.restaurants[0].name}</strong>
                  <p>{activeBoard.restaurants[0].area} · ¥{activeBoard.restaurants[0].price}/人 · 高德 {activeBoard.restaurants[0].rating}</p>
                </div>
                <b>{activeBoard.restaurants[0].boardScore}</b>
              </Link>
            ) : null}
            <div className="ranking-list compact-ranking-list">
              {activeBoard.restaurants.slice(1).map((restaurant, index) => (
                <Link className="ranking-row" key={restaurant.id} to={`/restaurants/${restaurant.id}`}>
                  <span className="ranking-index">{index + 2}</span>
                  <div>
                    <strong>{restaurant.name}</strong>
                    <p>
                      {restaurant.area} · ¥{restaurant.price}/人 · 高德 {restaurant.rating} · 推荐 {restaurant.recommendationScore ?? restaurant.boardScore}
                    </p>
                  </div>
                  <b>{restaurant.boardScore}</b>
                </Link>
              ))}
              {!activeBoard.restaurants.length ? <p className="helper-text">这个榜单暂时没有足够候选。可以换校区，或在发现页放宽标签。</p> : null}
            </div>
            <Link className="secondary-action inline-action" to={`/discover?campus=${encodeURIComponent(campus)}&sort=recommended`}>
              去发现页细筛
            </Link>
          </div>
        ) : null}
      </GlassCard>
    </div>
  )
}
