import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { FilterChips } from '../components/FilterChips'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { dietaryConstraintTags, getCurrentMealPeriod, hardFilterGroups, mealPeriodOptions, parseTagsParam, preferenceTagGroups, scenarioTagGroups, serviceModeOptions, toggleMultiTag } from '../constants/restaurantTaxonomy'
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

export function DiscoverPage() {
  const [searchParams, setSearchParams] = useSearchParams()
  const metadata = getRestaurantMetadata()
  const [keyword, setKeyword] = useState(() => searchParams.get('keyword') ?? '')
  const [serviceMode, setServiceMode] = useState(() => searchParams.get('mode') ?? '都可以')
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
  const [sort, setSort] = useState<SortKey>(() => (searchParams.get('sort') as SortKey) || 'recommended')
  const [randomBudget, setRandomBudget] = useState(() => searchParams.get('randomBudget') ?? '不限')
  const [randomTag, setRandomTag] = useState(() => searchParams.get('randomTag') ?? '全部')
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const initialFilters = { keyword, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort }
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>(() => listRestaurants(initialFilters, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [randomPick, setRandomPick] = useState<RestaurantSummary | null>(null)
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)

  const scenarioKey = scenarioTags.join(',')
  const dietaryKey = dietaryTags.join(',')
  const preferenceKey = preferenceTags.join(',')
  const filters = useMemo(() => ({ keyword, serviceMode, mealPeriod, scenarioTags, dietaryTags, preferenceTags, distanceLabel, spiceLevel, loadLevel, priceLabel, sort }), [dietaryKey, distanceLabel, keyword, loadLevel, mealPeriod, preferenceKey, priceLabel, scenarioKey, serviceMode, sort, spiceLevel])
  const context = useMemo(() => ({ preferences: [...preferences, serviceMode, mealPeriod, ...scenarioTags, ...preferenceTags], favoriteRestaurantIds: favoriteIds }), [favoriteIds, mealPeriod, preferenceKey, preferences, scenarioKey, serviceMode])
  const showRandom = searchParams.get('random') === '1'
  const summaryItems = [serviceMode, mealPeriod, ...scenarioTags, priceLabel !== '不限' ? priceLabel : '', distanceLabel !== '不限' ? distanceLabel : '', spiceLevel !== '不限' ? spiceLevel : '', loadLevel !== '不限' ? loadLevel : '', ...dietaryTags, ...preferenceTags].filter(Boolean)

  useEffect(() => {
    const next = new URLSearchParams()
    if (keyword) next.set('keyword', keyword)
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
    if (showRandom && randomBudget !== '不限') next.set('randomBudget', randomBudget)
    if (showRandom && randomTag !== '全部') next.set('randomTag', randomTag)
    setSearchParams(next, { replace: true })
  }, [dietaryKey, dietaryTags, distanceLabel, keyword, loadLevel, mealPeriod, preferenceKey, preferenceTags, priceLabel, randomBudget, randomTag, scenarioKey, scenarioTags, serviceMode, setSearchParams, showRandom, sort, spiceLevel])

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
    const randomFilters = {
      ...filters,
      priceLabel: randomBudget,
      preferenceTags: randomTag === '全部' ? preferenceTags : [...preferenceTags, randomTag]
    }

    getRandomRestaurantRemote(randomFilters, context, controller.signal)
      .then((result) => {
        setRandomPick(result.data)
        setDataSource(describeApiSource(result.source, result.fallbackReason))
      })
      .catch((error: unknown) => {
        if (!isAbortError(error)) setRandomPick(getRandomRestaurant(randomFilters, context))
      })

    return () => controller.abort()
  }, [context, filters, randomBudget, randomTag, showRandom])

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
    setServiceMode('都可以')
    setMealPeriod(getCurrentMealPeriod())
    setScenarioTags([])
    setDietaryTags([])
    setPreferenceTags([])
    setDistanceLabel('不限')
    setSpiceLevel('不限')
    setLoadLevel('不限')
    setPriceLabel('不限')
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
        <span>{isLoading ? '正在同步后端数据...' : dataSource}</span>
      </div>

      {randomPick ? (
        <GlassCard className="result-card">
          <p className="eyebrow">RANDOM PICK</p>
          <h2>{randomPick.name}</h2>
          <p>
            当前筛选下的随机结果：{randomPick.area} · {randomPick.cuisine} · ¥{randomPick.price}/人。
          </p>
        </GlassCard>
      ) : null}

      <GlassCard className="filters-card">
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">DECISION HELPER</p>
            <h2>随机吃什么增强</h2>
            <p>先给随机一餐加一点边界：预算和场景定住，选择困难就少一半。</p>
          </div>
        </div>
        <SegmentedControl label="随机预算" options={metadata.priceRanges.map((range) => ({ label: range.label, value: range.label }))} value={randomBudget} onChange={setRandomBudget} />
        <FilterChips items={metadata.tasteTags.slice(0, 10)} active={randomTag} onChange={setRandomTag} />
        <button className="primary-action" type="button" onClick={() => setSearchParams((current) => {
          const next = new URLSearchParams(current)
          next.set('random', '1')
          if (randomBudget !== '不限') next.set('randomBudget', randomBudget)
          if (randomTag !== '全部') next.set('randomTag', randomTag)
          return next
        })}>
          按条件摇一餐
        </button>
      </GlassCard>

      <GlassCard className="filters-card">
        <label className="search-label" htmlFor="restaurant-search">
          搜索餐厅、标签或场景
        </label>
        <input id="restaurant-search" className="search-input" value={keyword} placeholder="例如：辣 / 夜宵 / 一人食" onChange={(event) => setKeyword(event.target.value)} />
        <div className="filter-flow">
          <div className="flow-step">
            <span className="flow-step-index">1</span>
            <SegmentedControl label="怎么吃" options={serviceModeOptions.map((mode) => ({ label: mode, value: mode }))} value={serviceMode} onChange={setServiceMode} />
          </div>
          <div className="flow-step">
            <span className="flow-step-index">2</span>
            <SegmentedControl label="什么时候吃" options={mealPeriodOptions.map((period) => ({ label: period, value: period }))} value={mealPeriod} onChange={setMealPeriod} />
          </div>
          <div className="flow-step">
            <span className="flow-step-index">3</span>
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
            <span className="flow-step-index">4</span>
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
            <span className="flow-step-index">5</span>
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
