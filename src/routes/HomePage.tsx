import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { BottomSheet } from '../components/BottomSheet'
import { GlassCard } from '../components/GlassCard'
import { MealDiceSheet } from '../components/MealDiceSheet'
import { SegmentedControl } from '../components/SegmentedControl'
import { campusOptions, getCurrentMealPeriod, getMealPeriodForCategory, mealCategoryOptions, mealPeriodOptions, quickRandomExclusiveGroups, quickRandomTags, serviceModeOptions, toggleGroupedTag, type CampusOption, type MealCategoryOption } from '../constants/restaurantTaxonomy'
import { getMealContext } from '../lib/timeContext'
import { showToast } from '../lib/toast'
import { getFavoriteRestaurantIds } from '../services/favoriteStore'
import { getDefaultCampus, getPreferenceTags } from '../services/preferenceStore'
import { getRandomRestaurantRemote, getRestaurantMetadata } from '../services/restaurantService'
import type { RecommendationContext, RestaurantFilters, RestaurantSummary } from '../types'

function normalizeCampus(value?: string | null): CampusOption {
  return campusOptions.includes(value as CampusOption) ? (value as CampusOption) : '紫金港'
}

function toggleQuickTag(currentTags: string[], tag: string) {
  return toggleGroupedTag(currentTags, tag, quickRandomExclusiveGroups)
}

function getCategoryTags(category: MealCategoryOption) {
  return category === '全部' ? [] : [category]
}

function getDiscoverHref(filters: RestaurantFilters, mealCategory: MealCategoryOption) {
  const params = new URLSearchParams()
  if (filters.campus) params.set('campus', filters.campus)
  if (mealCategory !== '正餐') params.set('category', mealCategory)
  if (filters.serviceMode && filters.serviceMode !== '都可以') params.set('mode', filters.serviceMode)
  if (filters.mealPeriod && filters.mealPeriod !== getCurrentMealPeriod()) params.set('meal', filters.mealPeriod)
  if (filters.priceLabel && filters.priceLabel !== '不限') params.set('price', filters.priceLabel)
  const refineTags = (filters.tags ?? []).filter((tag) => tag !== mealCategory)
  if (refineTags.length) params.set('refine', refineTags.join(','))
  return `/discover${params.toString() ? `?${params.toString()}` : ''}`
}

function getDemandSummary(filters: RestaurantFilters, tags: string[]) {
  return [
    filters.campus,
    filters.serviceMode && filters.serviceMode !== '都可以' ? filters.serviceMode : '都可以',
    filters.mealPeriod,
    filters.priceLabel && filters.priceLabel !== '不限' ? filters.priceLabel : '',
    ...tags.slice(0, 4)
  ].filter(Boolean).join(' · ')
}

