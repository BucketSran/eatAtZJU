import { Link } from 'react-router-dom'
import type { RestaurantSummary } from '../types'

type RestaurantCardProps = {
  restaurant: RestaurantSummary
  onToggleFavorite?: (id: string) => void
}

export function RestaurantCard({ restaurant, onToggleFavorite }: RestaurantCardProps) {
  const isColdStart = restaurant.matchBreakdown?.mode !== 'blended'
  return (
    <article className="restaurant-card">
      <Link to={`/restaurants/${restaurant.id}`} className="restaurant-card-main" aria-label={`查看 ${restaurant.name}`}>
        <div className="restaurant-mark" style={{ background: restaurant.coverColor }} aria-hidden="true">
          {restaurant.coverIcon}
        </div>
        <div className="restaurant-card-content">
          <div className="restaurant-card-headline">
            <h3>{restaurant.name}</h3>
            <span className="price">¥{restaurant.price}/人</span>
          </div>
          <p className="restaurant-meta">
            {restaurant.area} · {restaurant.cuisine} · 步行 {restaurant.walkMinutes} 分钟
          </p>
          <p className="restaurant-reason">{restaurant.reason}</p>
          <div className="tag-row" aria-label="餐厅标签">
            {restaurant.tags.map((tag) => (
              <span className="tag" key={tag}>
                {tag}
              </span>
            ))}
          </div>
        </div>
      </Link>
      <div className="restaurant-card-side">
        <span className="score-pill">高德 {restaurant.rating}</span>
        {typeof restaurant.recommendationScore === 'number' ? <span className="score-pill warm">{isColdStart ? '冷启动' : '混合'} {restaurant.recommendationScore}</span> : null}
        <button className={`favorite-button ${restaurant.isFavorite ? 'active' : ''}`} type="button" onClick={() => onToggleFavorite?.(restaurant.id)}>
          {restaurant.isFavorite ? '已收藏' : '收藏'}
        </button>
      </div>
    </article>
  )
}
