import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { FilterChips } from '../components/FilterChips'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { SegmentedControl } from '../components/SegmentedControl'
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

export function DiscoverPage() {
  const [searchParams, setSearchParams] = useSearchParams()
  const metadata = getRestaurantMetadata()
  const [keyword, setKeyword] = useState(() => searchParams.get('keyword') ?? '')
  const [tag, setTag] = useState(() => searchParams.get('tag') ?? '全部')
  const [priceLabel, setPriceLabel] = useState(() => searchParams.get('price') ?? '不限')
  const [sort, setSort] = useState<SortKey>(() => (searchParams.get('sort') as SortKey) || 'recommended')
  const [randomBudget, setRandomBudget] = useState(() => searchParams.get('randomBudget') ?? '不限')
  const [randomTag, setRandomTag] = useState(() => searchParams.get('randomTag') ?? '全部')
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>(() => listRestaurants({ keyword, tag, priceLabel, sort }, { preferences: getPreferenceTags(), favoriteRestaurantIds: getFavoriteRestaurantIds() }))
  const [randomPick, setRandomPick] = useState<RestaurantSummary | null>(null)
  const [dataSource, setDataSource] = useState('本地 seed fallback')
  const [isLoading, setIsLoading] = useState(false)

  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: favoriteIds }), [favoriteIds, preferences])
  const filters = useMemo(() => ({ keyword, tag, priceLabel, sort }), [keyword, priceLabel, sort, tag])
  const showRandom = searchParams.get('random') === '1'

  useEffect(() => {
    const next = new URLSearchParams()
    if (keyword) next.set('keyword', keyword)
    if (tag !== '全部') next.set('tag', tag)
    if (priceLabel !== '不限') next.set('price', priceLabel)
    if (sort !== 'recommended') next.set('sort', sort)
    if (showRandom) next.set('random', '1')
    if (showRandom && randomBudget !== '不限') next.set('randomBudget', randomBudget)
    if (showRandom && randomTag !== '全部') next.set('randomTag', randomTag)
    setSearchParams(next, { replace: true })
  }, [keyword, priceLabel, randomBudget, randomTag, setSearchParams, showRandom, sort, tag])

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
      tag: randomTag
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
    setFavoriteIds(toggleFavoriteRestaurant(id))
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">DISCOVER</p>
          <h1>发现餐厅</h1>
          <p>按口味、预算和学生口碑筛选，先把选择变少一点。</p>
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
        <FilterChips items={metadata.tasteTags} active={tag} onChange={setTag} />
        <SegmentedControl label="预算" options={metadata.priceRanges.map((range) => ({ label: range.label, value: range.label }))} value={priceLabel} onChange={setPriceLabel} />
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
