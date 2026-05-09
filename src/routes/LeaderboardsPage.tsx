import { Link } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'
import { getMealContext } from '../lib/timeContext'
import { getFavoriteRestaurantIds } from '../services/favoriteStore'
import { getLeaderboards } from '../services/leaderboardService'
import { getPreferenceTags } from '../services/preferenceStore'

export function LeaderboardsPage() {
  const mealContext = getMealContext()
  const leaderboards = getLeaderboards({ preferences: [...getPreferenceTags(), ...mealContext.tags], favoriteRestaurantIds: getFavoriteRestaurantIds() }, 6, mealContext)

  return (
    <div className="route-stack">
      <div className="page-heading split-heading leaderboard-hero-web">
        <div>
          <p className="eyebrow">TIME AWARE RANKINGS</p>
          <h1>校园美食榜</h1>
          <p>{mealContext.title}：{mealContext.description}</p>
        </div>
        <span className="count-badge">{leaderboards.length} 个榜单</span>
      </div>

      <div className="leaderboard-grid">
        {leaderboards.map((board) => (
          <GlassCard className={`leaderboard-card ${board.isTimePriority ? 'priority-board' : ''}`} key={board.id}>
            <div className="section-heading card-heading">
              <div>
                <p className="eyebrow">{board.isTimePriority ? mealContext.cta : board.id.toUpperCase()}</p>
                <h2>{board.title}</h2>
                <p>{board.description}</p>
              </div>
            </div>
            <div className="ranking-list">
              {board.restaurants.map((restaurant, index) => (
                <Link className="ranking-row" key={restaurant.id} to={`/restaurants/${restaurant.id}`}>
                  <span className="ranking-index">{index + 1}</span>
                  <div>
                    <strong>{restaurant.name}</strong>
                  <p>
                      {restaurant.area} · ¥{restaurant.price}/人 · 高德 {restaurant.rating}
                    </p>
                  </div>
                  <b>{restaurant.recommendationScore ?? '-'}</b>
                </Link>
              ))}
              {!board.restaurants.length ? <p className="helper-text">真实数据进来后，这个榜单会自动丰富。</p> : null}
            </div>
          </GlassCard>
        ))}
      </div>
    </div>
  )
}
