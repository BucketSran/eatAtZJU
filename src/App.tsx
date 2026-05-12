import { lazy, Suspense } from 'react'
import { NavLink, Route, Routes } from 'react-router-dom'
import { OnboardingDialog } from './components/OnboardingDialog'
import { ScrollAssistant } from './components/ScrollAssistant'
import { ToastHost } from './components/ToastHost'

const AdminPage = lazy(() => import('./routes/AdminPage').then((module) => ({ default: module.AdminPage })))
const ContributePage = lazy(() => import('./routes/ContributePage').then((module) => ({ default: module.ContributePage })))
const DiscoverPage = lazy(() => import('./routes/DiscoverPage').then((module) => ({ default: module.DiscoverPage })))
const FavoritesPage = lazy(() => import('./routes/FavoritesPage').then((module) => ({ default: module.FavoritesPage })))
const HomePage = lazy(() => import('./routes/HomePage').then((module) => ({ default: module.HomePage })))
const LeaderboardsPage = lazy(() => import('./routes/LeaderboardsPage').then((module) => ({ default: module.LeaderboardsPage })))
const ProfilePage = lazy(() => import('./routes/ProfilePage').then((module) => ({ default: module.ProfilePage })))
const RestaurantDetailPage = lazy(() => import('./routes/RestaurantDetailPage').then((module) => ({ default: module.RestaurantDetailPage })))

type NavIconName = 'home' | 'discover' | 'leaderboards' | 'contribute' | 'favorites' | 'profile'

const navItems = [
  { to: '/', label: '首页', icon: 'home' },
  { to: '/discover', label: '发现', icon: 'discover' },
  { to: '/leaderboards', label: '榜单', icon: 'leaderboards' },
  { to: '/contribute', label: '贡献', icon: 'contribute' },
  { to: '/favorites', label: '收藏', icon: 'favorites' },
  { to: '/profile', label: '我的', icon: 'profile' }
] satisfies Array<{ icon: NavIconName; label: string; to: string }>

function TabIcon({ name }: { name: NavIconName }) {
  const commonProps = {
    'aria-hidden': true,
    className: 'mobile-tab-icon',
    fill: 'none',
    stroke: 'currentColor',
    strokeLinecap: 'round' as const,
    strokeLinejoin: 'round' as const,
    strokeWidth: 2,
    viewBox: '0 0 24 24'
  }

  if (name === 'home') {
    return (
      <svg {...commonProps}>
        <path d="M4 11.2 12 4l8 7.2" />
        <path d="M6.5 10.5V20h11v-9.5" />
        <path d="M10 20v-5h4v5" />
      </svg>
    )
  }

  if (name === 'discover') {
    return (
      <svg {...commonProps}>
        <path d="M10.5 18a7.5 7.5 0 1 0 0-15 7.5 7.5 0 0 0 0 15Z" />
        <path d="m16 16 4.5 4.5" />
      </svg>
    )
  }

  if (name === 'leaderboards') {
    return (
      <svg {...commonProps}>
        <path d="M6 20V9" />
        <path d="M12 20V4" />
        <path d="M18 20v-7" />
        <path d="M4 20h16" />
      </svg>
    )
  }

  if (name === 'contribute') {
    return (
      <svg {...commonProps}>
        <path d="M12 5v14" />
        <path d="M5 12h14" />
        <path d="M6.5 6.5h11v11h-11z" />
      </svg>
    )
  }

  if (name === 'favorites') {
    return (
      <svg {...commonProps}>
        <path d="M20.4 7.4c0 5.3-8.4 10.6-8.4 10.6S3.6 12.7 3.6 7.4A4.2 4.2 0 0 1 12 5.9a4.2 4.2 0 0 1 8.4 1.5Z" />
      </svg>
    )
  }

  return (
    <svg {...commonProps}>
      <path d="M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8Z" />
      <path d="M4.8 20a7.4 7.4 0 0 1 14.4 0" />
    </svg>
  )
}

function MobileTabLabel({ item }: { item: (typeof navItems)[number] }) {
  return (
    <>
      <TabIcon name={item.icon} />
      <span>{item.label}</span>
    </>
  )
}

const githubRepoUrl = 'https://github.com/BucketSran/eatAtZJU'
const githubIssuesUrl = `${githubRepoUrl}/issues`

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

      <main className="page-container" id="page-top">
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

      <footer className="app-footer">
        <span>© 2026 食在浙大</span>
        <span className="footer-separator" aria-hidden="true">
          ·
        </span>
        <div className="footer-links">
          <a href={githubRepoUrl} target="_blank" rel="noreferrer">
            GitHub
          </a>
          <span className="footer-separator" aria-hidden="true">
            ·
          </span>
          <a href={githubIssuesUrl} target="_blank" rel="noreferrer">
            Issue
          </a>
        </div>
      </footer>

      <nav className="mobile-tab-bar" aria-label="移动端导航">
        {navItems.map((item) => (
          <NavLink key={item.to} to={item.to} className="mobile-tab">
            <MobileTabLabel item={item} />
          </NavLink>
        ))}
      </nav>

      <OnboardingDialog />
      <ScrollAssistant />
      <ToastHost />
    </div>
  )
}
