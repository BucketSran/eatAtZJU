import { lazy, Suspense } from 'react'
import { NavLink, Route, Routes } from 'react-router-dom'

const AdminPage = lazy(() => import('./routes/AdminPage').then((module) => ({ default: module.AdminPage })))
const ContributePage = lazy(() => import('./routes/ContributePage').then((module) => ({ default: module.ContributePage })))
const DiscoverPage = lazy(() => import('./routes/DiscoverPage').then((module) => ({ default: module.DiscoverPage })))
const FavoritesPage = lazy(() => import('./routes/FavoritesPage').then((module) => ({ default: module.FavoritesPage })))
const HomePage = lazy(() => import('./routes/HomePage').then((module) => ({ default: module.HomePage })))
const LeaderboardsPage = lazy(() => import('./routes/LeaderboardsPage').then((module) => ({ default: module.LeaderboardsPage })))
const ProfilePage = lazy(() => import('./routes/ProfilePage').then((module) => ({ default: module.ProfilePage })))
const RestaurantDetailPage = lazy(() => import('./routes/RestaurantDetailPage').then((module) => ({ default: module.RestaurantDetailPage })))

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
        <Suspense fallback={<div className="route-loading">正在准备饭点地图…</div>}>
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
        </Suspense>
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