export function HomePage() {
  const metadata = getRestaurantMetadata()
  const mealContext = useMemo(() => getMealContext(), [])
  const storedPreferences = useMemo(() => getPreferenceTags(), [])
  const initialCampus = useMemo(() => normalizeCampus(getDefaultCampus()), [])
  const initialMealCategory = getMealPeriodForCategory('正餐', getCurrentMealPeriod()) === '下午茶' ? '饮品' : '正餐'
  const [isDemandOpen, setIsDemandOpen] = useState(false)
  const [isDiceOpen, setIsDiceOpen] = useState(false)
  const [randomCampus, setRandomCampus] = useState<CampusOption>(initialCampus)
  const [mealCategory, setMealCategory] = useState<MealCategoryOption>(initialMealCategory)
  const [serviceMode, setServiceMode] = useState('都可以')
  const [mealPeriod, setMealPeriod] = useState(() => getMealPeriodForCategory(initialMealCategory))
  const [randomBudget, setRandomBudget] = useState('不限')
  const [randomTags, setRandomTags] = useState<string[]>(() => {
    const preferredTags = storedPreferences.filter((tag) => quickRandomTags.includes(tag as never))
    return preferredTags.length ? preferredTags.slice(0, 4) : ['近', '实惠']
  })
  const [randomPick, setRandomPick] = useState<RestaurantSummary | null>(null)
  const [isRandomLoading, setIsRandomLoading] = useState(false)
  const [randomMessage, setRandomMessage] = useState('先点“随机一餐”，结果会直接出现在这里。')

  const randomFilters = useMemo<RestaurantFilters>(() => ({
    campus: randomCampus,
    serviceMode,
    mealPeriod,
    priceLabel: randomBudget,
    tags: [...getCategoryTags(mealCategory), ...randomTags]
  }), [mealCategory, mealPeriod, randomBudget, randomCampus, randomTags, serviceMode])

  const randomContext = useMemo<RecommendationContext>(() => ({
    preferences: [randomCampus, serviceMode, mealPeriod, mealCategory, ...storedPreferences, ...randomTags],
    favoriteRestaurantIds: getFavoriteRestaurantIds()
  }), [mealCategory, mealPeriod, randomCampus, randomTags, serviceMode, storedPreferences])

  const demandSummary = useMemo(() => getDemandSummary(randomFilters, randomTags), [randomFilters, randomTags])
  const discoverHref = useMemo(() => getDiscoverHref(randomFilters, mealCategory), [mealCategory, randomFilters])
  const leaderboardHref = useMemo(() => `/leaderboards?campus=${encodeURIComponent(randomCampus)}`, [randomCampus])

  function selectMealCategory(nextCategory: MealCategoryOption) {
    setMealCategory(nextCategory)
    setMealPeriod((currentPeriod) => getMealPeriodForCategory(nextCategory, currentPeriod))
  }

  async function surpriseMe() {
    setIsRandomLoading(true)
    setRandomMessage('正在按你的需求摇一餐...')
    try {
      const result = await getRandomRestaurantRemote(randomFilters, randomContext)
      setRandomPick(result.data)
      setRandomMessage(result.data ? `当前需求：${demandSummary}` : '这个组合暂时没有匹配餐厅，可以点“添加需求”放宽校区、预算或标签。')
      showToast(result.data ? `摇到：${result.data.name}` : '这组条件暂时没有结果。', result.data ? 'success' : 'info')
    } catch {
      setRandomMessage('这次没摇出来，可能是网络抖了一下，请再试一次。')
    } finally {
      setIsRandomLoading(false)
    }
  }

  return (
    <div className="route-stack home-route">
      <section className="hero-panel home-hero-panel">
        <p className="eyebrow">ZJU FOOD RADAR</p>
        <h1>今天吃什么？</h1>
        <p className="hero-copy">{mealContext.title}：{mealContext.description} 默认按「{randomCampus}」和你的需求缩小选择，先帮你少纠结一半。</p>
        <div className="home-demand-summary" aria-live="polite">
          <span>当前需求</span>
          <strong>{demandSummary}</strong>
        </div>
        <div className="home-decision-grid" aria-label="首页决策入口">
          <button className="home-decision-card random-mode" type="button" disabled={isRandomLoading} onClick={surpriseMe}>
            <span>系统帮选</span>
            <strong>{isRandomLoading ? '正在摇…' : '随机一餐'}</strong>
            <small>按校区、预算和标签，从已收录餐厅里抽一个。</small>
          </button>
          <button className="home-decision-card dice-mode" type="button" onClick={() => setIsDiceOpen(true)}>
            <i aria-hidden="true">骰</i>
            <span>已有候选</span>
            <strong>饭局骰子</strong>
            <small>自己加候选，6 面同权，摇到谁就吃谁。</small>
          </button>
        </div>
        <div className="hero-actions compact-actions">
          <button className="secondary-action" type="button" onClick={() => setIsDemandOpen(true)}>
            添加需求
          </button>
        </div>
      </section>

      <GlassCard className="result-card home-random-result">
        <p className="eyebrow">RANDOM PICK</p>
        {randomPick ? (
          <>
            <h2>{randomPick.name}</h2>
            <p>
              {randomPick.area} · {randomPick.cuisine} · ¥{randomPick.price}/人。{randomPick.reason}
            </p>
            <p className="helper-text" aria-live="polite">{randomMessage}</p>
            <div className="hero-actions compact-actions">
              <Link className="primary-action" to={`/restaurants/${randomPick.id}`}>
                看详情
              </Link>
              <button className="secondary-action" type="button" disabled={isRandomLoading} onClick={surpriseMe}>
                {isRandomLoading ? '正在摇…' : '再摇一次'}
              </button>
            </div>
          </>
        ) : (
          <>
            <h2>先摇一餐</h2>
            <p className="helper-text" aria-live="polite">{randomMessage}</p>
          </>
        )}
      </GlassCard>

      <div className="home-shortcut-grid" aria-label="首页快捷入口">
        <Link className="home-shortcut-card guide-shortcut-card" to="/guide">
          <span>新手导览</span>
          <strong>第一次来？让浙小食带你走一圈</strong>
          <small>给新来的浙大人，5 步了解校区、随机、发现、榜单和贡献</small>
        </Link>
        <Link className="home-shortcut-card" to={discoverHref}>
          <span>精细搜索</span>
          <strong>去发现页继续筛</strong>
          <small>地图、标签、排序一起看</small>
        </Link>
        <Link className="home-shortcut-card" to={leaderboardHref}>
          <span>当前榜单</span>
          <strong>查看校园美食榜</strong>
          <small>{randomCampus} · 按时间段置顶</small>
        </Link>
      </div>

      <MealDiceSheet
        context={randomContext}
        filters={randomFilters}
        open={isDiceOpen}
        summary={demandSummary}
        onClose={() => setIsDiceOpen(false)}
      />

      <BottomSheet
        open={isDemandOpen}
        title="给随机一餐加点边界"
        description="先定校区和大类，再加预算与少量关键标签。冲突项会自动互斥，不会越选越乱。"
        onClose={() => setIsDemandOpen(false)}
      >
        <div className="mobile-filter-stack home-demand-sheet">
          <section className="compact-choice-card">
            <div className="compact-choice-head">
              <strong>校区</strong>
              <span>先避免随机远征。</span>
            </div>
            <div className="compact-choice-grid">
              {campusOptions.map((campus) => (
                <button key={campus} className={`compact-choice ${randomCampus === campus ? 'active' : ''}`} type="button" aria-pressed={randomCampus === campus} onClick={() => setRandomCampus(campus)}>
                  {campus}
                </button>
              ))}
            </div>
          </section>

          <section className="compact-choice-card">
            <div className="compact-choice-head">
              <strong>吃什么类型</strong>
              <span>饮品甜点不会混进正餐。</span>
            </div>
            <SegmentedControl label="吃什么类型" options={[...mealCategoryOptions]} value={mealCategory} onChange={selectMealCategory} />
          </section>

          <section className="quick-random-panel">
            <div className="quick-random-row">
              <div className="quick-random-copy">
                <strong>方式</strong>
                <span>堂食、外卖或都可以。</span>
              </div>
              <SegmentedControl label="就餐方式" options={serviceModeOptions.map((mode) => ({ label: mode, value: mode }))} value={serviceMode} onChange={setServiceMode} />
            </div>
            <div className="quick-random-row">
              <div className="quick-random-copy">
                <strong>时间</strong>
                <span>按饭点控制候选。</span>
              </div>
              <SegmentedControl label="时间段" options={mealPeriodOptions.map((period) => ({ label: period, value: period }))} value={mealPeriod} onChange={setMealPeriod} />
            </div>
            <div className="quick-random-row">
              <div className="quick-random-copy">
                <strong>预算</strong>
                <span>不用精确，先给个范围。</span>
              </div>
              <SegmentedControl label="随机预算" options={metadata.priceRanges.map((range) => ({ label: range.label, value: range.label }))} value={randomBudget} onChange={setRandomBudget} />
            </div>
          </section>

          <section className="compact-choice-card">
            <div className="compact-choice-head">
              <strong>关键标签</strong>
              <span>可多选；辣/不辣、堂食/外卖、食堂/非食堂自动互斥。</span>
            </div>
            <div className="chip-row" aria-label="随机关键标签">
              {quickRandomTags.map((tag) => (
                <button key={tag} className={`chip ${randomTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={randomTags.includes(tag)} onClick={() => setRandomTags((tags) => toggleQuickTag(tags, tag))}>
                  {tag}
                </button>
              ))}
            </div>
          </section>

          <div className="sheet-actions">
            <button className="secondary-action" type="button" onClick={() => {
              setMealCategory('正餐')
              setServiceMode('都可以')
              setMealPeriod(getMealPeriodForCategory('正餐'))
              setRandomBudget('不限')
              setRandomTags(['近', '实惠'])
            }}>
              恢复默认
            </button>
            <button className="primary-action" type="button" onClick={() => setIsDemandOpen(false)}>
              用这组需求
            </button>
          </div>
        </div>
      </BottomSheet>
    </div>
  )
}
