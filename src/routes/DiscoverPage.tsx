import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { campusCenters, campusOptions, dietaryConstraintTags, getCurrentMealPeriod, hardFilterGroups, mealPeriodOptions, parseTagsParam, preferenceTagGroups, quickRandomExclusiveGroups, quickRandomTags, scenarioTagGroups, serviceModeOptions, toggleMultiTag, type CampusOption } from '../constants/restaurantTaxonomy'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { getPreferenceTags } from '../services/preferenceStore'
import { describeApiSource, getRandomRestaurant, getRandomRestaurantRemote, getRestaurantMetadata, listRestaurants, listRestaurantsRemote } from '../services/restaurantService'
import type { RestaurantSummary, SortKey } from '../types'

const sortOptions: Array<{ label: string; value: SortKey }> = [
  { label: '推荐', value: 'recommended' },
  { label: '距离', value: 'distance' },
  { label: '评分', value: 'rating' },
  { label: '价格', value: 'price' }
]

const mealCategoryOptions = [
  { label: '先找正餐', value: '正餐' },
  { label: '饮品甜点', value: '饮品' },
  { label: '全部', value: '全部' }
]

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

function splitInitialTags(tags: string[]) {
  return {
    scenarioTags: tags.filter((tag) => scenarioTagGroups.some((group) => group.tags.includes(tag as never))),
    dietaryTags: tags.filter((tag) => dietaryConstraintTags.includes(tag as never)),
    preferenceTags: tags.filter((tag) => preferenceTagGroups.some((group) => group.tags.includes(tag as never))),
    spiceLevel: tags.includes('辣') ? '辣' : tags.includes('不辣') ? '不辣' : '不限',
    loadLevel: tags.includes('轻负担') ? '轻负担' : tags.includes('大份') ? '大份' : tags.includes('快乐碳水') ? '快乐碳水' : '不限'
  }
}

function readStoredCampus(): CampusOption {
  if (typeof window === 'undefined') return '紫金港'
  const stored = window.localStorage.getItem('eatAtZjuCampus')
  return campusOptions.includes(stored as CampusOption) ? (stored as CampusOption) : '紫金港'
}

function persistCampus(campus: string) {
  if (typeof window !== 'undefined') window.localStorage.setItem('eatAtZjuCampus', campus)
}

function toggleQuickRandomTag(currentTags: string[], tag: string) {
  const exclusiveGroup = quickRandomExclusiveGroups.find((group) => group.includes(tag as never))
  if (currentTags.includes(tag)) return currentTags.filter((currentTag) => currentTag !== tag)
  if (!exclusiveGroup) return [...currentTags, tag]
  return [...currentTags.filter((currentTag) => !exclusiveGroup.includes(currentTag as never)), tag]
}

function getInitialRandomTags(searchParams: URLSearchParams) {
  const tags = parseTagsParam(searchParams.get('randomTags'))
  const legacyTag = searchParams.get('randomTag')
  if (tags.length) return tags
  return legacyTag && legacyTag !== '全部' ? [legacyTag] : []
}

function distanceKm(a: { latitude: number; longitude: number }, b: { latitude: number; longitude: number }) {
  const radius = 6371
  const toRadians = (degree: number) => (degree * Math.PI) / 180
  const deltaLatitude = toRadians(b.latitude - a.latitude)
  const deltaLongitude = toRadians(b.longitude - a.longitude)
  const latitude1 = toRadians(a.latitude)
  const latitude2 = toRadians(b.latitude)
  const h = Math.sin(deltaLatitude / 2) ** 2 + Math.cos(latitude1) * Math.cos(latitude2) * Math.sin(deltaLongitude / 2) ** 2
  return 2 * radius * Math.asin(Math.sqrt(h))
}

function getNearestCampus(position: { latitude: number; longitude: number }) {
  return campusOptions
    .map((campus) => ({ campus, distance: distanceKm(position, campusCenters[campus]) }))
    .sort((a, b) => a.distance - b.distance)[0]
}

