import { useDeferredValue, useEffect, useMemo, useState, useTransition } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { BottomSheet } from '../components/BottomSheet'
import { EmptyState } from '../components/EmptyState'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { SkeletonList } from '../components/Skeleton'
import { TagGroupSelector } from '../components/TagGroupSelector'
import { showToast } from '../lib/toast'
import { campusCenters, campusOptions, dietaryConstraintTags, discoverFilterScenes, getCurrentMealPeriod, hardFilterGroups, mealCategoryOptions, mealPeriodOptions, parseTagsParam, preferenceExclusiveGroups, preferenceTagGroups, quickRandomExclusiveGroups, quickRandomTags, scenarioTagGroups, serviceModeOptions, toggleGroupedTag, toggleMultiTag, type CampusOption, type DiscoverFilterSceneId, type MealCategoryOption } from '../constants/restaurantTaxonomy'
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

const RESTAURANT_RENDER_STEP = 12
const refinementExclusiveGroups = [...preferenceExclusiveGroups, ['食堂', '非食堂'], ['堂食', '外卖']] as const

function isAbortError(error: unknown) {
  return error instanceof DOMException && error.name === 'AbortError'
}

function splitInitialTags(tags: string[]) {
  const scenarioTags = tags.filter((tag) => scenarioTagGroups.some((group) => group.tags.includes(tag as never)))
  const dietaryTags = tags.filter((tag) => dietaryConstraintTags.includes(tag as never))
  const preferenceTags = tags.filter((tag) => preferenceTagGroups.some((group) => group.tags.includes(tag as never)))
  const classifiedTags = new Set([...scenarioTags, ...dietaryTags, ...preferenceTags, '辣', '不辣', '轻负担', '大份', '快乐碳水'])
  return {
    scenarioTags,
    dietaryTags,
    preferenceTags,
    refinementTags: tags.filter((tag) => !classifiedTags.has(tag)),
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

function getScene(sceneId: string | null | undefined) {
  return discoverFilterScenes.find((scene) => scene.id === sceneId) ?? discoverFilterScenes[0]
}

function getDefaultSceneId(searchParams: URLSearchParams): DiscoverFilterSceneId {
  const scene = getScene(searchParams.get('scene'))
  return scene.id
}

function isMealCategory(value: string): value is MealCategoryOption {
  return mealCategoryOptions.some((option) => option.value === value)
}

function getSceneLabel(sceneId: DiscoverFilterSceneId) {
  return getScene(sceneId).label
}

function formatSelectedPath(items: string[]) {
  return items.length ? items.slice(0, 5).join(' · ') : '当前没有额外筛选'
}

function getSceneDefaultTags(scene: (typeof discoverFilterScenes)[number], key: 'scenarioTags' | 'preferenceTags') {
  const defaults = scene.defaults as Partial<Record<'scenarioTags' | 'preferenceTags', readonly string[]>>
  return [...(defaults[key] ?? [])]
}

function getSceneMealPeriod(scene: (typeof discoverFilterScenes)[number]) {
  return 'mealPeriod' in scene.defaults ? scene.defaults.mealPeriod : undefined
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

type CompactChoiceGroupProps<T extends string> = {
  hint?: string
  label: string
  onChange: (value: T) => void
  options: readonly { label: string; value: T }[]
  value: T
}

function CompactChoiceGroup<T extends string>({ hint, label, onChange, options, value }: CompactChoiceGroupProps<T>) {
  return (
    <section className="compact-choice-card">
      <div className="compact-choice-head">
        <strong>{label}</strong>
        {hint ? <span>{hint}</span> : null}
      </div>
      <div className="compact-choice-grid" aria-label={label}>
        {options.map((option) => (
          <button key={option.value} className={`compact-choice ${value === option.value ? 'active' : ''}`} type="button" aria-pressed={value === option.value} onClick={() => onChange(option.value)}>
            {option.label}
          </button>
        ))}
      </div>
    </section>
  )
}

export function DiscoverPage() {
  const [searchParams, setSearchParams] = useSearchParams()
  const [, startTransition] = useTransition()
  const metadata = getRestaurantMetadata()
  const [keyword, setKeyword] = useState(() => searchParams.get('keyword') ?? '')
  const [activeSceneId, setActiveSceneId] = useState<DiscoverFilterSceneId>(() => getDefaultSceneId(searchParams))
  const [campus, setCampus] = useState<CampusOption>(() => {
    const initialCampus = searchParams.get('campus') ?? readStoredCampus()
    return campusOptions.includes(initialCampus as CampusOption) ? (initialCampus as CampusOption) : '紫金港'
  })
  const [serviceMode, setServiceMode] = useState(() => searchParams.get('mode') ?? '都可以')
  const [mealCategory, setMealCategory] = useState<MealCategoryOption>(() => {
    const category = searchParams.get('category') ?? getScene(activeSceneId).defaults.mealCategory ?? '正餐'
    return isMealCategory(category) ? category : '正餐'
  })
  const [mealPeriod, setMealPeriod] = useState(() => searchParams.get('meal') ?? getCurrentMealPeriod())
  const initialTags = useMemo(() => {
    const initialRefinementTags = parseTagsParam(searchParams.get('refine'))
    const tags = [
      ...parseTagsParam(searchParams.get('tags')),
      ...parseTagsParam(searchParams.get('scenario')),
      ...parseTagsParam(searchParams.get('dietary')),
      ...parseTagsParam(searchParams.get('preference'))
    ]
    const legacyTag = searchParams.get('tag')
    const splitTags = splitInitialTags(tags.length || !legacyTag || legacyTag === '全部' ? tags : [legacyTag])
    return {
      ...splitTags,
      refinementTags: [...new Set([...splitTags.refinementTags, ...initialRefinementTags])]
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])
  const [scenarioTags, setScenarioTags] = useState(() => initialTags.scenarioTags)
  const [dietaryTags, setDietaryTags] = useState(() => initialTags.dietaryTags)
  const [preferenceTags, setPreferenceTags] = useState(() => initialTags.preferenceTags)
  const [refinementTags, setRefinementTags] = useState(() => initialTags.refinementTags)
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
  const deferredKeyword = useDeferredValue(keyword)
  const getCategoryTags = (category = mealCategory) => (category === '全部' ? [] : [category])
  const initialFilters = { keyword, campus, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort, tags: [...getCategoryTags(), ...refinementTags] }
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>(() => listRestaurants(initialFilters, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [randomPick, setRandomPick] = useState<RestaurantSummary | null>(null)
  const [randomMessage, setRandomMessage] = useState('')
  const [randomNonce, setRandomNonce] = useState(0)
  const [locationStatus, setLocationStatus] = useState('')
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)
  const [isFilterSheetOpen, setIsFilterSheetOpen] = useState(false)
  const [visibleCount, setVisibleCount] = useState(RESTAURANT_RENDER_STEP)

  const scenarioKey = scenarioTags.join(',')
  const dietaryKey = dietaryTags.join(',')
  const preferenceKey = preferenceTags.join(',')
  const refinementKey = refinementTags.join(',')
  const randomTagKey = randomTags.join(',')
  const activeScene = getScene(activeSceneId)
  const filters = useMemo(() => ({ keyword: deferredKeyword, campus, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort, tags: [...getCategoryTags(mealCategory), ...refinementTags] }), [campus, deferredKeyword, dietaryKey, distanceLabel, loadLevel, mealCategory, mealPeriod, preferenceKey, priceLabel, refinementKey, scenarioKey, serviceMode, sort, spiceLevel])
  const context = useMemo(() => ({ preferences: [...preferences, campus, serviceMode, mealPeriod, mealCategory, getSceneLabel(activeSceneId), ...scenarioTags, ...preferenceTags, ...refinementTags], favoriteRestaurantIds: favoriteIds }), [activeSceneId, campus, favoriteIds, mealCategory, mealPeriod, preferenceKey, preferences, refinementKey, scenarioKey, serviceMode])
  const showRandom = searchParams.get('random') === '1'
  const summaryItems = [campus, getSceneLabel(activeSceneId), mealCategory, serviceMode, mealPeriod, ...refinementTags, ...scenarioTags, priceLabel !== '不限' ? priceLabel : '', distanceLabel !== '不限' ? distanceLabel : '', spiceLevel !== '不限' ? spiceLevel : '', loadLevel !== '不限' ? loadLevel : '', ...dietaryTags, ...preferenceTags].filter(Boolean)
  const visibleRestaurants = useMemo(() => restaurants.slice(0, visibleCount), [restaurants, visibleCount])
  const hasMoreRestaurants = visibleCount < restaurants.length

  useEffect(() => {
    const next = new URLSearchParams()
    if (keyword) next.set('keyword', keyword)
    if (activeSceneId !== discoverFilterScenes[0].id) next.set('scene', activeSceneId)
    if (campus !== '紫金港') next.set('campus', campus)
    if (mealCategory !== '正餐') next.set('category', mealCategory)
    if (serviceMode !== '都可以') next.set('mode', serviceMode)
    if (mealPeriod !== getCurrentMealPeriod()) next.set('meal', mealPeriod)
    if (refinementTags.length) next.set('refine', refinementTags.join(','))
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
  }, [activeSceneId, campus, dietaryKey, dietaryTags, distanceLabel, keyword, loadLevel, mealCategory, mealPeriod, preferenceKey, preferenceTags, priceLabel, randomBudget, randomCampus, randomTagKey, randomTags, refinementKey, refinementTags, scenarioKey, scenarioTags, serviceMode, setSearchParams, showRandom, sort, spiceLevel])

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
    setVisibleCount(RESTAURANT_RENDER_STEP)
  }, [filters])

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
    showToast(nextIds.includes(id) ? '已收藏，之后可以在收藏页快速找回。' : '已取消收藏。', nextIds.includes(id) ? 'success' : 'info')
    import('../services/favoriteSyncService')
      .then(({ setFavoriteInSupabase }) => setFavoriteInSupabase(id, nextIds.includes(id)))
      .then(setFavoriteIds)
      .catch(() => {
        setDataSource('收藏已先保存在本地，登录后可同步云端')
      })
  }

  function clearAllFilters() {
    startTransition(() => {
      setActiveSceneId(discoverFilterScenes[0].id)
      setCampus(readStoredCampus())
      setServiceMode('都可以')
      setMealCategory('正餐')
      setMealPeriod(getCurrentMealPeriod())
      setScenarioTags([])
      setDietaryTags([])
      setPreferenceTags([])
      setRefinementTags([])
      setDistanceLabel('不限')
      setSpiceLevel('不限')
      setLoadLevel('不限')
      setPriceLabel('不限')
    })
    showToast('筛选已重置，先从当前校区正餐看起。')
  }

  function selectCampus(nextCampus: string) {
    const resolvedCampus = campusOptions.includes(nextCampus as CampusOption) ? (nextCampus as CampusOption) : '紫金港'
    startTransition(() => setCampus(resolvedCampus))
    persistCampus(resolvedCampus)
  }

  function applyScene(sceneId: DiscoverFilterSceneId) {
    const scene = getScene(sceneId)
    startTransition(() => {
      setActiveSceneId(scene.id)
      if (scene.defaults.mealCategory && isMealCategory(scene.defaults.mealCategory)) setMealCategory(scene.defaults.mealCategory)
      if (scene.defaults.serviceMode) setServiceMode(scene.defaults.serviceMode)
      const defaultMealPeriod = getSceneMealPeriod(scene)
      if (defaultMealPeriod) setMealPeriod(defaultMealPeriod)
      setScenarioTags(getSceneDefaultTags(scene, 'scenarioTags'))
      setPreferenceTags(getSceneDefaultTags(scene, 'preferenceTags'))
      setRefinementTags([])
      setSpiceLevel('不限')
      setLoadLevel('不限')
    })
    showToast(`已切到「${scene.label}」，下面的筛选只保留相关条件。`)
  }

  function toggleRefinementTag(tag: string) {
    if (tag === '辣' || tag === '不辣') {
      setSpiceLevel((current) => (current === tag ? '不限' : tag))
      return
    }

    if (tag === '轻负担' || tag === '大份' || tag === '快乐碳水') {
      setLoadLevel((current) => (current === tag ? '不限' : tag))
      return
    }

    startTransition(() => {
      setRefinementTags((tags) => toggleGroupedTag(tags, tag, refinementExclusiveGroups))
    })
  }

  function isRefinementActive(tag: string) {
    if (tag === '辣' || tag === '不辣') return spiceLevel === tag
    if (tag === '轻负担' || tag === '大份' || tag === '快乐碳水') return loadLevel === tag
    return refinementTags.includes(tag)
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
    showToast('开摇，正在帮你缩小选择范围。')
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

      <div className="mobile-filter-dock">
        <div>
          <strong>{formatSelectedPath(summaryItems)}</strong>
          <span>{restaurants.length} 家匹配 · {sortOptions.find((option) => option.value === sort)?.label || '推荐'}排序</span>
        </div>
        <button className="primary-action compact-action" type="button" onClick={() => setIsFilterSheetOpen(true)}>
          调整筛选
        </button>
      </div>

      <BottomSheet
        open={isFilterSheetOpen}
        title="按层级筛选"
        description="先选场景，再做少量精细调整。冲突项已经放进单选组，页面不会再摊开一整墙标签。"
        onClose={() => setIsFilterSheetOpen(false)}
      >
        <div className="mobile-filter-stack layered-filter-panel">
          <label className="search-label" htmlFor="mobile-restaurant-search">
            搜索
          </label>
          <input id="mobile-restaurant-search" name="mobile-restaurant-search" className="search-input" value={keyword} placeholder="例如：辣 / 夜宵 / 一人食…" autoComplete="off" onChange={(event) => setKeyword(event.target.value)} />
          <section className="scene-picker-card">
            <div className="compact-choice-head">
              <strong>先选场景</strong>
              <span>场景会自动收起无关条件。</span>
            </div>
            <div className="scene-chip-grid">
              {discoverFilterScenes.map((scene) => (
                <button key={scene.id} className={`scene-chip ${activeSceneId === scene.id ? 'active' : ''}`} type="button" aria-pressed={activeSceneId === scene.id} onClick={() => applyScene(scene.id)}>
                  <strong>{scene.label}</strong>
                  <span>{scene.description}</span>
                </button>
              ))}
            </div>
          </section>
          <CompactChoiceGroup label="先定校区" hint="默认看你的常用校区" options={campusOptions.map((option) => ({ label: option, value: option }))} value={campus} onChange={selectCampus} />
          <CompactChoiceGroup label="吃什么类型" hint="饮品不会再挤进正餐推荐" options={mealCategoryOptions} value={mealCategory} onChange={setMealCategory} />
          <CompactChoiceGroup label="就餐方式" options={serviceModeOptions.map((mode) => ({ label: mode, value: mode }))} value={serviceMode} onChange={setServiceMode} />
          <CompactChoiceGroup label="时间段" options={mealPeriodOptions.map((period) => ({ label: period, value: period }))} value={mealPeriod} onChange={setMealPeriod} />
          <section className="compact-choice-card">
            <div className="compact-choice-head">
              <strong>{activeScene.label}的快捷细化</strong>
              <span>{activeScene.focus.join(' / ')}</span>
            </div>
            <div className="quick-refinement-grid" aria-label={`${activeScene.label}快捷细化`}>
              {activeScene.quickTags.map((tag) => (
                <button key={tag} className={`compact-choice ${isRefinementActive(tag) ? 'active' : ''}`} type="button" aria-pressed={isRefinementActive(tag)} onClick={() => toggleRefinementTag(tag)}>
                  {tag}
                </button>
              ))}
            </div>
          </section>
          <details className="advanced-filter-panel">
            <summary>更多条件</summary>
            <div className="advanced-filter-grid">
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
              <TagGroupSelector groups={scenarioTagGroups} selectedTags={scenarioTags} onChange={setScenarioTags} />
              <TagGroupSelector exclusiveGroups={preferenceExclusiveGroups} groups={preferenceTagGroups} selectedTags={preferenceTags} onChange={setPreferenceTags} />
              <SegmentedControl label="排序" options={sortOptions} value={sort} onChange={setSort} />
            </div>
          </details>
          <div className="sheet-actions">
            <button className="secondary-action" type="button" onClick={clearAllFilters}>
              重置
            </button>
            <button className="primary-action" type="button" onClick={() => setIsFilterSheetOpen(false)}>
              应用筛选
            </button>
          </div>
        </div>
      </BottomSheet>

      <GlassCard className="filters-card discover-desktop-filters">
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
              <Link className="random-result-link" to={`/restaurants/${randomPick.id}`} aria-label={`查看 ${randomPick.name} 详情`}>
                <h2>{randomPick.name}</h2>
              </Link>
              <p>
                当前条件：{randomCampus} · {randomBudget}{randomTags.length ? ` · ${randomTags.join(' / ')}` : ''}。结果：{randomPick.area} · {randomPick.cuisine} · ¥{randomPick.price}/人。
              </p>
              <div className="hero-actions compact-actions">
                <Link className="primary-action" to={`/restaurants/${randomPick.id}`}>
                  查看详情
                </Link>
                <button className="secondary-action" type="button" onClick={triggerRandomPick}>
                  不满意，再摇一次
                </button>
              </div>
            </>
          ) : (
            <>
              <h2>还没有摇到合适结果</h2>
              <p>{randomMessage || '点击上面的按钮后，结果会出现在这里。'}</p>
            </>
          )}
        </GlassCard>
      ) : null}

      <GlassCard className="filters-card scene-filter-card" id="primary-filters">
        <label className="search-label" htmlFor="restaurant-search">
          搜索餐厅、标签或场景
        </label>
        <input id="restaurant-search" name="restaurant-search" className="search-input" value={keyword} placeholder="例如：辣 / 夜宵 / 一人食…" autoComplete="off" onChange={(event) => setKeyword(event.target.value)} />
        <div className="filter-summary compact-filter-summary">
          <div>
            <span className="filter-section-label">当前路径</span>
            <p>{formatSelectedPath(summaryItems)}</p>
            <small>{restaurants.length} 家匹配 · {sortOptions.find((option) => option.value === sort)?.label || '推荐'}排序</small>
          </div>
          <button className="primary-action compact-action" type="button" onClick={() => setIsFilterSheetOpen(true)}>调整筛选</button>
        </div>
        <div className="scene-filter-layout">
          <section className="scene-picker-card">
            <div className="compact-choice-head">
              <strong>先选一个吃饭场景</strong>
              <span>不是所有标签都要出现，先把问题变小。</span>
            </div>
            <div className="scene-card-grid">
              {discoverFilterScenes.map((scene) => (
                <button key={scene.id} className={`scene-card ${activeSceneId === scene.id ? 'active' : ''}`} type="button" aria-pressed={activeSceneId === scene.id} onClick={() => applyScene(scene.id)}>
                  <strong>{scene.label}</strong>
                  <span>{scene.description}</span>
                </button>
              ))}
            </div>
          </section>
          <section className="focused-filter-card">
            <div className="filter-section-head">
              <div>
                <span className="filter-section-label">精细筛选</span>
                <p>{activeScene.label} · 重点看 {activeScene.focus.join('、')}</p>
              </div>
              <button className="text-action" type="button" onClick={clearAllFilters}>重置筛选</button>
            </div>
            <div className="focused-filter-grid">
              <CompactChoiceGroup label="校区" options={campusOptions.map((option) => ({ label: option, value: option }))} value={campus} onChange={selectCampus} />
              <CompactChoiceGroup label="大类" options={mealCategoryOptions} value={mealCategory} onChange={setMealCategory} />
              <CompactChoiceGroup label="方式" options={serviceModeOptions.map((mode) => ({ label: mode, value: mode }))} value={serviceMode} onChange={setServiceMode} />
              <CompactChoiceGroup label="时间" options={mealPeriodOptions.map((period) => ({ label: period, value: period }))} value={mealPeriod} onChange={setMealPeriod} />
            </div>
            <div className="quick-refinement-grid" aria-label={`${activeScene.label}快捷细化`}>
              {activeScene.quickTags.map((tag) => (
                <button key={tag} className={`compact-choice ${isRefinementActive(tag) ? 'active' : ''}`} type="button" aria-pressed={isRefinementActive(tag)} onClick={() => toggleRefinementTag(tag)}>
                  {tag}
                </button>
              ))}
            </div>
            <details className="advanced-filter-panel desktop-advanced-filter">
              <summary>更多条件</summary>
              <div className="advanced-filter-grid">
                <SegmentedControl label="预算" options={metadata.priceRanges.map((range) => ({ label: range.label, value: range.label }))} value={priceLabel} onChange={setPriceLabel} />
                {hardFilterGroups.map((group) => {
                  const value = group.key === 'distanceLabel' ? distanceLabel : group.key === 'spiceLevel' ? spiceLevel : loadLevel
                  const onChange = group.key === 'distanceLabel' ? setDistanceLabel : group.key === 'spiceLevel' ? setSpiceLevel : setLoadLevel
                  return <SegmentedControl key={group.key} label={group.title} options={group.options.map((option) => ({ label: option, value: option }))} value={value} onChange={onChange} />
                })}
                <TagGroupSelector groups={scenarioTagGroups} selectedTags={scenarioTags} onChange={setScenarioTags} />
                <TagGroupSelector exclusiveGroups={preferenceExclusiveGroups} groups={preferenceTagGroups} selectedTags={preferenceTags} onChange={setPreferenceTags} />
                <SegmentedControl label="排序" options={sortOptions} value={sort} onChange={setSort} />
              </div>
            </details>
          </section>
        </div>
      </GlassCard>

      <div id="results">
        {restaurants.length ? (
          <>
            <div className="restaurant-list">
            {isLoading ? <SkeletonList count={2} /> : null}
            {visibleRestaurants.map((restaurant) => (
              <RestaurantCard key={restaurant.id} restaurant={restaurant} onToggleFavorite={toggleFavorite} />
            ))}
            </div>
            {hasMoreRestaurants ? (
              <button className="secondary-action load-more-action" type="button" onClick={() => setVisibleCount((count) => count + RESTAURANT_RENDER_STEP)}>
                再显示 {Math.min(RESTAURANT_RENDER_STEP, restaurants.length - visibleCount)} 家
              </button>
            ) : null}
          </>
        ) : (
          <EmptyState
            title="这个组合暂时没有结果"
            description="可以先清掉一两个硬条件，比如预算、距离或辣度；如果你知道一家真实餐厅，也可以从贡献页提交给管理员审核。"
            action={<button className="secondary-action" type="button" onClick={clearAllFilters}>重置筛选</button>}
          />
        )}
      </div>
    </div>
  )
}
