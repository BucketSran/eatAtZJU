import { useEffect, useMemo, useState } from 'react'
import { useLocation } from 'react-router-dom'

type ScrollTarget = {
  id?: string
  label: string
}

const defaultTargets: ScrollTarget[] = [{ label: '顶部' }]

const routeTargets: Array<{ match: (pathname: string) => boolean; targets: ScrollTarget[] }> = [
  {
    match: (pathname) => pathname === '/discover',
    targets: [{ label: '顶部' }, { id: 'primary-filters', label: '筛选' }, { id: 'results', label: '结果' }]
  },
  {
    match: (pathname) => pathname === '/leaderboards',
    targets: [{ label: '顶部' }, { id: 'campus-selector', label: '校区' }, { id: 'leaderboard-results', label: '榜单' }]
  },
  {
    match: (pathname) => pathname === '/profile',
    targets: [{ label: '顶部' }, { id: 'campus-selector', label: '校区' }, { id: 'preferences', label: '偏好' }, { id: 'sync-hub', label: '同步' }]
  },
  {
    match: (pathname) => pathname === '/contribute',
    targets: [{ label: '顶部' }, { id: 'contribution-form', label: '表单' }, { id: 'submit-preview', label: '预览' }]
  },
  {
    match: (pathname) => pathname.startsWith('/restaurants/'),
    targets: [{ label: '顶部' }, { id: 'dishes', label: '菜品' }, { id: 'reviews', label: '短评' }, { id: 'related-restaurants', label: '类似' }]
  }
]

function getRouteTargets(pathname: string) {
  return routeTargets.find((route) => route.match(pathname))?.targets ?? defaultTargets
}

function targetExists(target: ScrollTarget) {
  return !target.id || Boolean(document.getElementById(target.id))
}

function scrollToTarget(target: ScrollTarget) {
  if (!target.id) {
    window.scrollTo({ top: 0, behavior: 'smooth' })
    return
  }

  document.getElementById(target.id)?.scrollIntoView({ behavior: 'smooth', block: 'start' })
}

export function ScrollAssistant() {
  const location = useLocation()
  const [expanded, setExpanded] = useState(false)
  const [visible, setVisible] = useState(false)
  const [availableTargets, setAvailableTargets] = useState<ScrollTarget[]>(defaultTargets)
  const targets = useMemo(() => getRouteTargets(location.pathname), [location.pathname])
  const isDetailRoute = location.pathname.startsWith('/restaurants/')

  useEffect(() => {
    setExpanded(false)
    setVisible(window.scrollY > 420)

    const refreshTargets = () => setAvailableTargets(targets.filter(targetExists))
    const frame = requestAnimationFrame(refreshTargets)
    const timeout = window.setTimeout(refreshTargets, 500)

    return () => {
      cancelAnimationFrame(frame)
      window.clearTimeout(timeout)
    }
  }, [location.pathname, targets])

  useEffect(() => {
    let ticking = false
    const onScroll = () => {
      if (ticking) return
      ticking = true
      requestAnimationFrame(() => {
        const shouldShow = window.scrollY > 420
        setVisible(shouldShow)
        if (!shouldShow) setExpanded(false)
        ticking = false
      })
    }

    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  if (!visible) return null

  return (
    <aside className={`scroll-assistant ${expanded ? 'expanded' : ''} ${isDetailRoute ? 'detail-route' : ''}`} aria-label="快速滚动导航">
      {expanded ? (
        <div className="scroll-assistant-menu">
          {availableTargets.map((target) => (
            <button
              key={target.id ?? 'top'}
              type="button"
              onClick={() => {
                scrollToTarget(target)
                setExpanded(false)
              }}
            >
              {target.label}
            </button>
          ))}
        </div>
      ) : null}
      <button className="scroll-assistant-toggle" type="button" aria-expanded={expanded} aria-label={expanded ? '收起快速滚动导航' : '打开快速滚动导航'} onClick={() => setExpanded((current) => !current)}>
        ↑
      </button>
    </aside>
  )
}
