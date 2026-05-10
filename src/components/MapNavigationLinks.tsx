import { getMapNavigationLinks } from '../lib/mapLinks'
import type { Restaurant } from '../types'

type MapNavigationLinksProps = {
  compact?: boolean
  restaurant: Restaurant
}

export function MapNavigationLinks({ compact = false, restaurant }: MapNavigationLinksProps) {
  const links = getMapNavigationLinks(restaurant)

  if (compact) {
    return (
      <details className="map-link-menu">
        <summary>导航</summary>
        <div className="map-link-popover">
          {links.map((link) => (
            <a key={link.provider} href={link.href} target="_blank" rel="noreferrer">
              {link.label}
            </a>
          ))}
        </div>
      </details>
    )
  }

  return (
    <div className="map-link-panel" aria-label={`${restaurant.name} 地图导航`}>
      <div>
        <p className="eyebrow">NAVIGATION</p>
        <strong>一键导航到店</strong>
        <span>手机上优先拉起对应地图 App，电脑上打开网页版路线。</span>
      </div>
      <div className="map-link-row">
        {links.map((link) => (
          <a key={link.provider} className={`map-link-button ${link.provider}`} href={link.href} target="_blank" rel="noreferrer">
            {link.label}
          </a>
        ))}
      </div>
    </div>
  )
}
