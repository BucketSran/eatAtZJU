import { useEffect, useState, type FormEvent } from 'react'
import { GlassCard } from '../components/GlassCard'
import { SegmentedControl } from '../components/SegmentedControl'
import { campusOptions, collectFilterTags, dietaryConstraintTags, getCurrentMealPeriod, hardFilterGroups, mealPeriodOptions, preferenceTagGroups, scenarioTagGroups, serviceModeOptions, toggleMultiTag } from '../constants/restaurantTaxonomy'
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
  const [serviceMode, setServiceMode] = useState('都可以')
  const [mealPeriod, setMealPeriod] = useState(() => getCurrentMealPeriod())
  const [scenarioTags, setScenarioTags] = useState<string[]>([])
  const [dietaryTags, setDietaryTags] = useState<string[]>([])
  const [preferenceTags, setPreferenceTags] = useState<string[]>([])
  const [spiceLevel, setSpiceLevel] = useState('不限')
  const [loadLevel, setLoadLevel] = useState('不限')
  const [status, setStatus] = useState('')
  const [restaurantOptions, setRestaurantOptions] = useState<RestaurantSummary[]>([])
  const configured = isSupabaseBrowserConfigured()
  const needsRestaurantId = type === 'dish' || type === 'review' || type === 'checkin'
  const selectedTags = collectFilterTags({ scenarioTags, dietaryTags, preferenceTags, spiceLevel, loadLevel })
  const needsTags = selectedTags.length === 0

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

    if (needsTags) {
      setStatus('请至少选择一个精细标签，方便管理员审核和后续推荐匹配。')
      return
    }

    setStatus('正在提交…')

    try {
      const result = await submitContribution(type, {
        title: title.trim(),
        content: content.trim(),
        area: area.trim() || undefined,
        cuisine: cuisine.trim() || undefined,
        price: price ? Number(price) : undefined,
        campus,
        restaurantId: needsRestaurantId ? restaurantId.trim() || undefined : undefined,
        rating: needsRestaurantId && rating ? Number(rating) : undefined,
        serviceMode,
        diningMode: serviceMode === '都可以' ? undefined : serviceMode,
        mealPeriod,
        tags: selectedTags,
        scenarioTags,
        dietaryTags,
        preferenceTags,
        spiceLevel: spiceLevel === '不限' ? undefined : spiceLevel,
        loadLevel: loadLevel === '不限' ? undefined : loadLevel,
        taxonomyVersion: 2
      })
      setStatus(`已提交审核：${result.id}`)
      setTitle('')
      setContent('')
      setArea('')
      setCuisine('')
      setPrice('')
      setRestaurantId('')
      setRating('4')
      setCampus('紫金港')
      setScenarioTags([])
      setDietaryTags([])
      setPreferenceTags([])
      setSpiceLevel('不限')
      setLoadLevel('不限')
    } catch (error) {
      setStatus(error instanceof Error ? error.message : '提交失败')
    }
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">CONTRIBUTE</p>
          <h1>贡献餐厅资料</h1>
          <p>真实 UGC 不会直接公开，会先进入 submissions 审核队列。</p>
        </div>
        <span className="count-badge">审核优先</span>
      </div>

      <GlassCard className="demo-note">
        <p className="eyebrow">STATUS</p>
        <h2>{configured ? 'Supabase 已配置后可提交' : '当前还未配置 Supabase'}</h2>
        <p>{configured ? '请先在“我的”页面登录，再提交资料。' : '这页已经是可接真实后端的表单骨架；配置 Vercel/Supabase 环境变量后即可走真实 submissions API。'}</p>
      </GlassCard>

      <GlassCard className="contribution-card">
        <form className="form-stack contribution-form" onSubmit={submitForm}>
          <div className="form-section">
            <div className="section-heading card-heading">
              <div>
                <p className="eyebrow">STEP 1</p>
                <h2>基础信息</h2>
                <p>先把管理员最需要判断的信息写清楚。餐厅投稿审核通过后会直接进入正式餐厅表。</p>
              </div>
            </div>

            <SegmentedControl label="所在校区" options={campusOptions.map((option) => ({ label: option, value: option }))} value={campus} onChange={setCampus} />

            <label className="search-label" htmlFor="submission-type">提交类型</label>
            <select id="submission-type" className="search-input" value={type} onChange={(event) => setType(event.target.value as SubmissionType)}>
              {typeOptions.map((option) => (
                <option key={option.value} value={option.value}>{option.label}</option>
              ))}
            </select>

            <div className="form-grid">
              <label>
                <span className="search-label">标题</span>
                <input name="submission-title" className="search-input" value={title} maxLength={80} autoComplete="off" placeholder="例如：北门新开的砂锅店" onChange={(event) => setTitle(event.target.value)} required />
              </label>
              <label>
                <span className="search-label">人均价格</span>
                <input name="submission-price" className="search-input" value={price} inputMode="numeric" autoComplete="off" placeholder="例如：28" onChange={(event) => setPrice(event.target.value)} />
              </label>
              <label>
                <span className="search-label">区域</span>
                <input name="submission-area" className="search-input" value={area} maxLength={40} autoComplete="off" placeholder="例如：紫金港北门 / 校内" onChange={(event) => setArea(event.target.value)} />
              </label>
              <label>
                <span className="search-label">菜系/类型</span>
                <input name="submission-cuisine" className="search-input" value={cuisine} maxLength={40} autoComplete="off" placeholder="例如：川湘小炒 / 咖啡甜点" onChange={(event) => setCuisine(event.target.value)} />
              </label>
            </div>

            {needsRestaurantId ? (
              <div className="form-grid compact-form-grid">
                <label>
                  <span className="search-label">关联餐厅</span>
                  <input name="submission-restaurant-id" className="search-input" value={restaurantId} list="restaurant-id-options" autoComplete="off" placeholder="输入或选择餐厅 ID" onChange={(event) => setRestaurantId(event.target.value)} />
                  <datalist id="restaurant-id-options">
                    {restaurantOptions.map((restaurant) => (
                      <option key={restaurant.id} value={restaurant.id}>{restaurant.name} · {restaurant.area}</option>
                    ))}
                  </datalist>
                </label>
                <label>
                  <span className="search-label">评分</span>
                  <input name="submission-rating" className="search-input" value={rating} inputMode="decimal" autoComplete="off" placeholder="1-5" onChange={(event) => setRating(event.target.value)} />
                </label>
              </div>
            ) : null}

            <label className="search-label" htmlFor="submission-content">说明</label>
            <textarea id="submission-content" className="text-area" value={content} maxLength={1000} placeholder="写下位置、菜品、人均、适合场景或纠错内容。" onChange={(event) => setContent(event.target.value)} required />
          </div>

          <div className="form-section">
            <div className="section-heading card-heading">
              <div>
                <p className="eyebrow">STEP 2</p>
                <h2>分类和标签</h2>
                <p>这些字段会直接影响发现页筛选、榜单和推荐，请尽量贴近真实体验。</p>
              </div>
            </div>

            <SegmentedControl label="怎么吃" options={serviceModeOptions.map((mode) => ({ label: mode, value: mode }))} value={serviceMode} onChange={setServiceMode} />
            <SegmentedControl label="餐段" options={mealPeriodOptions.map((period) => ({ label: period, value: period }))} value={mealPeriod} onChange={setMealPeriod} />

            <div className={`filter-section ${needsTags ? 'needs-attention' : ''}`}>
              <div className="filter-section-head">
                <div>
                  <span className="filter-section-label">场景标签</span>
                  <p>同一层可以多选。比如“一人食 + 赶课快吃”。</p>
                </div>
                {selectedTags.length ? <span className="status-strip compact-status">{selectedTags.length} 个标签</span> : null}
              </div>
              {scenarioTagGroups.map((group) => (
                <div className="chip-row" aria-label={`${group.title}提交标签`} key={group.title}>
                  {group.tags.map((tag) => (
                    <button key={tag} className={`chip ${scenarioTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={scenarioTags.includes(tag)} onClick={() => setScenarioTags((tags) => toggleMultiTag(tags, tag))}>
                      {tag}
                    </button>
                  ))}
                </div>
              ))}
              {needsTags ? <p className="helper-text warning-text">还没有选择标签。建议至少选 1-3 个，越准确越容易通过审核。</p> : null}
            </div>

            <div className="filter-section">
              <div className="filter-section-head">
                <div>
                  <span className="filter-section-label">硬条件与偏好</span>
                  <p>冲突项做成单选，多选项只用于补充描述。</p>
                </div>
              </div>
              {hardFilterGroups.filter((group) => group.key !== 'distanceLabel').map((group) => {
                const value = group.key === 'spiceLevel' ? spiceLevel : loadLevel
                const onChange = group.key === 'spiceLevel' ? setSpiceLevel : setLoadLevel
                return <SegmentedControl key={group.key} label={group.title} options={group.options.map((option) => ({ label: option, value: option }))} value={value} onChange={onChange} />
              })}
              <div className="chip-row" aria-label="饮食限制提交标签">
                {dietaryConstraintTags.map((tag) => (
                  <button key={tag} className={`chip ${dietaryTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={dietaryTags.includes(tag)} onClick={() => setDietaryTags((tags) => toggleMultiTag(tags, tag))}>
                    {tag}
                  </button>
                ))}
              </div>
              {preferenceTagGroups.map((group) => (
                <div className="chip-row" aria-label={`${group.title}提交标签`} key={group.title}>
                  {group.tags.map((tag) => (
                    <button key={tag} className={`chip ${preferenceTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={preferenceTags.includes(tag)} onClick={() => setPreferenceTags((tags) => toggleMultiTag(tags, tag))}>
                      {tag}
                    </button>
                  ))}
                </div>
              ))}
            </div>
          </div>

          <button className="primary-action" type="submit">提交到审核队列</button>
          {status ? <p className="helper-text" aria-live="polite">{status}</p> : null}
        </form>

        <aside className="submission-preview">
          <p className="eyebrow">REVIEW PREVIEW</p>
          <h2>{title || '待提交资料'}</h2>
          <p>{content || '这里会作为管理员审核时看到的正文。'}</p>
          <div className="preview-meta">
            <span>{serviceMode}</span>
            <span>{mealPeriod}</span>
            <span>{campus}</span>
            <span>{price ? `¥${price}/人` : '价格待补充'}</span>
            <span>{area || '区域待补充'}</span>
          </div>
          <div className="tag-row roomy-tags">
            {selectedTags.length ? selectedTags.map((tag) => <span className="tag strong" key={tag}>{tag}</span>) : <span className="tag">至少选择 1 个标签</span>}
          </div>
          <p className="helper-text">审核通过后：餐厅投稿会进入正式餐厅表；菜品/评论需要有关联餐厅 ID 才会自动落库。已有餐厅候选会随校区变化自动刷新。</p>
        </aside>
      </GlassCard>
    </div>
  )
}
