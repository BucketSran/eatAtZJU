import { Link } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'
import { getFavoriteRestaurantIds } from '../services/favoriteStore'
import { getLeaderboards } from '../services/leaderboardService'
import { getPreferenceTags } from '../services/preferenceStore'

export function LeaderboardsPage() {
  const leaderboards = getLeaderboards({ preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }, 5)

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">RANKINGS</p>
          <h1>校园美食榜</h1>
          <p>把“吃什么”拆成几个学生最常见的决策场景，演示时更容易讲清产品价值。</p>
        </div>
        <span className="count-badge">{leaderboards.length} 个榜单</span>
      </div>

      <div className="leaderboard-grid">
        {leaderboards.map((board) => (
          <GlassCard className="leaderboard-card" key={board.id}>
            <div className="section-heading card-heading">
              <div>
                <p className="eyebrow">{board.id.toUpperCase()}</p>
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
                      {restaurant.area} · ¥{restaurant.price}/人 · ★ {restaurant.rating}
                    </p>
                  </div>
                  <b>{restaurant.studentScore}</b>
                </Link>
              ))}
            </div>
          </GlassCard>
        ))}
      </div>
    </div>
  )
}
