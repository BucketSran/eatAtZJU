import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { FilterChips } from '../components/FilterChips'
import { GlassCard } from '../components/GlassCard'
import { RestaurantCard } from '../components/RestaurantCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { getFavoriteRestaurantIds, toggleFavoriteRestaurant } from '../services/favoriteStore'
import { getPreferenceTags } from '../services/preferenceStore'
import { getRandomRestaurant, getRestaurantMetadata, listRestaurants } from '../services/restaurantService'
import type { SortKey } from '../types'

const sortOptions: Array<{ label: string; value: SortKey }> = [
  { label: '推荐', value: 'recommended' },
  { label: '距离', value: 'distance' },
  { label: '评分', value: 'rating' },
  { label: '价格', value: 'price' }
]

export function DiscoverPage() {
  const [searchParams, setSearchParams] = useSearchParams()
  const metadata = getRestaurantMetadata()
  const [keyword, setKeyword] = useState(() => searchParams.get('keyword') ?? '')
  const [tag, setTag] = useState(() => searchParams.get('tag') ?? '全部')
  const [priceLabel, setPriceLabel] = useState(() => searchParams.get('price') ?? '不限')
  const [sort, setSort] = useState<SortKey>(() => (searchParams.get('sort') as SortKey) || 'recommended')
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteRestaurantIds())
  const [preferences] = useState(() => getPreferenceTags())

  const context = useMemo(() => ({ preferences, favoriteRestaurantIds: favoriteIds }), [favoriteIds, preferences])
  const restaurants = listRestaurants({ keyword, tag, priceLabel, sort }, context)
  const showRandom = searchParams.get('random') === '1'
  const randomPick = showRandom ? getRandomRestaurant({ keyword, tag, priceLabel, sort }, context) : null

  useEffect(() => {
    const next = new URLSearchParams()
    if (keyword) next.set('keyword', keyword)
    if (tag !== '全部') next.set('tag', tag)
    if (priceLabel !== '不限') next.set('price', priceLabel)
    if (sort !== 'recommended') next.set('sort', sort)
    if (showRandom) next.set('random', '1')
    setSearchParams(next, { replace: true })
  }, [keyword, priceLabel, setSearchParams, showRandom, sort, tag])

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
