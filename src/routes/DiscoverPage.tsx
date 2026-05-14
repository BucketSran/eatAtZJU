import { useDeferredValue, useEffect, useMemo, useState, useTransition } from 'react'
import { useSearchParams } from 'react-router-dom'
import { BottomSheet } from '../components/BottomSheet'
import { EmptyState } from '../components/EmptyState'
import { FoodMap } from '../components/FoodMap'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { SkeletonList } from '../components/Skeleton'
import { showToast } from '../lib/toast'
import { campusOptions, dietaryConstraintTags, discoverFilterScenes, getCurrentMealPeriod, getMealPeriodForCategory, hardFilterGroups, mealCategoryOptions, mealPeriodOptions, parseTagsParam, preferenceExclusiveGroups, preferenceTagGroups, scenarioTagGroups, serviceModeOptions, toggleGroupedTag, toggleMultiTag, type CampusOption, type DiscoverFilterSceneId, type MealCategoryOption } from '../constants/restaurantTaxonomy'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { getPreferenceTags } from '../services/preferenceStore'
import { describeApiSource, getRestaurantMetadata, listRestaurants, listRestaurantsRemote } from '../services/restaurantService'
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

function hasCoordinate(restaurant: RestaurantSummary) {
  return Number.isFinite(restaurant.latitude) && Number.isFinite(restaurant.longitude)
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
  const [mealPeriod, setMealPeriod] = useState(() => getMealPeriodForCategory(mealCategory, searchParams.get('meal') ?? getSceneMealPeriod(getScene(activeSceneId)) ?? getCurrentMealPeriod()))
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
  const [sort, setSort] = useState<SortKey>(() => (searchParams.get('sort') as SortKey) || 'recommended')
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const deferredKeyword = useDeferredValue(keyword)
  const getCategoryTags = (category = mealCategory) => (category === '全部' ? [] : [category])
  const initialFilters = { keyword, campus, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort, tags: [...getCategoryTags(), ...refinementTags] }
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>(() => listRestaurants(initialFilters, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [mapFallbackRestaurants, setMapFallbackRestaurants] = useState<RestaurantSummary[]>(() => restaurants)
  const [dataSource, setDataSource] = useState('餐厅资料已准备好')
  const [isLoading, setIsLoading] = useState(false)
  const [isFilterSheetOpen, setIsFilterSheetOpen] = useState(false)
  const [isSearchCollapsed, setIsSearchCollapsed] = useState(false)
  const [focusedMapRestaurantId, setFocusedMapRestaurantId] = useState<string | null>(null)
  const [visibleCount, setVisibleCount] = useState(RESTAURANT_RENDER_STEP)

  const scenarioKey = scenarioTags.join(',')
  const dietaryKey = dietaryTags.join(',')
  const preferenceKey = preferenceTags.join(',')
  const refinementKey = refinementTags.join(',')
  const activeScene = getScene(activeSceneId)
  const filters = useMemo(() => ({ keyword: deferredKeyword, campus, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort, tags: [...getCategoryTags(mealCategory), ...refinementTags] }), [campus, deferredKeyword, dietaryKey, distanceLabel, loadLevel, mealCategory, mealPeriod, preferenceKey, priceLabel, refinementKey, scenarioKey, serviceMode, sort, spiceLevel])
  const context = useMemo(() => ({ preferences: [...preferences, campus, serviceMode, mealPeriod, mealCategory, getSceneLabel(activeSceneId), ...scenarioTags, ...preferenceTags, ...refinementTags], favoriteRestaurantIds: favoriteIds }), [activeSceneId, campus, favoriteIds, mealCategory, mealPeriod, preferenceKey, preferences, refinementKey, scenarioKey, serviceMode])
  const summaryItems = [campus, getSceneLabel(activeSceneId), mealCategory, serviceMode, mealPeriod, ...refinementTags, ...scenarioTags, priceLabel !== '不限' ? priceLabel : '', distanceLabel !== '不限' ? distanceLabel : '', spiceLevel !== '不限' ? spiceLevel : '', loadLevel !== '不限' ? loadLevel : '', ...dietaryTags, ...preferenceTags].filter(Boolean)
  const visibleRestaurants = useMemo(() => restaurants.slice(0, visibleCount), [restaurants, visibleCount])
  const hasMoreRestaurants = visibleCount < restaurants.length
  const broadMapFilters = useMemo(() => ({ campus, serviceMode, sort: 'recommended' as SortKey, tags: getCategoryTags(mealCategory) }), [campus, mealCategory, serviceMode])
  const mapRestaurantSource = restaurants.some(hasCoordinate) ? restaurants : mapFallbackRestaurants
  const mapModeNote = restaurants.some(hasCoordinate)
    ? undefined
    : mapFallbackRestaurants.some(hasCoordinate)
      ? '当前精确筛选暂时为空，地图先展示当前校区/大类的可选点位。'
      : undefined

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
    setSearchParams(next, { replace: true })
  }, [activeSceneId, campus, dietaryKey, dietaryTags, distanceLabel, keyword, loadLevel, mealCategory, mealPeriod, preferenceKey, preferenceTags, priceLabel, refinementKey, refinementTags, scenarioKey, scenarioTags, serviceMode, setSearchParams, sort, spiceLevel])

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
    const controller = new AbortController()

    listRestaurantsRemote(broadMapFilters, context, controller.signal)
      .then((result) => {
        setMapFallbackRestaurants(result.data)
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) setMapFallbackRestaurants(listRestaurants(broadMapFilters, context))
      })

    return () => controller.abort()
  }, [broadMapFilters, context])

  useEffect(() => {
    setVisibleCount(RESTAURANT_RENDER_STEP)
  }, [filters])

  function toggleFavorite(id: string) {
    const nextIds = toggleFavoriteRestaurant(id)
    setFavoriteIds(nextIds)
    showToast(nextIds.includes(id) ? '已收藏，之后可以在收藏页快速找回。' : '已取消收藏。', nextIds.includes(id) ? 'success' : 'info')
    import('../services/favoriteSyncService')
      .then(({ setFavoriteInSupabase }) => setFavoriteInSupabase(id, nextIds.includes(id)))
      .then(setFavoriteIds)
      .catch(() => {
        setDataSource('收藏已先保存在这台设备，登录后可同步云端')
      })
  }

  function clearAllFilters() {
    startTransition(() => {
      setActiveSceneId(discoverFilterScenes[0].id)
      setCampus(readStoredCampus())
      setServiceMode('都可以')
      setMealCategory('正餐')
      setMealPeriod(getMealPeriodForCategory('正餐'))
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
      const nextMealCategory = scene.defaults.mealCategory && isMealCategory(scene.defaults.mealCategory) ? scene.defaults.mealCategory : mealCategory
      if (scene.defaults.mealCategory && isMealCategory(scene.defaults.mealCategory)) setMealCategory(nextMealCategory)
      if (scene.defaults.serviceMode) setServiceMode(scene.defaults.serviceMode)
      const defaultMealPeriod = getSceneMealPeriod(scene)
      setMealPeriod(defaultMealPeriod ?? getMealPeriodForCategory(nextMealCategory))
      setScenarioTags(getSceneDefaultTags(scene, 'scenarioTags'))
      setPreferenceTags(getSceneDefaultTags(scene, 'preferenceTags'))
      setRefinementTags([])
      setSpiceLevel('不限')
      setLoadLevel('不限')
    })
    showToast(`已切到「${scene.label}」，下面的筛选只保留相关条件。`)
  }

  function selectMealCategory(nextCategory: MealCategoryOption) {
    startTransition(() => {
      setMealCategory(nextCategory)
      setMealPeriod((currentPeriod) => getMealPeriodForCategory(nextCategory, currentPeriod))
    })
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

  function focusRestaurantFromMap(restaurant: RestaurantSummary) {
    setFocusedMapRestaurantId(restaurant.id)
    setVisibleCount((count) => {
      const index = restaurants.findIndex((item) => item.id === restaurant.id)
      return index >= count ? index + 1 : count
    })
    window.requestAnimationFrame(() => {
      document.getElementById(`restaurant-card-${restaurant.id}`)?.scrollIntoView({ behavior: 'smooth', block: 'center' })
    })
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">DISCOVER</p>
          <h1>发现餐厅</h1>
          <p>按口味、预算、距离和公开位置资料筛选；等同学们补充真实体验后，学生评价会成为推荐的主要权重。</p>
        </div>
        <span className="count-badge">{restaurants.length} 家匹配</span>
      </div>

      <div className="status-strip">
        <span aria-live="polite">{isLoading ? '正在更新餐厅列表…' : dataSource}</span>
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
          <CompactChoiceGroup label="吃什么类型" hint="饮品不会再挤进正餐推荐" options={mealCategoryOptions} value={mealCategory} onChange={selectMealCategory} />
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

      <GlassCard className={`filters-card scene-filter-card ${isSearchCollapsed ? 'collapsed' : ''}`} id="primary-filters">
        <div className="filter-summary compact-filter-summary">
          <div>
            <span className="filter-section-label">当前路径</span>
            <p>{formatSelectedPath(summaryItems)}</p>
            <small>{restaurants.length} 家匹配 · {sortOptions.find((option) => option.value === sort)?.label || '推荐'}排序</small>
          </div>
          <div className="filter-summary-actions">
            <button className="secondary-action compact-action" type="button" aria-expanded={!isSearchCollapsed} aria-controls="discover-filter-body" onClick={() => setIsSearchCollapsed((collapsed) => !collapsed)}>
              {isSearchCollapsed ? '展开筛选' : '收起筛选'}
            </button>
            <button className="primary-action compact-action" type="button" onClick={() => setIsFilterSheetOpen(true)}>调整筛选</button>
          </div>
        </div>
        {isSearchCollapsed ? (
          <p className="collapsed-filter-note">已收起搜索和精细筛选，下面可以直接看列表与地图；需要修改条件时点“展开筛选”或“调整筛选”。</p>
        ) : (
          <div id="discover-filter-body" className="discover-filter-body">
            <label className="search-label" htmlFor="restaurant-search">
              搜索餐厅、标签或场景
            </label>
            <input id="restaurant-search" name="restaurant-search" className="search-input" value={keyword} placeholder="例如：辣 / 夜宵 / 一人食…" autoComplete="off" onChange={(event) => setKeyword(event.target.value)} />
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
                  <CompactChoiceGroup label="大类" options={mealCategoryOptions} value={mealCategory} onChange={selectMealCategory} />
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
                    <SegmentedControl label="排序" options={sortOptions} value={sort} onChange={setSort} />
                  </div>
                </details>
              </section>
            </div>
          </div>
        )}
      </GlassCard>

      <div id="results">
        {restaurants.length ? (
          <>
            <div className="restaurant-list">
            {isLoading ? <SkeletonList count={2} /> : null}
            {visibleRestaurants.map((restaurant) => (
              <div id={`restaurant-card-${restaurant.id}`} className={`restaurant-card-anchor ${focusedMapRestaurantId === restaurant.id ? 'map-focused' : ''}`} key={restaurant.id}>
                <RestaurantCard restaurant={restaurant} onToggleFavorite={toggleFavorite} />
              </div>
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

      <FoodMap campus={campus} modeNote={mapModeNote} restaurants={mapRestaurantSource} onFilterOpen={() => setIsFilterSheetOpen(true)} onRestaurantFocus={focusRestaurantFromMap} />
    </div>
  )
}
