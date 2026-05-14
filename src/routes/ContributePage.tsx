import { useEffect, useState, type FormEvent } from 'react'
import { GlassCard } from '../components/GlassCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { campusOptions, collectFilterTags, dietaryConstraintTags, getCurrentMealPeriod, hardFilterGroups, mealCategoryOptions, mealPeriodOptions, serviceModeOptions, toggleMultiTag, type MealCategoryOption } from '../constants/restaurantTaxonomy'
import { listRestaurantsRemote } from '../services/restaurantService'
import { submitContribution, type SubmissionType } from '../services/submissionService'
import type { RestaurantSummary } from '../types'
import { isSupabaseBrowserConfigured } from '../services/supabaseBrowserClient'

const typeOptions: Array<{ label: string; value: SubmissionType }> = [
  { label: '新增餐厅', value: 'restaurant' },
  { label: '新增菜品', value: 'dish' },
  { label: '提交评论', value: 'review' },
  { label: '打卡体验', value: 'checkin' },
  { label: '信息纠错', value: 'correction' }
]

const typeCopy: Record<SubmissionType, string> = {
  restaurant: '推荐一家还没收录的店',
  dish: '补一个必点菜',
  review: '给已有餐厅写短评',
  checkin: '记录一次真实体验',
  correction: '帮我们纠错'
}

function getTypeLabel(value: SubmissionType) {
  return typeOptions.find((option) => option.value === value)?.label ?? '新增餐厅'
}

function getClampedRating(value: string) {
  const numericValue = Number(value)
  if (!Number.isFinite(numericValue)) return 4
  return Math.max(1, Math.min(5, Math.round(numericValue * 10) / 10))
}

function getRatingStars(value: string) {
  const numericValue = Math.round(getClampedRating(value))
  return Array.from({ length: 5 }, (_, index) => index + 1 <= numericValue)
}

function uniqueTags(tags: string[]) {
  return tags.filter((tag, index, allTags) => tag && tag !== '全部' && allTags.indexOf(tag) === index)
}

function getDefaultMealPeriods() {
  return [getCurrentMealPeriod()]
}

function toggleMealPeriod(current: string[], period: string) {
  if (current.includes(period)) {
    return current.length > 1 ? current.filter((item) => item !== period) : current
  }
  return [...current, period]
}

function inferContributionTags(input: {
  mealCategory: MealCategoryOption
  serviceMode: string
  mealPeriods: string[]
  title: string
  content: string
  area: string
  cuisine: string
  price: string
}) {
  const text = [input.title, input.content, input.area, input.cuisine].join(' ')
  const tags = [
    input.mealCategory,
    input.serviceMode !== '都可以' ? input.serviceMode : '',
    ...input.mealPeriods
  ]
  const priceValue = Number(input.price)

  if (Number.isFinite(priceValue) && priceValue > 0 && priceValue <= 30) tags.push('实惠')
  if (/食堂|餐厅|饭堂|餐饮中心|四食|五食|玉湖|风味餐厅/.test(text)) tags.push('食堂')
  if (/北门|西门|东门|南门|堕落街|小吃街|银泰|创意园|校外|外卖/.test(text)) tags.push('非食堂')
  if (/奶茶|茶饮|柠檬茶|果茶/.test(text)) tags.push('奶茶')
  if (/咖啡|拿铁|美式|冷萃/.test(text)) tags.push('咖啡')
  if (/甜品|蛋糕|烘焙|面包|泡芙/.test(text)) tags.push('甜品')
  if (/面|粉|米线|拌面|拉面|刀削面|馄饨|水饺|饺子/.test(text)) tags.push('面食')
  if (/烧烤|烤肉|烤串/.test(text)) tags.push('烧烤')
  if (/火锅|麻辣烫|冒菜|串串/.test(text)) tags.push('火锅')
  if (/清真|halal/i.test(text)) tags.push('清真友好')
  if (/不辣|清淡|粥|汤|粤式|广式/.test(text)) tags.push('不辣')
  else if (/麻辣|香辣|辣|川菜|湘菜|冒菜|火锅|烧烤/.test(text)) tags.push('辣')
  if (/一个人|单人|独自|一人食/.test(text)) tags.push('一人食')
  if (/聚餐|多人|约饭|团建|寝室/.test(text)) tags.push('聚餐')
  if (/快|赶课|不排队|出餐|十分钟|快速/.test(text)) tags.push('快餐')
  if (/夜宵|晚归|自习后|夜跑/.test(text)) tags.push('夜宵')

  return uniqueTags(tags)
}

