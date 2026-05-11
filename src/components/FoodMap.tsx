import { type CSSProperties, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { campusCenters, type CampusOption } from '../constants/restaurantTaxonomy'
import { getAmapConfig, loadAmap, type AMapMapInstance, type AMapMarkerInstance } from '../lib/amapLoader'
import { getMapNavigationLinks } from '../lib/mapLinks'
import { getRestaurantDisplay, getRestaurantScore } from '../lib/restaurantDisplay'
import type { RestaurantSummary } from '../types'

type FoodMapProps = {
  campus: CampusOption
  modeNote?: string
  onRestaurantFocus?: (restaurant: RestaurantSummary) => void
  restaurants: RestaurantSummary[]
}

const MAX_VISIBLE_MARKERS = 80
const CLUSTER_GRID_SIZE = 0.0012
const SPIDER_RADIUS_PX = 56
const SPIDER_RADIUS_DEGREES = 0.00022

function hasValidCoordinate(restaurant: RestaurantSummary) {
  return Number.isFinite(restaurant.latitude) && Number.isFinite(restaurant.longitude)
}

function clamp(value: number, min: number, max: number) {
  return Math.min(Math.max(value, min), max)
}

function escapeHtml(value: string) {
  return value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;')
}

function getSpiderOffset(index: number, total: number) {
  const angle = total <= 1 ? -Math.PI / 2 : -Math.PI / 2 + (index / total) * Math.PI * 2
  return {
    x: Math.round(Math.cos(angle) * SPIDER_RADIUS_PX),
    y: Math.round(Math.sin(angle) * SPIDER_RADIUS_PX),
    latitude: Math.sin(angle) * SPIDER_RADIUS_DEGREES,
    longitude: Math.cos(angle) * SPIDER_RADIUS_DEGREES
  }
}

type FoodMapItem = {
  id: string
  latitude: number
  longitude: number
  restaurants: RestaurantSummary[]
}

function buildMapItems(restaurants: RestaurantSummary[]): FoodMapItem[] {
  const groups = new Map<string, RestaurantSummary[]>()
  for (const restaurant of restaurants) {
    const key = `${Math.round(restaurant.latitude / CLUSTER_GRID_SIZE)}:${Math.round(restaurant.longitude / CLUSTER_GRID_SIZE)}`
    groups.set(key, [...(groups.get(key) ?? []), restaurant])
  }

  return [...groups.entries()].map(([id, groupedRestaurants]) => {
    const latitude = groupedRestaurants.reduce((sum, restaurant) => sum + restaurant.latitude, 0) / groupedRestaurants.length
    const longitude = groupedRestaurants.reduce((sum, restaurant) => sum + restaurant.longitude, 0) / groupedRestaurants.length
    return {
      id,
      latitude,
      longitude,
      restaurants: [...groupedRestaurants].sort((a: RestaurantSummary, b: RestaurantSummary) => getRestaurantScore(b) - getRestaurantScore(a))
    }
  })
}

function getItemPrimaryRestaurant(item: FoodMapItem) {
  return item.restaurants[0]
}

function buildMarkerContent(item: FoodMapItem) {
  const primary = getItemPrimaryRestaurant(item)
  const count = item.restaurants.length
  const visual = getRestaurantDisplay(primary)
  return `<div class="amap-food-marker ${visual.tone} ${count > 1 ? 'cluster' : ''}" title="${escapeHtml(count > 1 ? `${count} 家餐厅` : primary.name)}"><strong>${count > 1 ? count : escapeHtml(visual.mapIcon)}</strong><span>${count > 1 ? '家' : getRestaurantScore(primary)}</span></div>`
}

function buildRestaurantMarkerContent(restaurant: RestaurantSummary) {
  const visual = getRestaurantDisplay(restaurant)
  return `<div class="amap-food-marker ${visual.tone} spider" title="${escapeHtml(restaurant.name)}"><strong>${escapeHtml(visual.mapIcon)}</strong><span>${getRestaurantScore(restaurant)}</span></div>`
}

function buildInfoWindowContent(restaurant: RestaurantSummary, item?: FoodMapItem) {
  const topTags = restaurant.tags.slice(0, 4).map((tag) => `<span>${escapeHtml(tag)}</span>`).join('')
  const clusterLine = item && item.restaurants.length > 1 ? `<p>这个区域共有 ${item.restaurants.length} 家，已在地图上展开。</p>` : ''
  return `
    <article class="amap-food-card">
      <strong>${escapeHtml(restaurant.name)}</strong>
      <p>${escapeHtml(restaurant.area)} · ¥${restaurant.price}/人 · 高德 ${restaurant.rating}</p>
      ${clusterLine}
      <div>${topTags}</div>
      <a href="/restaurants/${encodeURIComponent(restaurant.id)}">查看详情</a>
    </article>
  `
}

function getFallbackPosition(item: FoodMapItem, campus: CampusOption) {
  const center = campusCenters[campus]
  const x = clamp(50 + (item.longitude - center.longitude) * 1050, 8, 92)
  const y = clamp(50 - (item.latitude - center.latitude) * 1050, 8, 92)
  return { x, y }
}

export function FoodMap({ campus, modeNote, onRestaurantFocus, restaurants }: FoodMapProps) {
  const containerRef = useRef<HTMLDivElement | null>(null)
  const lastFitKeyRef = useRef('')
  const mapRef = useRef<AMapMapInstance | null>(null)
  const markersRef = useRef<AMapMarkerInstance[]>([])
  const [mapStatus, setMapStatus] = useState<'loading' | 'ready' | 'fallback'>('fallback')
  const [isExpanded, setIsExpanded] = useState(false)
  const [expandedClusterId, setExpandedClusterId] = useState<string | null>(null)
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const { key } = getAmapConfig()
  const mapRestaurants = useMemo(() => restaurants.filter(hasValidCoordinate).slice(0, MAX_VISIBLE_MARKERS), [restaurants])
  const mapItems = useMemo(() => buildMapItems(mapRestaurants), [mapRestaurants])
  const fitKey = useMemo(() => `${campus}:${mapItems.map((item) => `${item.id}:${item.restaurants.map((restaurant) => restaurant.id).join('.')}`).join('|')}`, [campus, mapItems])
  const expandedItem = useMemo(() => mapItems.find((item) => item.id === expandedClusterId && item.restaurants.length > 1) ?? null, [expandedClusterId, mapItems])
  const selectedItem = useMemo(() => mapItems.find((item) => item.restaurants.some((restaurant) => restaurant.id === selectedId)) ?? expandedItem ?? mapItems[0] ?? null, [expandedItem, mapItems, selectedId])
  const selectedRestaurant = selectedItem ? (selectedItem.restaurants.find((restaurant) => restaurant.id === selectedId) ?? getItemPrimaryRestaurant(selectedItem)) : null
  const navigationLink = selectedRestaurant ? getMapNavigationLinks(selectedRestaurant)[0] : null

  useEffect(() => {
    if (!mapItems.length) {
      setSelectedId(null)
      setExpandedClusterId(null)
      return
    }
    setExpandedClusterId((currentId) => (currentId && mapItems.some((item) => item.id === currentId && item.restaurants.length > 1) ? currentId : null))
    setSelectedId((currentId) => (currentId && mapItems.some((item) => item.restaurants.some((restaurant) => restaurant.id === currentId)) ? currentId : getItemPrimaryRestaurant(mapItems[0]).id))
  }, [mapItems])

  function selectItem(item: FoodMapItem) {
    const primary = getItemPrimaryRestaurant(item)
    setSelectedId(primary.id)
    setExpandedClusterId(item.restaurants.length > 1 ? item.id : null)
  }

  function selectRestaurantInItem(item: FoodMapItem, restaurant: RestaurantSummary) {
    setExpandedClusterId(item.restaurants.length > 1 ? item.id : null)
    setSelectedId(restaurant.id)
  }

  function removeLiveMarkers() {
    if (mapRef.current && markersRef.current.length) mapRef.current.remove(markersRef.current)
    markersRef.current = []
  }

  function destroyLiveMap() {
    removeLiveMarkers()
    if (mapRef.current) mapRef.current.destroy()
    mapRef.current = null
    lastFitKeyRef.current = ''
  }

  useEffect(() => {
    const container = containerRef.current
    if (!container || !key || !mapItems.length) {
      destroyLiveMap()
      setMapStatus('fallback')
      return undefined
    }

    let disposed = false

    if (!mapRef.current) setMapStatus('loading')
    loadAmap()
      .then((AMap) => {
        if (disposed) return
        const center = campusCenters[campus]
        const map = mapRef.current ?? new AMap.Map(container, {
          center: [center.longitude, center.latitude],
          mapStyle: 'amap://styles/macaron',
          pitch: 0,
          resizeEnable: true,
          viewMode: '2D',
          zoom: 15
        })
        mapRef.current = map
        removeLiveMarkers()

        const infoWindow = new AMap.InfoWindow({
          anchor: 'bottom-center',
          offset: new AMap.Pixel(0, -18)
        })

        const markers: AMapMarkerInstance[] = []
        for (const item of mapItems) {
          if (expandedItem?.id === item.id) continue
          const primary = getItemPrimaryRestaurant(item)
          const marker = new AMap.Marker({
            anchor: 'bottom-center',
            content: buildMarkerContent(item),
            position: [item.longitude, item.latitude]
          })
          marker.on('click', () => {
            setSelectedId(primary.id)
            setExpandedClusterId(item.restaurants.length > 1 ? item.id : null)
            infoWindow.setContent(buildInfoWindowContent(primary, item))
            if (map) infoWindow.open(map, marker.getPosition())
          })
          markers.push(marker)
        }

        if (expandedItem) {
          const spiderMarkers = expandedItem.restaurants.map((restaurant, index) => {
            const offset = getSpiderOffset(index, expandedItem.restaurants.length)
            const marker = new AMap.Marker({
              anchor: 'bottom-center',
              content: buildRestaurantMarkerContent(restaurant),
              position: [expandedItem.longitude + offset.longitude, expandedItem.latitude + offset.latitude],
              zIndex: 120 + index
            })
            marker.on('click', () => {
              setSelectedId(restaurant.id)
              setExpandedClusterId(expandedItem.id)
              infoWindow.setContent(buildInfoWindowContent(restaurant, expandedItem))
              if (map) infoWindow.open(map, marker.getPosition())
            })
            return marker
          })
          markers.push(...spiderMarkers)
        }

        if (markers.length) map.add(markers)
        markersRef.current = markers
        if (fitKey !== lastFitKeyRef.current) {
          map.setCenter([center.longitude, center.latitude])
          map.setFitView(markers)
          lastFitKeyRef.current = fitKey
        }
        setMapStatus('ready')
      })
      .catch(() => {
        if (!disposed) setMapStatus('fallback')
      })

    return () => {
      disposed = true
    }
  }, [campus, expandedItem, fitKey, key, mapItems])

  useEffect(() => {
    return () => {
      destroyLiveMap()
    }
    // The live AMap instance is intentionally cleaned up only on unmount.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return (
    <section className={`food-map-card ${isExpanded ? 'expanded' : ''}`} aria-label={`${campus}美食地图`}>
      <div className="food-map-header">
        <div>
          <p className="eyebrow">FOOD MAP</p>
          <h2>{campus}美食地图</h2>
          <p>先看餐厅分布，再用筛选缩小范围。相近点位会自动合并，点开后可看附近餐厅。</p>
          {modeNote ? <p className="food-map-mode-note">{modeNote}</p> : null}
        </div>
        <div className="food-map-actions">
          <span className="count-badge">{mapRestaurants.length} 家 · {mapItems.length} 个点位</span>
          <button className="secondary-action compact-action" type="button" onClick={() => setIsExpanded((expanded) => !expanded)}>
            {isExpanded ? '收起地图' : '放大地图'}
          </button>
        </div>
      </div>

      <div className="food-map-shell">
        <div className={`food-map-canvas ${mapStatus === 'ready' ? 'is-live' : ''}`} ref={containerRef} aria-hidden={mapStatus === 'ready' ? 'true' : undefined}>
          {mapStatus !== 'ready' ? (
            <>
              <div className="food-map-grid" />
              <div className="food-map-campus-core">{campus}</div>
              {mapItems.map((item) => {
                if (expandedClusterId === item.id && item.restaurants.length > 1) return null
                const primary = getItemPrimaryRestaurant(item)
                const visual = getRestaurantDisplay(primary)
                const position = getFallbackPosition(item, campus)
                return (
                  <button
                    key={item.id}
                    className={`food-map-pin ${visual.tone} ${item.restaurants.length > 1 ? 'cluster' : ''} ${expandedClusterId === item.id ? 'expanded' : ''} ${selectedItem?.id === item.id ? 'active' : ''}`}
                    style={{ left: `${position.x}%`, top: `${position.y}%` }}
                    type="button"
                    aria-label={item.restaurants.length > 1 ? `展开附近 ${item.restaurants.length} 家餐厅` : `查看 ${primary.name}`}
                    onClick={() => selectItem(item)}
                  >
                    <strong>{item.restaurants.length > 1 ? item.restaurants.length : visual.mapIcon}</strong>
                    <span>{item.restaurants.length > 1 ? '家' : getRestaurantScore(primary)}</span>
                  </button>
                )
              })}
              {expandedItem
                ? expandedItem.restaurants.map((restaurant, index) => {
                    const visual = getRestaurantDisplay(restaurant)
                    const position = getFallbackPosition(expandedItem, campus)
                    const offset = getSpiderOffset(index, expandedItem.restaurants.length)
                    const style = {
                      left: `${position.x}%`,
                      top: `${position.y}%`,
                      '--spider-x': `${offset.x}px`,
                      '--spider-y': `${offset.y}px`
                    } as CSSProperties
                    return (
                      <button
                        key={`spider-${restaurant.id}`}
                        className={`food-map-pin spider ${visual.tone} ${restaurant.id === selectedRestaurant?.id ? 'active' : ''}`}
                        style={style}
                        type="button"
                        aria-label={`选择 ${restaurant.name}`}
                        onClick={() => selectRestaurantInItem(expandedItem, restaurant)}
                      >
                        <strong>{visual.mapIcon}</strong>
                        <span>{getRestaurantScore(restaurant)}</span>
                      </button>
                    )
                  })
                : null}
              <p className="food-map-fallback-note">
                {key ? '高德地图正在加载，如果网络不稳定会先显示轻量点位图。' : '还没有配置 VITE_AMAP_JS_KEY，先用数据库坐标展示轻量地图。'}
              </p>
            </>
          ) : null}
        </div>

        <aside className="food-map-detail">
          {selectedRestaurant ? (
            <>
              <span className="map-score-pill">推荐 {getRestaurantScore(selectedRestaurant)}</span>
              <h3>{selectedRestaurant.name}</h3>
              <p>{selectedRestaurant.area} · {selectedRestaurant.cuisine} · 步行 {selectedRestaurant.walkMinutes} 分钟</p>
              <div className="tag-row compact-tag-row">
                {selectedRestaurant.tags.slice(0, 5).map((tag) => (
                  <span className="tag" key={tag}>{tag}</span>
                ))}
              </div>
              <div className="map-detail-actions">
                <Link className="primary-action compact-action" to={`/restaurants/${selectedRestaurant.id}`}>查看详情</Link>
                {navigationLink ? <a className="secondary-action compact-action" href={navigationLink.href} target="_blank" rel="noreferrer">高德导航</a> : null}
                <button className="secondary-action compact-action" type="button" onClick={() => onRestaurantFocus?.(selectedRestaurant)}>定位到列表</button>
              </div>
              {selectedItem && selectedItem.restaurants.length > 1 ? (
                <div className="map-cluster-list" aria-label="附近餐厅">
                  <strong>此处 {selectedItem.restaurants.length} 家餐厅</strong>
                  <p>已在地图上散开成小点；也可以直接在这里切换。</p>
                  {selectedItem.restaurants.map((restaurant) => (
                    <button key={restaurant.id} className={restaurant.id === selectedRestaurant.id ? 'active' : ''} type="button" onClick={() => selectRestaurantInItem(selectedItem, restaurant)}>
                      <span>{restaurant.name}</span>
                      <b>{getRestaurantScore(restaurant)}</b>
                    </button>
                  ))}
                </div>
              ) : null}
            </>
          ) : (
            <>
              <h3>当前筛选没有可显示点位</h3>
              <p>可以放宽校区、餐饮大类或预算，地图会自动同步列表结果。</p>
            </>
          )}
        </aside>
      </div>
    </section>
  )
}