export function DiscoverPage() {
  const [searchParams, setSearchParams] = useSearchParams()
  const metadata = getRestaurantMetadata()
  const [keyword, setKeyword] = useState(() => searchParams.get('keyword') ?? '')
  const [campus, setCampus] = useState<CampusOption>(() => {
    const initialCampus = searchParams.get('campus') ?? readStoredCampus()
    return campusOptions.includes(initialCampus as CampusOption) ? (initialCampus as CampusOption) : '紫金港'
  })
  const [serviceMode, setServiceMode] = useState(() => searchParams.get('mode') ?? '都可以')
  const [mealCategory, setMealCategory] = useState(() => searchParams.get('category') ?? '正餐')
  const [mealPeriod, setMealPeriod] = useState(() => searchParams.get('meal') ?? getCurrentMealPeriod())
  const initialTags = useMemo(() => {
    const tags = [
      ...parseTagsParam(searchParams.get('tags')),
      ...parseTagsParam(searchParams.get('scenario')),
      ...parseTagsParam(searchParams.get('dietary')),
      ...parseTagsParam(searchParams.get('preference'))
    ]
    const legacyTag = searchParams.get('tag')
    return splitInitialTags(tags.length || !legacyTag || legacyTag === '全部' ? tags : [legacyTag])
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])
  const [scenarioTags, setScenarioTags] = useState(() => initialTags.scenarioTags)
  const [dietaryTags, setDietaryTags] = useState(() => initialTags.dietaryTags)
  const [preferenceTags, setPreferenceTags] = useState(() => initialTags.preferenceTags)
  const [distanceLabel, setDistanceLabel] = useState(() => searchParams.get('distance') ?? '不限')
  const [spiceLevel, setSpiceLevel] = useState(() => searchParams.get('spice') ?? initialTags.spiceLevel)
  const [loadLevel, setLoadLevel] = useState(() => searchParams.get('load') ?? initialTags.loadLevel)
  const [priceLabel, setPriceLabel] = useState(() => searchParams.get('price') ?? '不限')
  const [randomCampus, setRandomCampus] = useState<CampusOption>(() => {
    const campus = searchParams.get('randomCampus') ?? readStoredCampus()
    return campusOptions.includes(campus as CampusOption) ? (campus as CampusOption) : '紫金港'
  })
  const [sort, setSort] = useState<SortKey>(() => (searchParams.get('sort') as SortKey) || 'recommended')
  const [randomBudget, setRandomBudget] = useState(() => searchParams.get('randomBudget') ?? '不限')
  const [randomTags, setRandomTags] = useState<string[]>(() => getInitialRandomTags(searchParams))
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const getCategoryTags = (category = mealCategory) => (category === '全部' ? [] : [category])
  const initialFilters = { keyword, campus, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort, tags: getCategoryTags() }
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>(() => listRestaurants(initialFilters, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [randomPick, setRandomPick] = useState<RestaurantSummary | null>(null)
  const [randomMessage, setRandomMessage] = useState('')
  const [randomNonce, setRandomNonce] = useState(0)
  const [locationStatus, setLocationStatus] = useState('')
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)

  const scenarioKey = scenarioTags.join(',')
  const dietaryKey = dietaryTags.join(',')
  const preferenceKey = preferenceTags.join(',')
  const randomTagKey = randomTags.join(',')
  const filters = useMemo(() => ({ keyword, campus, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort, tags: getCategoryTags(mealCategory) }), [campus, dietaryKey, distanceLabel, keyword, loadLevel, mealCategory, mealPeriod, preferenceKey, priceLabel, scenarioKey, serviceMode, sort, spiceLevel])
  const context = useMemo(() => ({ preferences: [...preferences, campus, serviceMode, mealPeriod, mealCategory, ...scenarioTags, ...preferenceTags], favoriteRestaurantIds: favoriteIds }), [campus, favoriteIds, mealCategory, mealPeriod, preferenceKey, preferences, scenarioKey, serviceMode])
  const showRandom = searchParams.get('random') === '1'
  const summaryItems = [campus, mealCategory, serviceMode, mealPeriod, ...scenarioTags, priceLabel !== '不限' ? priceLabel : '', distanceLabel !== '不限' ? distanceLabel : '', spiceLevel !== '不限' ? spiceLevel : '', loadLevel !== '不限' ? loadLevel : '', ...dietaryTags, ...preferenceTags].filter(Boolean)

  useEffect(() => {
    const next = new URLSearchParams()
    if (keyword) next.set('keyword', keyword)
    if (campus !== '紫金港') next.set('campus', campus)
    if (mealCategory !== '正餐') next.set('category', mealCategory)
    if (serviceMode !== '都可以') next.set('mode', serviceMode)
    if (mealPeriod !== getCurrentMealPeriod()) next.set('meal', mealPeriod)
    if (scenarioTags.length) next.set('scenario', scenarioTags.join(','))
    if (dietaryTags.length) next.set('dietary', dietaryTags.join(','))
    if (preferenceTags.length) next.set('preference', preferenceTags.join(','))
    if (distanceLabel !== '不限') next.set('distance', distanceLabel)
    if (spiceLevel !== '不限') next.set('spice', spiceLevel)
    if (loadLevel !== '不限') next.set('load', loadLevel)
    if (priceLabel !== '不限') next.set('price', priceLabel)
    if (sort !== 'recommended') next.set('sort', sort)
    if (showRandom) next.set('random', '1')
    if (showRandom && randomCampus !== '紫金港') next.set('randomCampus', randomCampus)
    if (showRandom && randomBudget !== '不限') next.set('randomBudget', randomBudget)
    if (showRandom && randomTags.length) next.set('randomTags', randomTags.join(','))
    setSearchParams(next, { replace: true })
  }, [campus, dietaryKey, dietaryTags, distanceLabel, keyword, loadLevel, mealCategory, mealPeriod, preferenceKey, preferenceTags, priceLabel, randomBudget, randomCampus, randomTagKey, randomTags, scenarioKey, scenarioTags, serviceMode, setSearchParams, showRandom, sort, spiceLevel])

  useEffect(() => {
    const controller = new AbortController()
    setIsLoading(true)

    listRestaurantsRemote(filters, context, controller.signal)
      .then((result) => {
        setRestaurants(result.data)
        setDataSource(describeApiSource(result.source, result.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) setRestaurants(listRestaurants(filters, context))
      })
      .finally(() => {
        if (!controller.signal.aborted) setIsLoading(false)
      })

    return () => controller.abort()
  }, [context, filters])

  useEffect(() => {
    if (!showRandom) {
      setRandomPick(null)
      return
    }

    const controller = new AbortController()
    const serviceTags = randomTags.filter((tag) => tag === '外卖' || tag === '堂食')
    const randomMealPeriod = randomTags.includes('夜宵') ? '夜宵' : undefined
    const randomFilters = {
      campus: randomCampus,
      priceLabel: randomBudget,
      serviceMode: serviceTags.length === 1 ? serviceTags[0] : '都可以',
      mealPeriod: randomMealPeriod,
      tags: randomTags
    }
    const randomContext = { ...context, preferences: [...context.preferences, ...randomTags, randomCampus] }
    setRandomMessage('正在按条件摇一餐...')

    getRandomRestaurantRemote(randomFilters, randomContext, controller.signal)
      .then((result) => {
        setRandomPick(result.data)
        setRandomMessage(result.data ? '' : '这个组合暂时没有匹配餐厅，可以放宽校区、预算或标签。')
        setDataSource(describeApiSource(result.source, result.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) {
          const fallback = getRandomRestaurant(randomFilters, randomContext)
          setRandomPick(fallback)
          setRandomMessage(fallback ? '' : '这个组合暂时没有匹配餐厅，可以放宽校区、预算或标签。')
        }
      })

    return () => controller.abort()
  }, [context, randomBudget, randomCampus, randomNonce, randomTagKey, showRandom])

  function toggleFavorite(id: string) {
    const nextIds = toggleFavoriteRestaurant(id)
    setFavoriteIds(nextIds)
    import('../services/favoriteSyncService')
      .then(({ setFavoriteInSupabase }) => setFavoriteInSupabase(id, nextIds.includes(id)))
      .then(setFavoriteIds)
      .catch(() => {
        setDataSource('收藏已先保存在本地，登录后可同步云端')
      })
  }

  function clearAllFilters() {
    setCampus(readStoredCampus())
    setServiceMode('都可以')
    setMealCategory('正餐')
    setMealPeriod(getCurrentMealPeriod())
    setScenarioTags([])
    setDietaryTags([])
    setPreferenceTags([])
    setDistanceLabel('不限')
    setSpiceLevel('不限')
    setLoadLevel('不限')
    setPriceLabel('不限')
  }

  function selectCampus(nextCampus: string) {
    const resolvedCampus = campusOptions.includes(nextCampus as CampusOption) ? (nextCampus as CampusOption) : '紫金港'
    setCampus(resolvedCampus)
    persistCampus(resolvedCampus)
  }

  function selectRandomCampus(campus: string) {
    const nextCampus = campusOptions.includes(campus as CampusOption) ? (campus as CampusOption) : '紫金港'
    setRandomCampus(nextCampus)
    persistCampus(nextCampus)
    setLocationStatus(nextCampus === '紫金港' ? '已切到紫金港。当前真实数据主要覆盖紫金港。' : `${nextCampus} 数据正在采集中，当前可能没有结果。`)
  }

  function requestCurrentLocation() {
    if (!navigator.geolocation) {
      setLocationStatus('当前浏览器不支持定位，请手动选择校区。')
      return
    }

    setLocationStatus('正在请求浏览器定位，只用于判断最近校区，不会上传精确位置。')
    navigator.geolocation.getCurrentPosition(
      (position) => {
        const nearest = getNearestCampus({
          latitude: position.coords.latitude,
          longitude: position.coords.longitude
        })
        selectRandomCampus(nearest.campus)
        setLocationStatus(`已根据当前位置选择 ${nearest.campus}，约 ${nearest.distance.toFixed(1)}km。精确位置未上传。`)
      },
      () => {
        setLocationStatus('定位被拒绝或超时。没关系，可以手动选择校区继续摇。')
      },
      { enableHighAccuracy: false, maximumAge: 1000 * 60 * 10, timeout: 5000 }
    )
  }

  function triggerRandomPick() {
    setSearchParams((current) => {
      const next = new URLSearchParams(current)
      next.set('random', '1')
      if (randomCampus !== '紫金港') next.set('randomCampus', randomCampus)
      else next.delete('randomCampus')
      if (randomBudget !== '不限') next.set('randomBudget', randomBudget)
      else next.delete('randomBudget')
      if (randomTags.length) next.set('randomTags', randomTags.join(','))
      else next.delete('randomTags')
      next.delete('randomTag')
      return next
    })
    setRandomNonce((nonce) => nonce + 1)
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">DISCOVER</p>
          <h1>发现餐厅</h1>
          <p>按口味、预算、距离和公开 POI 信息筛选；后续有真实 UGC 后，学生评价会占推荐权重的 80%。</p>
        </div>
        <span className="count-badge">{restaurants.length} 家匹配</span>
      </div>

      <div className="status-strip">
        <span aria-live="polite">{isLoading ? '正在同步后端数据…' : dataSource}</span>
      </div>

      <GlassCard className="filters-card">
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">DECISION HELPER</p>
            <h2>随机吃什么增强</h2>
            <p>三行约束就够了：先定校区，再定预算，最后加几个关键标签。定位只在你点击时请求。</p>
          </div>
        </div>
        <div className="quick-random-panel">
          <div className="quick-random-row">
            <div className="quick-random-copy">
              <strong>校区</strong>
              <span>默认不拿定位；想找附近再点右侧按钮。</span>
            </div>
            <div className="quick-random-controls">
              <SegmentedControl label="随机校区" options={campusOptions.map((campus) => ({ label: campus, value: campus }))} value={randomCampus} onChange={selectRandomCampus} />
              <button className="secondary-action compact-action" type="button" onClick={requestCurrentLocation}>使用当前位置</button>
            </div>
          </div>
          <div className="quick-random-row">
            <div className="quick-random-copy">
              <strong>预算</strong>
              <span>快速收窄候选，不用填很精确。</span>
            </div>
            <SegmentedControl label="随机预算" options={metadata.priceRanges.map((range) => ({ label: range.label, value: range.label }))} value={randomBudget} onChange={setRandomBudget} />
          </div>
          <div className="quick-random-row">
            <div className="quick-random-copy">
              <strong>标签</strong>
              <span>可多选；辣/不辣、外卖/堂食会自动互斥。</span>
            </div>
            <div className="chip-row" aria-label="随机关键标签">
              {quickRandomTags.map((tag) => (
                <button key={tag} className={`chip ${randomTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={randomTags.includes(tag)} onClick={() => setRandomTags((tags) => toggleQuickRandomTag(tags, tag))}>
                  {tag}
                </button>
              ))}
            </div>
          </div>
        </div>
        {locationStatus ? <p className="helper-text subtle-helper">{locationStatus}</p> : null}
        <button className="primary-action" type="button" onClick={triggerRandomPick}>
          按条件摇一餐
        </button>
      </GlassCard>

      {showRandom ? (
        <GlassCard className="result-card">
          <p className="eyebrow">RANDOM PICK</p>
          {randomPick ? (
            <>
              <h2>{randomPick.name}</h2>
              <p>
                当前条件：{randomCampus} · {randomBudget}{randomTags.length ? ` · ${randomTags.join(' / ')}` : ''}。结果：{randomPick.area} · {randomPick.cuisine} · ¥{randomPick.price}/人。
              </p>
            </>
          ) : (
            <>
              <h2>还没有摇到合适结果</h2>
              <p>{randomMessage || '点击上面的按钮后，结果会出现在这里。'}</p>
            </>
          )}
        </GlassCard>
      ) : null}

      <GlassCard className="filters-card">
        <label className="search-label" htmlFor="restaurant-search">
          搜索餐厅、标签或场景
        </label>
        <input id="restaurant-search" name="restaurant-search" className="search-input" value={keyword} placeholder="例如：辣 / 夜宵 / 一人食…" autoComplete="off" onChange={(event) => setKeyword(event.target.value)} />
        <div className="filter-flow">
          <div className="flow-step">
            <span className="flow-step-index">1</span>
            <div className="filter-section">
              <div className="filter-section-head">
                <div>
                  <span className="filter-section-label">先定校区和大类</span>
                  <p>默认看当前校区的正餐，下午茶或奶茶再切到饮品甜点。</p>
                </div>
              </div>
              <SegmentedControl label="校区" options={campusOptions.map((option) => ({ label: option, value: option }))} value={campus} onChange={selectCampus} />
              <SegmentedControl label="餐饮大类" options={mealCategoryOptions} value={mealCategory} onChange={setMealCategory} />
            </div>
          </div>
          <div className="flow-step">
            <span className="flow-step-index">2</span>
            <SegmentedControl label="怎么吃" options={serviceModeOptions.map((mode) => ({ label: mode, value: mode }))} value={serviceMode} onChange={setServiceMode} />
          </div>
          <div className="flow-step">
            <span className="flow-step-index">3</span>
            <SegmentedControl label="什么时候吃" options={mealPeriodOptions.map((period) => ({ label: period, value: period }))} value={mealPeriod} onChange={setMealPeriod} />
          </div>
          <div className="flow-step">
            <span className="flow-step-index">4</span>
            <div className="filter-section">
              <div className="filter-section-head">
                <div>
                  <span className="filter-section-label">这顿饭的场景</span>
                  <p>同一层可以叠加，比如“一人食 + 赶课快吃”。</p>
                </div>
              </div>
              {scenarioTagGroups.map((group) => (
                <div className="chip-row" aria-label={group.title} key={group.title}>
                  {group.tags.map((tag) => (
                    <button key={tag} className={`chip ${scenarioTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={scenarioTags.includes(tag)} onClick={() => setScenarioTags((tags) => toggleMultiTag(tags, tag))}>
                      {tag}
                    </button>
                  ))}
                </div>
              ))}
            </div>
          </div>
          <div className="flow-step">
            <span className="flow-step-index">5</span>
            <div className="filter-section">
              <div className="filter-section-head">
                <div>
                  <span className="filter-section-label">硬条件</span>
                  <p>这些条件会直接缩小结果。冲突项已经做成单选。</p>
                </div>
              </div>
              <SegmentedControl label="预算" options={metadata.priceRanges.map((range) => ({ label: range.label, value: range.label }))} value={priceLabel} onChange={setPriceLabel} />
              {hardFilterGroups.map((group) => {
                const value = group.key === 'distanceLabel' ? distanceLabel : group.key === 'spiceLevel' ? spiceLevel : loadLevel
                const onChange = group.key === 'distanceLabel' ? setDistanceLabel : group.key === 'spiceLevel' ? setSpiceLevel : setLoadLevel
                return <SegmentedControl key={group.key} label={group.title} options={group.options.map((option) => ({ label: option, value: option }))} value={value} onChange={onChange} />
              })}
              <div className="chip-row" aria-label="饮食限制">
                {dietaryConstraintTags.map((tag) => (
                  <button key={tag} className={`chip ${dietaryTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={dietaryTags.includes(tag)} onClick={() => setDietaryTags((tags) => toggleMultiTag(tags, tag))}>
                    {tag}
                  </button>
                ))}
              </div>
            </div>
          </div>
          <div className="flow-step">
            <span className="flow-step-index">6</span>
            <div className="filter-section">
              <div className="filter-section-head">
                <div>
                  <span className="filter-section-label">偏好加分</span>
                  <p>这些更像“我想吃什么”，主要影响推荐排序。</p>
                </div>
              </div>
              {preferenceTagGroups.map((group) => (
                <div className="chip-row" aria-label={group.title} key={group.title}>
                  {group.tags.map((tag) => (
                    <button key={tag} className={`chip ${preferenceTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={preferenceTags.includes(tag)} onClick={() => setPreferenceTags((tags) => toggleMultiTag(tags, tag))}>
                      {tag}
                    </button>
                  ))}
                </div>
              ))}
            </div>
          </div>
        </div>
        <div className="filter-summary">
          <div className="filter-section-head">
            <div>
              <span className="filter-section-label">当前路径</span>
              <p>{summaryItems.length ? summaryItems.join(' > ') : '未设置额外筛选'}</p>
            </div>
            <button className="text-action" type="button" onClick={clearAllFilters}>重置筛选</button>
          </div>
        </div>
        <SegmentedControl label="排序" options={sortOptions} value={sort} onChange={setSort} />
      </GlassCard>

      {restaurants.length ? (
        <div className="restaurant-list">
          {restaurants.map((restaurant) => (
            <RestaurantCard key={restaurant.id} restaurant={restaurant} onToggleFavorite={toggleFavorite} />
          ))}
        </div>
      ) : (
        <GlassCard>
          <h2>没有找到匹配餐厅。</h2>
          <p>换个标签试试，或清空搜索条件。</p>
        </GlassCard>
      )}
    </div>
  )
}
