import { NavLink, Route, Routes } from 'react-router-dom'
import { AdminPage } from './routes/AdminPage'
import { ContributePage } from './routes/ContributePage'
import { DiscoverPage } from './routes/DiscoverPage'
import { FavoritesPage } from './routes/FavoritesPage'
import { HomePage } from './routes/HomePage'
import { LeaderboardsPage } from './routes/LeaderboardsPage'
import { ProfilePage } from './routes/ProfilePage'
import { RestaurantDetailPage } from './routes/RestaurantDetailPage'

const navItems = [
  { to: '/', label: '首页' },
  { to: '/discover', label: '发现' },
  { to: '/leaderboards', label: '榜单' },
  { to: '/contribute', label: '贡献' },
  { to: '/favorites', label: '收藏' },
  { to: '/profile', label: '我的' }
]

export function App() {
  return (
    <div className="app-shell">
      <header className="top-nav" aria-label="主导航">
        <NavLink to="/" className="brand" aria-label="食在浙大首页">
          食在浙大
        </NavLink>
        <nav className="nav-links">
          {navItems.map((item) => (
            <NavLink key={item.to} to={item.to} className="nav-link">
              {item.label}
            </NavLink>
          ))}
        </nav>
      </header>

      <main className="page-container">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/discover" element={<DiscoverPage />} />
          <Route path="/leaderboards" element={<LeaderboardsPage />} />
          <Route path="/contribute" element={<ContributePage />} />
          <Route path="/admin" element={<AdminPage />} />
          <Route path="/restaurants/:id" element={<RestaurantDetailPage />} />
          <Route path="/favorites" element={<FavoritesPage />} />
          <Route path="/profile" element={<ProfilePage />} />
        </Routes>
      </main>

      <nav className="mobile-tab-bar" aria-label="移动端导航">
        {navItems.map((item) => (
          <NavLink key={item.to} to={item.to} className="mobile-tab">
            {item.label}
          </NavLink>
        ))}
      </nav>
    </div>
  )
}
