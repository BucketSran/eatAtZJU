import { type CSSProperties, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { campusCenters, getPublicDisplayTags, type CampusOption } from '../constants/restaurantTaxonomy'
import { getAmapConfig, loadAmap, type AMapMapInstance, type AMapMarkerInstance } from '../lib/amapLoader'
import { getMapNavigationLinks } from '../lib/mapLinks'
import { getRestaurantDisplay, getRestaurantScore } from '../lib/restaurantDisplay'
import type { RestaurantSummary } from '../types'

type FoodMapProps = {
  campus: CampusOption
  modeNote?: string
  onFilterOpen?: () => void
  onRestaurantFocus?: (restaurant: RestaurantSummary) => void
  restaurants: RestaurantSummary[]
}

const MAX_VISIBLE_MARKERS = 80
const CLUSTER_GRID_SIZE = 0.0012
const FALLBACK_ZOOM_MIN = -1
const FALLBACK_ZOOM_MAX = 3
const SPIDER_RADIUS_PX = 56
const SPIDER_RADIUS_DEGREES = 0.00022
const DEFAULT_MAP_ZOOM = 16

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

function getScoreTone(restaurant: RestaurantSummary) {
  const score = getRestaurantScore(restaurant)
  if (score >= 90) return 'elite'
  if (score >= 82) return 'good'
  if (score >= 74) return 'fair'
  return 'low'
}

function getMapMarkerLabel(restaurant: RestaurantSummary) {
  const normalizedName = restaurant.name
    .replace(/\s+/g, '')
    .replace(/[（(][^）)]*[）)]/g, '')
    .replace(/^浙江大学/, '')
    .replace(/^浙大/, '')
    .replace(/紫金港校区|玉泉校区|西溪校区|华家池校区|之江校区|海宁校区/g, '')
    .replace(/餐饮中心[-·]?/g, '')
    .replace(/校区/g, '')
  const compactName = normalizedName || getRestaurantDisplay(restaurant).mapAbbr
  return compactName.length > 6 ? compactName.slice(0, 5) : compactName
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

function buildMarkerContent(item: FoodMapItem, selectedId: string | null) {
  const primary = getItemPrimaryRestaurant(item)
  const count = item.restaurants.length
  const isSelected = item.restaurants.some((restaurant) => restaurant.id === selectedId)
  if (count > 1) {
    return `<div class="amap-food-marker food-point cluster ${isSelected ? 'active' : ''}" title="${escapeHtml(`${getMapMarkerLabel(primary)}附近 ${count} 家餐厅`)}"><span class="map-drop" aria-hidden="true"></span><strong>${escapeHtml(getMapMarkerLabel(primary))}</strong><em>${count}家</em></div>`
  }
  return `<div class="amap-food-marker food-point score-${getScoreTone(primary)} ${isSelected ? 'active' : ''}" title="${escapeHtml(`${primary.name}，推荐分 ${getRestaurantScore(primary)}`)}"><span class="map-drop" aria-hidden="true"></span><strong>${escapeHtml(getMapMarkerLabel(primary))}</strong></div>`
}

function buildRestaurantMarkerContent(restaurant: RestaurantSummary, selectedId: string | null) {
  return `<div class="amap-food-marker food-point score-${getScoreTone(restaurant)} spider ${restaurant.id === selectedId ? 'active' : ''}" title="${escapeHtml(`${restaurant.name}，推荐分 ${getRestaurantScore(restaurant)}`)}"><span class="map-drop" aria-hidden="true"></span><strong>${escapeHtml(getMapMarkerLabel(restaurant))}</strong></div>`
}

function getFallbackPosition(item: FoodMapItem, campus: CampusOption, zoomLevel = 0) {
  const center = campusCenters[campus]
  const zoomMultiplier = 1 + zoomLevel * 0.42
  const x = clamp(50 + (item.longitude - center.longitude) * 1050 * zoomMultiplier, 8, 92)
  const y = clamp(50 - (item.latitude - center.latitude) * 1050 * zoomMultiplier, 8, 92)
  return { x, y }
}

export function FoodMap({ campus, modeNote, onFilterOpen, onRestaurantFocus, restaurants }: FoodMapProps) {
  const containerRef = useRef<HTMLDivElement | null>(null)
  const lastCampusRef = useRef<CampusOption | null>(null)
  const mapRef = useRef<AMapMapInstance | null>(null)
  const markersRef = useRef<AMapMarkerInstance[]>([])
  const [mapStatus, setMapStatus] = useState<'loading' | 'ready' | 'fallback'>('fallback')
  const [isExpanded, setIsExpanded] = useState(false)
  const [expandedClusterId, setExpandedClusterId] = useState<string | null>(null)
  const [fallbackZoom, setFallbackZoom] = useState(0)
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const { key } = getAmapConfig()
  const mapRestaurants = useMemo(() => restaurants.filter(hasValidCoordinate).slice(0, MAX_VISIBLE_MARKERS), [restaurants])
  const mapItems = useMemo(() => buildMapItems(mapRestaurants), [mapRestaurants])
  const expandedItem = useMemo(() => mapItems.find((item) => item.id === expandedClusterId && item.restaurants.length > 1) ?? null, [expandedClusterId, mapItems])
  const selectedItem = useMemo(() => mapItems.find((item) => item.restaurants.some((restaurant) => restaurant.id === selectedId)) ?? null, [mapItems, selectedId])
  const selectedRestaurant = selectedItem ? selectedItem.restaurants.find((restaurant) => restaurant.id === selectedId) ?? null : null
  const selectedVisual = selectedRestaurant ? getRestaurantDisplay(selectedRestaurant) : null
  const selectedTags = selectedRestaurant ? getPublicDisplayTags(selectedRestaurant.tags, 3) : []
  const navigationLink = selectedRestaurant ? getMapNavigationLinks(selectedRestaurant)[0] : null

  useEffect(() => {
    if (!mapItems.length) {
      setSelectedId(null)
      setExpandedClusterId(null)
      return
    }
    setExpandedClusterId((currentId) => (currentId && mapItems.some((item) => item.id === currentId && item.restaurants.length > 1) ? currentId : null))
    setSelectedId((currentId) => (currentId && mapItems.some((item) => item.restaurants.some((restaurant) => restaurant.id === currentId)) ? currentId : null))
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

  function closeRestaurantCard() {
    setSelectedId(null)
  }

  function resizeLiveMap() {
    window.requestAnimationFrame(() => {
      mapRef.current?.resize?.()
    })
  }

  function toggleMapFocus() {
    setIsExpanded((expanded) => !expanded)
    window.setTimeout(resizeLiveMap, 220)
  }

  function adjustMapZoom(direction: 1 | -1) {
    const map = mapRef.current
    if (map) {
      if (direction > 0 && map.zoomIn) {
        map.zoomIn()
        return
      }
      if (direction < 0 && map.zoomOut) {
        map.zoomOut()
        return
      }
      if (map.getZoom && map.setZoom) {
        map.setZoom(clamp(map.getZoom() + direction, 11, 19))
        return
      }
    }
    setFallbackZoom((zoom) => clamp(zoom + direction, FALLBACK_ZOOM_MIN, FALLBACK_ZOOM_MAX))
  }

  function resetMapView() {
    setFallbackZoom(0)
    setExpandedClusterId(null)
    const map = mapRef.current
    if (!map) return
    const center = campusCenters[campus]
    map.setCenter([center.longitude, center.latitude])
    map.setZoom?.(DEFAULT_MAP_ZOOM)
    lastCampusRef.current = campus
  }

  function removeLiveMarkers() {
    if (mapRef.current && markersRef.current.length) mapRef.current.remove(markersRef.current)
    markersRef.current = []
  }

  function destroyLiveMap() {
    removeLiveMarkers()
    if (mapRef.current) mapRef.current.destroy()
    mapRef.current = null
    lastCampusRef.current = null
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
          doubleClickZoom: true,
          dragEnable: true,
          pitch: 0,
          resizeEnable: true,
          scrollWheel: true,
          touchZoom: true,
          touchZoomCenter: 1,
          viewMode: '2D',
          zoom: DEFAULT_MAP_ZOOM,
          zoomEnable: true
        })
        mapRef.current = map
        map.setFeatures?.(['bg', 'road', 'building', 'point'])
        if (lastCampusRef.current !== campus) {
          map.setCenter([center.longitude, center.latitude])
          map.setZoom?.(DEFAULT_MAP_ZOOM)
          lastCampusRef.current = campus
        }
        removeLiveMarkers()

        const markers: AMapMarkerInstance[] = []
        for (const item of mapItems) {
          if (expandedItem?.id === item.id) continue
          const primary = getItemPrimaryRestaurant(item)
          const marker = new AMap.Marker({
            anchor: 'bottom-center',
            content: buildMarkerContent(item, selectedId),
            position: [item.longitude, item.latitude]
          })
          marker.on('click', () => {
            setSelectedId(primary.id)
            setExpandedClusterId(item.restaurants.length > 1 ? item.id : null)
          })
          markers.push(marker)
        }

        if (expandedItem) {
          const spiderMarkers = expandedItem.restaurants.map((restaurant, index) => {
            const offset = getSpiderOffset(index, expandedItem.restaurants.length)
            const marker = new AMap.Marker({
              anchor: 'bottom-center',
              content: buildRestaurantMarkerContent(restaurant, selectedId),
              position: [expandedItem.longitude + offset.longitude, expandedItem.latitude + offset.latitude],
              zIndex: 120 + index
            })
            marker.on('click', () => {
              setSelectedId(restaurant.id)
              setExpandedClusterId(expandedItem.id)
            })
            return marker
          })
          markers.push(...spiderMarkers)
        }

        if (markers.length) map.add(markers)
        markersRef.current = markers
        setMapStatus('ready')
      })
      .catch(() => {
        if (!disposed) setMapStatus('fallback')
      })

    return () => {
      disposed = true
    }
  }, [campus, expandedItem, key, mapItems, selectedId])

  useEffect(() => {
    return () => {
      destroyLiveMap()
    }
    // The live AMap instance is intentionally cleaned up only on unmount.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  useEffect(() => {
    resizeLiveMap()
    const timeout = window.setTimeout(resizeLiveMap, 240)
    return () => window.clearTimeout(timeout)
  }, [isExpanded])

  useEffect(() => {
    function closeOnEscape(event: KeyboardEvent) {
      if (event.key === 'Escape') closeRestaurantCard()
    }

    window.addEventListener('keydown', closeOnEscape)
    return () => window.removeEventListener('keydown', closeOnEscape)
  }, [])

  return (
    <section className={`food-map-card food-map-sheet ${isExpanded ? 'expanded' : ''}`} aria-label={`${campus}美食地图`}>
      <div className="food-map-header">
        <div>
          <p className="eyebrow">FOOD MAP</p>
          <h2>{campus}附近地图</h2>
          <p>列表决定吃什么，地图只辅助看距离和导航。点水滴看详情；想拖拽、滚轮缩放或双指缩放时，点“专注地图”。</p>
          {modeNote ? <p className="food-map-mode-note">{modeNote}</p> : null}
        </div>
        <div className="food-map-actions">
          <span className="count-badge">{mapRestaurants.length} 家 · {mapItems.length} 个点位</span>
          <button className="secondary-action compact-action" type="button" aria-pressed={isExpanded} onClick={toggleMapFocus}>
            {isExpanded ? '退出专注' : '专注地图'}
          </button>
        </div>
      </div>

      <div className="food-map-shell">
        <div className="food-map-mapstage">
          <div className={`food-map-canvas ${mapStatus === 'ready' ? 'is-live' : ''}`} ref={containerRef} aria-hidden={mapStatus === 'ready' ? 'true' : undefined}>
            {mapStatus !== 'ready' ? (
              <>
                <div className="food-map-grid" />
                <div className="food-map-campus-core">{campus}</div>
                {mapItems.map((item) => {
                  if (expandedClusterId === item.id && item.restaurants.length > 1) return null
                  const primary = getItemPrimaryRestaurant(item)
                  const position = getFallbackPosition(item, campus, fallbackZoom)
                  return (
                    <button
                      key={item.id}
                      className={`food-map-pin food-point ${item.restaurants.length > 1 ? 'cluster' : `score-${getScoreTone(primary)}`} ${expandedClusterId === item.id ? 'expanded' : ''} ${selectedItem?.id === item.id ? 'active' : ''}`}
                      style={{ left: `${position.x}%`, top: `${position.y}%` }}
                      type="button"
                      aria-label={item.restaurants.length > 1 ? `展开附近 ${item.restaurants.length} 家餐厅` : `查看 ${primary.name}，推荐分 ${getRestaurantScore(primary)}`}
                      onClick={() => selectItem(item)}
                    >
                      <span className="map-drop" aria-hidden="true" />
                      {item.restaurants.length > 1 ? (
                        <>
                          <strong>{getMapMarkerLabel(primary)}</strong>
                          <em>{item.restaurants.length}家</em>
                        </>
                      ) : (
                        <>
                          <strong>{getMapMarkerLabel(primary)}</strong>
                        </>
                      )}
                    </button>
                  )
                })}
                {expandedItem
                  ? expandedItem.restaurants.map((restaurant, index) => {
                      const position = getFallbackPosition(expandedItem, campus, fallbackZoom)
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
                          className={`food-map-pin food-point spider score-${getScoreTone(restaurant)} ${restaurant.id === selectedRestaurant?.id ? 'active' : ''}`}
                          style={style}
                          type="button"
                          aria-label={`选择 ${restaurant.name}，推荐分 ${getRestaurantScore(restaurant)}`}
                          onClick={() => selectRestaurantInItem(expandedItem, restaurant)}
                        >
                          <span className="map-drop" aria-hidden="true" />
                          <strong>{getMapMarkerLabel(restaurant)}</strong>
                        </button>
                      )
                    })
                  : null}
                <p className="food-map-fallback-note">
                  {key ? '高德地图正在加载，如果网络不稳定会先显示轻量点位图。' : '地图底图暂时不可用，先用餐厅坐标展示轻量点位。'}
                </p>
              </>
            ) : null}
          </div>
          <div className="map-corner-controls">
            <button className="map-icon-button" type="button" aria-label="重置地图视图" onClick={resetMapView}>
              <svg aria-hidden="true" viewBox="0 0 24 24">
                <path d="M12 5v3.2" />
                <path d="M12 15.8V19" />
                <path d="M5 12h3.2" />
                <path d="M15.8 12H19" />
                <circle cx="12" cy="12" r="3.6" />
              </svg>
            </button>
            {onFilterOpen ? (
              <button className="map-filter-button" type="button" onClick={onFilterOpen}>
                筛选
              </button>
            ) : null}
          </div>
          <div className="map-zoom-controls" aria-label="地图缩放控制">
            <button type="button" aria-label="放大地图细节" onClick={() => adjustMapZoom(1)}>+</button>
            <button type="button" aria-label="缩小地图范围" onClick={() => adjustMapZoom(-1)}>−</button>
          </div>

          {selectedRestaurant && selectedVisual ? (
            <aside className="food-map-detail map-selected-card" aria-live="polite">
              <div className="map-detail-topbar">
                <span>当前选中 · 地图仍可点选</span>
                <button className="map-detail-close" type="button" aria-label="关闭餐厅详情卡片" onClick={closeRestaurantCard}>
                  <svg aria-hidden="true" viewBox="0 0 24 24">
                    <path d="m7 7 10 10" />
                    <path d="M17 7 7 17" />
                  </svg>
                </button>
              </div>
                <div className="map-selected-main">
                  <div className="map-selected-copy">
                    <div className="map-selected-meta">
                      <span>推荐 {getRestaurantScore(selectedRestaurant)}</span>
                      <span>¥{selectedRestaurant.price}/人</span>
                      <span>步行 {selectedRestaurant.walkMinutes} 分钟</span>
                    </div>
                    <h3>{selectedRestaurant.name}</h3>
                    <p>{selectedRestaurant.area} · {selectedRestaurant.cuisine}</p>
                  </div>
                  <div className={`map-selected-thumbnail ${selectedVisual.tone}`} aria-hidden="true">
                    <strong>{getRestaurantScore(selectedRestaurant)}</strong>
                    <span>推荐分</span>
                  </div>
                </div>
                {selectedTags.length ? (
                  <div className="tag-row compact-tag-row">
                    {selectedTags.map((tag) => (
                      <span className="tag" key={tag}>{tag}</span>
                    ))}
                  </div>
                ) : null}
                <div className="map-detail-actions">
                  <Link className="primary-action compact-action" to={`/restaurants/${selectedRestaurant.id}`}>详情</Link>
                  {navigationLink ? <a className="secondary-action compact-action" href={navigationLink.href} target="_blank" rel="noreferrer">导航</a> : null}
                  <button className="secondary-action compact-action" type="button" onClick={() => onRestaurantFocus?.(selectedRestaurant)}>列表定位</button>
                </div>
                {selectedItem && selectedItem.restaurants.length > 1 ? (
                  <div className="map-cluster-list" aria-label="附近餐厅">
                    {selectedItem.restaurants.slice(0, 4).map((restaurant) => (
                      <button key={restaurant.id} className={restaurant.id === selectedRestaurant.id ? 'active' : ''} type="button" onClick={() => selectRestaurantInItem(selectedItem, restaurant)}>
                        <span>{restaurant.name}</span>
                        <b>{getRestaurantScore(restaurant)}</b>
                      </button>
                    ))}
                  </div>
                ) : null}
            </aside>
          ) : null}
        </div>
      </div>
    </section>
  )
}