export function ContributePage() {
  const [type, setType] = useState<SubmissionType>('restaurant')
  const [title, setTitle] = useState('')
  const [content, setContent] = useState('')
  const [area, setArea] = useState('')
  const [cuisine, setCuisine] = useState('')
  const [price, setPrice] = useState('')
  const [restaurantId, setRestaurantId] = useState('')
  const [rating, setRating] = useState('4')
  const [campus, setCampus] = useState('紫金港')
  const [mealCategory, setMealCategory] = useState<MealCategoryOption>('正餐')
  const [serviceMode, setServiceMode] = useState('都可以')
  const [mealPeriods, setMealPeriods] = useState<string[]>(getDefaultMealPeriods)
  const [scenarioTags, setScenarioTags] = useState<string[]>([])
  const [dietaryTags, setDietaryTags] = useState<string[]>([])
  const [spiceLevel, setSpiceLevel] = useState('不限')
  const [loadLevel, setLoadLevel] = useState('不限')
  const [status, setStatus] = useState('')
  const [restaurantOptions, setRestaurantOptions] = useState<RestaurantSummary[]>([])
  const configured = isSupabaseBrowserConfigured()
  const needsRestaurantId = type === 'dish' || type === 'review' || type === 'checkin'
  const inferredTags = inferContributionTags({ mealCategory, serviceMode, mealPeriods, title, content, area, cuisine, price })
  const selectedTags = collectFilterTags({ scenarioTags, dietaryTags, preferenceTags: inferredTags, spiceLevel, loadLevel })
  const ratingStars = getRatingStars(rating)

  useEffect(() => {
    if (!needsRestaurantId) return undefined
    const controller = new AbortController()
    listRestaurantsRemote({ campus, sort: 'recommended' }, undefined, controller.signal)
      .then((result) => setRestaurantOptions(result.data.slice(0, 80)))
      .catch(() => setRestaurantOptions([]))
    return () => controller.abort()
  }, [campus, needsRestaurantId])

  async function submitForm(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()

    setStatus('正在提交…')

    try {
      const normalizedRating = getClampedRating(rating)
      const result = await submitContribution(type, {
        title: title.trim(),
        content: content.trim(),
        area: area.trim() || undefined,
        cuisine: cuisine.trim() || undefined,
        price: price ? Number(price) : undefined,
        campus,
        restaurantId: needsRestaurantId ? restaurantId.trim() || undefined : undefined,
        rating: normalizedRating,
        serviceMode,
        diningMode: serviceMode === '都可以' ? undefined : serviceMode,
        mealPeriod: mealPeriods[0],
        mealPeriods,
        tags: selectedTags,
        scenarioTags,
        dietaryTags,
        preferenceTags: inferredTags,
        spiceLevel: spiceLevel === '不限' ? undefined : spiceLevel,
        loadLevel: loadLevel === '不限' ? undefined : loadLevel,
        taxonomyVersion: 3
      })
      setStatus(`已提交，我们会尽快审核。编号：${result.id}`)
      setTitle('')
      setContent('')
      setArea('')
      setCuisine('')
      setPrice('')
      setRestaurantId('')
      setRating('4')
      setCampus('紫金港')
      setMealCategory('正餐')
      setServiceMode('都可以')
      setMealPeriods(getDefaultMealPeriods())
      setScenarioTags([])
      setDietaryTags([])
      setSpiceLevel('不限')
      setLoadLevel('不限')
    } catch (error) {
      console.error('[contribute] failed to submit recommendation', error)
      setStatus('提交暂时失败，请检查内容后再试。')
    }
  }

  return (
    <div className="route-stack contribute-route">
      <div className="page-heading split-heading contribute-heading">
        <div>
          <p className="eyebrow">CONTRIBUTE</p>
          <h1>三十秒补一家好吃的</h1>
          <p>像给朋友发一张饭店小卡片：名字、人均、推荐理由先写清楚，复杂标签之后再补。</p>
        </div>
        <span className="count-badge">先审后发</span>
      </div>

      <GlassCard className="contribute-status-card">
        <div>
          <p className="eyebrow">QUEUE</p>
          <h2>{configured ? '提交后会先审核' : '暂时只能预览填写效果'}</h2>
        </div>
        <p>{configured ? '登录后提交，我们确认内容真实、清楚后再公开给大家。' : '你可以先整理内容，等投稿功能开放后再发送。'}</p>
      </GlassCard>

      <GlassCard className="contribution-card simplified-contribution-card" id="contribution-form">
        <form className="contribution-form simplified-contribution-form" onSubmit={submitForm}>
          <section className="contribution-paper" aria-label="贡献资料表单">
            <div className="contribution-paper-head">
              <div>
                <p className="eyebrow">QUICK CARD</p>
                <h2>{getTypeLabel(type)}</h2>
                <p>{typeCopy[type]}</p>
              </div>
              <select id="submission-type" className="contribution-type-select" value={type} onChange={(event) => setType(event.target.value as SubmissionType)} aria-label="提交类型">
                {typeOptions.map((option) => (
                  <option key={option.value} value={option.value}>{option.label}</option>
                ))}
              </select>
            </div>

            <label className="contribution-row" htmlFor="submission-title">
              <span className="row-icon" aria-hidden="true">A</span>
              <span className="row-label">名字</span>
              <input id="submission-title" name="submission-title" value={title} maxLength={80} autoComplete="off" placeholder="例如：烧腊饭 / 北门砂锅" onChange={(event) => setTitle(event.target.value)} required />
            </label>

            <div className="contribution-row stacked-row">
              <span className="row-icon" aria-hidden="true">⌖</span>
              <span className="row-label">校区</span>
              <div className="mini-chip-grid" role="group" aria-label="所在校区">
                {campusOptions.map((option) => (
                  <button key={option} className={`mini-chip ${campus === option ? 'active' : ''}`} type="button" aria-pressed={campus === option} onClick={() => setCampus(option)}>
                    {option}
                  </button>
                ))}
              </div>
            </div>

            <div className="contribution-row stacked-row">
              <span className="row-icon" aria-hidden="true">□</span>
              <span className="row-label">类型</span>
              <div className="mini-chip-grid" role="group" aria-label="餐饮类型">
                {mealCategoryOptions.map((option) => (
                  <button key={option.value} className={`mini-chip ${mealCategory === option.value ? 'active' : ''}`} type="button" aria-pressed={mealCategory === option.value} onClick={() => setMealCategory(option.value)}>
                    {option.label}
                  </button>
                ))}
              </div>
              <p className="row-hint neutral">正餐和饮品先分开，后面的分类会自动整理。</p>
            </div>

            <div className="contribution-row stacked-row">
              <span className="row-icon" aria-hidden="true">↔</span>
              <span className="row-label">方式</span>
              <div className="mini-chip-grid" role="group" aria-label="堂食或外卖">
                {serviceModeOptions.map((mode) => (
                  <button key={mode} className={`mini-chip ${serviceMode === mode ? 'active' : ''}`} type="button" aria-pressed={serviceMode === mode} onClick={() => setServiceMode(mode)}>
                    {mode}
                  </button>
                ))}
              </div>
            </div>

            <div className="contribution-row stacked-row" data-tour-id="contribute-meal-periods">
              <span className="row-icon" aria-hidden="true">○</span>
              <span className="row-label">餐段</span>
              <div className="mini-chip-grid" role="group" aria-label="适合餐段">
                {mealPeriodOptions.map((period) => (
                  <button key={period} className={`mini-chip ${mealPeriods.includes(period) ? 'active' : ''}`} type="button" aria-pressed={mealPeriods.includes(period)} onClick={() => setMealPeriods((periods) => toggleMealPeriod(periods, period))}>
                    {period}
                  </button>
                ))}
              </div>
              <p className="row-hint neutral">可多选，例如中餐 + 晚餐 + 夜宵；至少保留一个餐段。</p>
            </div>

            <label className="contribution-row" htmlFor="submission-cuisine">
              <span className="row-icon" aria-hidden="true">≡</span>
              <span className="row-label">菜系</span>
              <input id="submission-cuisine" name="submission-cuisine" value={cuisine} maxLength={40} autoComplete="off" placeholder="例如：烧腊 / 面食 / 奶茶" onChange={(event) => setCuisine(event.target.value)} />
            </label>

            <label className="contribution-row" htmlFor="submission-area">
              <span className="row-icon" aria-hidden="true">◎</span>
              <span className="row-label">位置</span>
              <input id="submission-area" name="submission-area" value={area} maxLength={40} autoComplete="off" placeholder="例如：紫金港北门 / 玉泉四食堂" onChange={(event) => setArea(event.target.value)} />
            </label>

            <label className="contribution-row" htmlFor="submission-price">
              <span className="row-icon" aria-hidden="true">¥</span>
              <span className="row-label">人均</span>
              <input id="submission-price" name="submission-price" value={price} inputMode="numeric" autoComplete="off" placeholder="例如：18" onChange={(event) => setPrice(event.target.value.replace(/[^\d.]/g, ''))} />
            </label>

            <div className="contribution-row">
              <span className="row-icon" aria-hidden="true">☆</span>
              <span className="row-label">推荐</span>
              <div className="rating-picker" role="group" aria-label="推荐评分">
                {ratingStars.map((active, index) => {
                  const value = String(index + 1)
                  return (
                    <button key={value} className={active ? 'active' : ''} type="button" aria-label={`${value} 星`} aria-pressed={active && Number(rating) === index + 1} onClick={() => setRating(value)}>
                      ★
                    </button>
                  )
                })}
                <input value={rating} inputMode="decimal" aria-label="推荐评分数值" onChange={(event) => setRating(event.target.value)} />
              </div>
            </div>

            <label className="contribution-row note-row" htmlFor="submission-content">
              <span className="row-icon" aria-hidden="true">✎</span>
              <span className="row-label">备注</span>
              <textarea id="submission-content" value={content} maxLength={1000} placeholder="比如：叉烧好吃、饭点排队、适合赶课前快速解决。" onChange={(event) => setContent(event.target.value)} required />
            </label>

            <details className="advanced-contribution-panel">
              <summary>高级补充：辣度、饮食限制、关联餐厅</summary>
              <div className="advanced-contribution-grid">
                {hardFilterGroups.filter((group) => group.key !== 'distanceLabel').map((group) => {
                  const value = group.key === 'spiceLevel' ? spiceLevel : loadLevel
                  const onChange = group.key === 'spiceLevel' ? setSpiceLevel : setLoadLevel
                  return <SegmentedControl key={group.key} label={group.title} options={group.options.map((option) => ({ label: option, value: option }))} value={value} onChange={onChange} />
                })}
                {needsRestaurantId ? (
                  <label className="advanced-field">
                    <span>关联餐厅</span>
                    <input name="submission-restaurant-id" value={restaurantId} list="restaurant-id-options" autoComplete="off" placeholder="搜索或选择餐厅" onChange={(event) => setRestaurantId(event.target.value)} />
                    <datalist id="restaurant-id-options">
                      {restaurantOptions.map((restaurant) => (
                        <option key={restaurant.id} value={restaurant.id}>{restaurant.name} · {restaurant.area}</option>
                      ))}
                    </datalist>
                  </label>
                ) : null}
                <div className="advanced-tag-block">
                  <span>饮食限制</span>
                  <div className="chip-row" aria-label="饮食限制提交标签">
                    {dietaryConstraintTags.map((tag) => (
                      <button key={tag} className={`chip ${dietaryTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={dietaryTags.includes(tag)} onClick={() => setDietaryTags((tags) => toggleMultiTag(tags, tag))}>
                        {tag}
                      </button>
                    ))}
                  </div>
                </div>
              </div>
            </details>
          </section>

          <button className="primary-action submit-contribution-action" type="submit">提交审核</button>
          {status ? <p className="helper-text" aria-live="polite">{status}</p> : null}
        </form>

        <aside className="submission-preview simplified-preview" id="submit-preview">
          <p className="eyebrow">PREVIEW</p>
          <h2>{title || '这家店叫什么？'}</h2>
          <p>{content || '一句话写清楚：好吃什么、贵不贵、适合什么场景。'}</p>
          <div className="preview-score" aria-label={`推荐评分 ${rating}`}>
            {ratingStars.map((active, index) => <span key={index} className={active ? 'active' : ''}>★</span>)}
            <strong>{rating || '4'}</strong>
          </div>
          <div className="preview-meta">
            <span>{campus}</span>
            <span>{mealCategory}</span>
            <span>{serviceMode}</span>
            {mealPeriods.map((period) => <span key={period}>{period}</span>)}
            <span>{price ? `¥${price}/人` : '人均待补'}</span>
            <span>{area || '位置待补'}</span>
            {cuisine ? <span>{cuisine}</span> : null}
          </div>
          <div className="derived-tag-panel" aria-label="自动整理结果">
            <span>自动整理</span>
            <div className="tag-row roomy-tags">
              {selectedTags.slice(0, 8).map((tag) => <span className="tag strong" key={tag}>{tag}</span>)}
            </div>
          </div>
          <p className="helper-text">审核通过后才会公开。我们会确认内容真实、清楚，再展示给正在找饭的同学。</p>
        </aside>
      </GlassCard>
    </div>
  )
}
