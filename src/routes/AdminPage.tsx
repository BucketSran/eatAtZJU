import { useMemo, useState } from 'react'
import { EmptyState } from '../components/EmptyState'
import { GlassCard } from '../components/GlassCard'
import { PublishedContentOpsPanel } from '../components/PublishedContentOpsPanel'
import { SegmentedControl } from '../components/SegmentedControl'
import { mealPeriodOptions, serviceModeOptions } from '../constants/restaurantTaxonomy'
import { listAuditLogs, rollbackAuditLog, type AdminAuditLog } from '../services/adminAuditService'
import { listPendingSubmissions, reviewSubmission, type AdminSubmission } from '../services/adminSubmissionService'
import { isSupabaseBrowserConfigured } from '../services/supabaseBrowserClient'

type FactVerdict = 'verified' | 'needs_evidence' | 'duplicate_risk'
type TasteVerdict = 'recommend' | 'neutral' | 'skip'
type ReviewPriority = 'high' | 'medium' | 'low'

type QuickReviewState = {
  factVerdict: FactVerdict
  tasteVerdict: TasteVerdict
  issueTags: string[]
}

type ReviewCardData = {
  id: string
  typeLabel: string
  title: string
  meta: string
  content: string
  sourceSummary: string
  factSignals: string[]
  tasteSignals: string[]
  suggestedIssueTags: string[]
  priority: ReviewPriority
  priorityLabel: string
  createdLabel?: string
}

type ReviewQueueCardProps = {
  data: ReviewCardData
  mode: 'preview' | 'live'
  quickState: QuickReviewState
  feedback?: string
  onFactVerdictChange: (value: FactVerdict) => void
  onTasteVerdictChange: (value: TasteVerdict) => void
  onToggleIssueTag: (tag: string) => void
  onApproveRecommend: () => void
  onApproveNeutral: () => void
  onRejectForMoreInfo: () => void
  onEdit: () => void
}

const listFields = new Set(['tags', 'scenarioTags', 'constraintTags', 'preferenceTags', 'serviceModes', 'mealPeriods'])
const issueCatalog = ['缺来源', '缺价格', '缺定位', '缺营业时段', '疑似重复', '口味分歧', '需要补图'] as const

const factVerdictOptions: Array<{ label: string; value: FactVerdict }> = [
  { label: '可发布', value: 'verified' },
  { label: '需补证', value: 'needs_evidence' },
  { label: '疑似重复', value: 'duplicate_risk' }
]

const tasteVerdictOptions: Array<{ label: string; value: TasteVerdict }> = [
  { label: '值得推', value: 'recommend' },
  { label: '一般', value: 'neutral' },
  { label: '不主推', value: 'skip' }
]

const previewQueue: ReviewCardData[] = [
  {
    id: 'preview-restaurant-1',
    typeLabel: 'restaurant',
    title: '北门砂锅小馆',
    meta: '堂食 · 晚餐 · 夜宵 / 下饭 / 辣',
    content: '离北门近，砂锅和盖饭都稳。AI 给了高分，但来源只有一条公开链接，没有学生口味分歧说明。',
    sourceSummary: '1 条公开来源，缺学生补充。适合人工快速决定“能不能上”和“要不要主推”。',
    factSignals: ['区域：紫金港北门', '人均：¥24', '标签：夜宵 / 下饭 / 辣', '来源：仅 1 条留档'],
    tasteSignals: ['场景明确，适合一人食和晚餐补位', 'AI 倾向高分，但没有真实学生偏好证据'],
    suggestedIssueTags: ['缺来源', '口味分歧'],
    priority: 'high',
    priorityLabel: 'AI 高分但证据薄'
  },
  {
    id: 'preview-correction-1',
    typeLabel: 'correction',
    title: '阿姨糖水铺',
    meta: '外带 · 下午茶 · 甜品 / 奶茶',
    content: '大家知道它不难吃，但菜单和营业时段变动快。投稿人只说“最近常排队”，没有补价格和具体更新时间。',
    sourceSummary: '像这种“你知道还行，但懒得编辑”的店，快审更适合只留轻量判断，不逼管理员重写文案。',
    factSignals: ['区域：西园生活区', '缺人均价格', '缺营业时段', '标签：甜品 / 奶茶'],
    tasteSignals: ['适合补充“可推但不主推”这类轻判断', '高频店更需要短标签，不需要长推荐理由'],
    suggestedIssueTags: ['缺价格', '缺营业时段'],
    priority: 'medium',
    priorityLabel: '高频店待补事实'
  }
]

function readString(value: unknown) {
  return typeof value === 'string' ? value : ''
}

function readStringArray(value: unknown) {
  return Array.isArray(value) ? value.filter((item): item is string => typeof item === 'string') : []
}

function stringifyPayload(payload: Record<string, unknown>) {
  const title = readString(payload.title) || '未命名提交'
  const content = readString(payload.content) || JSON.stringify(payload)
  const tags = readStringArray(payload.tags).join(' / ')
  const meta = [readString(payload.serviceMode) || readString(payload.diningMode), readString(payload.mealPeriod), tags].filter(Boolean).join(' · ')
  return { title, content, meta }
}

function toEditablePayload(payload: Record<string, unknown>) {
  return {
    ...payload,
    serviceMode: readString(payload.serviceMode) || readString(payload.diningMode) || '都可以',
    mealPeriod: readString(payload.mealPeriod) || '中餐',
    tags: readStringArray(payload.tags),
    scenarioTags: readStringArray(payload.scenarioTags),
    constraintTags: readStringArray(payload.constraintTags),
    preferenceTags: readStringArray(payload.preferenceTags)
  }
}

function parseListInput(value: string) {
  return value
    .split(/[,，/]/)
    .map((item) => item.trim())
    .filter(Boolean)
}

function normalizeDraftPayload(payload: Record<string, unknown>) {
  const normalized: Record<string, unknown> = { ...payload }
  for (const key of ['price', 'rating', 'distance', 'walkMinutes', 'latitude', 'longitude']) {
    if (normalized[key] === '' || normalized[key] === undefined) {
      delete normalized[key]
    } else {
      const number = Number(normalized[key])
      if (Number.isFinite(number)) normalized[key] = number
    }
  }
  normalized.diningMode = normalized.serviceMode === '都可以' ? undefined : normalized.serviceMode
  normalized.serviceModes = normalized.serviceMode && normalized.serviceMode !== '都可以' ? [normalized.serviceMode] : []
  normalized.mealPeriods = normalized.mealPeriod ? [normalized.mealPeriod] : []
  return normalized
}

function summarizeSources(payload: Record<string, unknown>) {
  const sourceRefs = Array.isArray(payload.sourceRefs) ? payload.sourceRefs : []
  if (!sourceRefs.length) return '当前没有留来源链接，不能直接把它当成稳定事实。'
  return `已留 ${sourceRefs.length} 条来源。仍建议只做原创摘要，不直接复制第三方正文。`
}

function buildSuggestedIssueTags(payload: Record<string, unknown>) {
  const suggestions = new Set<string>()
  if (!readString(payload.area) && !readString(payload.campus)) suggestions.add('缺定位')
  if (payload.price === undefined || payload.price === null || payload.price === '') suggestions.add('缺价格')
  if (!Array.isArray(payload.sourceRefs) || payload.sourceRefs.length === 0) suggestions.add('缺来源')
  if (!readString(payload.openHours) && !readString(payload.hours)) suggestions.add('缺营业时段')
  if (readString(payload.content).includes('但') || readString(payload.content).includes('不过')) suggestions.add('口味分歧')
  return issueCatalog.filter((tag) => suggestions.has(tag))
}

function buildFactSignals(payload: Record<string, unknown>) {
  const tags = readStringArray(payload.tags)
  const price = payload.price
  return [
    readString(payload.area) ? `区域：${readString(payload.area)}` : '缺区域说明',
    typeof price === 'number' ? `人均：¥${price}` : '缺人均价格',
    tags.length ? `标签：${tags.slice(0, 4).join(' / ')}` : '缺推荐标签',
    Array.isArray(payload.sourceRefs) && payload.sourceRefs.length ? `来源：${payload.sourceRefs.length} 条留档` : '缺来源留档'
  ]
}

function buildTasteSignals(payload: Record<string, unknown>) {
  const signals: string[] = []
  const scenarioTags = readStringArray(payload.scenarioTags)
  const preferenceTags = readStringArray(payload.preferenceTags)
  const rating = payload.rating

  if (typeof rating === 'number') signals.push(`主观评分：${rating.toFixed(1)} / 5`)
  if (scenarioTags.length) signals.push(`场景：${scenarioTags.slice(0, 3).join(' / ')}`)
  if (preferenceTags.length) signals.push(`偏好：${preferenceTags.slice(0, 3).join(' / ')}`)
  if (readString(payload.content)) signals.push(`短备注：${readString(payload.content).slice(0, 36)}`)
  if (!signals.length) signals.push('还没有明显口味信号，适合先做事实审核')
  return signals.slice(0, 3)
}

function buildPriority(issueTags: string[], factSignals: string[]) {
  const missingCount = factSignals.filter((signal) => signal.startsWith('缺')).length
  if (missingCount >= 2) return { priority: 'high' as const, priorityLabel: '先补事实再判断' }
  if (issueTags.includes('口味分歧') || issueTags.includes('疑似重复')) return { priority: 'medium' as const, priorityLabel: '建议人工定调' }
  return { priority: 'low' as const, priorityLabel: '可快审' }
}

function formatCreatedLabel(createdAt?: string) {
  if (!createdAt) return ''
  return new Date(createdAt).toLocaleString()
}

function buildLiveReviewCard(item: AdminSubmission): ReviewCardData {
  const payload = item.payload
  const summary = stringifyPayload(payload)
  const suggestedIssueTags = buildSuggestedIssueTags(payload)
  const factSignals = buildFactSignals(payload)
  const tasteSignals = buildTasteSignals(payload)
  const { priority, priorityLabel } = buildPriority(suggestedIssueTags, factSignals)

  return {
    id: item.id,
    typeLabel: item.type,
    title: summary.title,
    meta: summary.meta,
    content: summary.content,
    sourceSummary: summarizeSources(payload),
    factSignals,
    tasteSignals,
    suggestedIssueTags,
    priority,
    priorityLabel,
    createdLabel: formatCreatedLabel(item.created_at)
  }
}

function createQuickReviewState(suggestedIssueTags: string[]): QuickReviewState {
  return {
    factVerdict: suggestedIssueTags.length ? 'needs_evidence' : 'verified',
    tasteVerdict: 'neutral',
    issueTags: suggestedIssueTags
  }
}

function mergeQuickReviewSignals(payload: Record<string, unknown>, quickState: QuickReviewState) {
  return normalizeDraftPayload({
    ...toEditablePayload(payload),
    moderationSignals: {
      factVerdict: quickState.factVerdict,
      tasteVerdict: quickState.tasteVerdict,
      issueTags: quickState.issueTags,
      reviewMode: 'quick',
      reviewedAt: new Date().toISOString()
    }
  })
}

function ReviewQueueCard({
  data,
  mode,
  quickState,
  feedback,
  onFactVerdictChange,
  onTasteVerdictChange,
  onToggleIssueTag,
  onApproveRecommend,
  onApproveNeutral,
  onRejectForMoreInfo,
  onEdit
}: ReviewQueueCardProps) {
  return (
    <article className="review-queue-card">
      <div className="review-card-top">
        <div className="review-card-copy">
          <div className="review-card-meta">
            <span>{data.typeLabel}</span>
            <strong>{data.title}</strong>
          </div>
          {data.meta ? <p className="review-meta-text">{data.meta}</p> : null}
          <p>{data.content}</p>
        </div>
        <div className="review-card-side">
          <span className={`review-priority ${data.priority}`}>{data.priorityLabel}</span>
          {data.createdLabel ? <span className="subtle-helper">{data.createdLabel}</span> : null}
        </div>
      </div>

      <p className="review-source-note">{data.sourceSummary}</p>

      <div className="review-signal-grid">
        <section className="review-signal-panel">
          <p className="eyebrow">事实核验</p>
          <ul className="review-signal-list">
            {data.factSignals.map((signal) => (
              <li key={signal}>{signal}</li>
            ))}
          </ul>
        </section>

        <section className="review-signal-panel">
          <p className="eyebrow">口味判断</p>
          <ul className="review-signal-list">
            {data.tasteSignals.map((signal) => (
              <li key={signal}>{signal}</li>
            ))}
          </ul>
        </section>
      </div>

      <div className="review-control-stack">
        <SegmentedControl label={`${data.title}事实判断`} options={factVerdictOptions} value={quickState.factVerdict} onChange={onFactVerdictChange} />
        <SegmentedControl label={`${data.title}推荐判断`} options={tasteVerdictOptions} value={quickState.tasteVerdict} onChange={onTasteVerdictChange} />

        <div className="review-issue-row">
          <p className="subtle-helper">常见问题</p>
          <div className="chip-row" aria-label={`${data.title}常见问题`}>
            {issueCatalog.map((tag) => (
              <button key={tag} className={`chip ${quickState.issueTags.includes(tag) ? 'active' : ''}`} type="button" aria-pressed={quickState.issueTags.includes(tag)} onClick={() => onToggleIssueTag(tag)}>
                {tag}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div className="hero-actions compact-actions">
        <button className="primary-action" type="button" onClick={onApproveRecommend}>
          {mode === 'preview' ? '模拟通过并推荐' : '通过并推荐'}
        </button>
        <button className="secondary-action" type="button" onClick={onApproveNeutral}>
          {mode === 'preview' ? '模拟通过但不主推' : '通过但不主推'}
        </button>
        <button className="secondary-action" type="button" onClick={onRejectForMoreInfo}>
          {mode === 'preview' ? '模拟退回补充' : '信息不足'}
        </button>
        <button className="secondary-action" type="button" onClick={onEdit}>
          {mode === 'preview' ? '打开细编视图' : '细编字段'}
        </button>
      </div>

      {feedback ? <p className="review-feedback">{feedback}</p> : null}
    </article>
  )
}

export function AdminPage() {
  const [items, setItems] = useState<AdminSubmission[]>([])
  const [auditLogs, setAuditLogs] = useState<AdminAuditLog[]>([])
  const [selectedId, setSelectedId] = useState('')
  const [draftPayload, setDraftPayload] = useState<Record<string, unknown>>({})
  const [status, setStatus] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [isAuditLoading, setIsAuditLoading] = useState(false)
  const [quickReviewState, setQuickReviewState] = useState<Record<string, QuickReviewState>>({})
  const [previewFeedback, setPreviewFeedback] = useState<Record<string, string>>({})
  const configured = isSupabaseBrowserConfigured()

  const selectedItem = useMemo(() => items.find((item) => item.id === selectedId), [items, selectedId])
  const liveReviewCards = useMemo(() => items.map(buildLiveReviewCard), [items])

  function ensureQuickState(id: string, suggestedIssueTags: string[]) {
    return quickReviewState[id] || createQuickReviewState(suggestedIssueTags)
  }

  function updateQuickState(id: string, suggestedIssueTags: string[], patch: Partial<QuickReviewState>) {
    setQuickReviewState((current) => {
      const base = current[id] || createQuickReviewState(suggestedIssueTags)
      return {
        ...current,
        [id]: {
          ...base,
          ...patch
        }
      }
    })
  }

  function toggleIssueTag(id: string, suggestedIssueTags: string[], tag: string) {
    setQuickReviewState((current) => {
      const base = current[id] || createQuickReviewState(suggestedIssueTags)
      const issueTags = base.issueTags.includes(tag)
        ? base.issueTags.filter((item) => item !== tag)
        : [...base.issueTags, tag]
      return {
        ...current,
        [id]: {
          ...base,
          issueTags
        }
      }
    })
  }

  function selectSubmission(item: AdminSubmission) {
    setSelectedId(item.id)
    setDraftPayload(toEditablePayload(item.payload))
  }

  function getDraftValue(key: string) {
    const value = draftPayload[key]
    if (Array.isArray(value)) return value.filter((item) => typeof item === 'string').join('，')
    return typeof value === 'string' || typeof value === 'number' ? String(value) : ''
  }

  function setDraftValue(key: string, value: string) {
    setDraftPayload((current) => ({
      ...current,
      [key]: listFields.has(key) ? parseListInput(value) : value
    }))
  }

  async function loadSubmissions() {
    setIsLoading(true)
    setStatus('正在读取审核队列...')
    try {
      const data = await listPendingSubmissions()
      setItems(data)
      setStatus(data.length ? `读取到 ${data.length} 条待审核提交。` : '当前没有待审核提交。')
    } catch (error) {
      setStatus(error instanceof Error ? error.message : '读取失败')
    } finally {
      setIsLoading(false)
    }
  }

  async function handleReview(id: string, action: 'approve' | 'reject', reviewNote?: string, payloadOverride?: Record<string, unknown>) {
    setStatus(action === 'approve' ? '正在通过提交...' : '正在拒绝提交...')
    try {
      const result = await reviewSubmission(id, action, reviewNote, payloadOverride)
      setItems((current) => current.filter((item) => item.id !== id))
      if (selectedId === id) {
        setSelectedId('')
        setDraftPayload({})
      }
      const materializedText = result.materialized && !result.materialized.skipped
        ? `已写入 ${result.materialized.targetTable}/${result.materialized.targetId}。`
        : result.materialized?.reason
          ? `未自动落库：${result.materialized.reason}。`
          : ''
      setStatus(action === 'approve' ? `已通过并记录审计日志。${materializedText}` : '已拒绝并记录审计日志。')
      loadAuditLogs().catch(() => {})
    } catch (error) {
      setStatus(error instanceof Error ? error.message : '审核失败')
    }
  }

  async function handleQuickApprove(item: AdminSubmission, tasteVerdict: TasteVerdict) {
    const card = buildLiveReviewCard(item)
    const current = ensureQuickState(item.id, card.suggestedIssueTags)
    const nextQuickState = {
      ...current,
      tasteVerdict
    }
    await handleReview(
      item.id,
      'approve',
      tasteVerdict === 'recommend' ? 'Quick approve: recommend' : 'Quick approve: neutral',
      mergeQuickReviewSignals(item.payload, nextQuickState)
    )
  }

  async function handleQuickReject(item: AdminSubmission) {
    await handleReview(item.id, 'reject', 'Quick reject: need more evidence')
  }

  async function loadAuditLogs() {
    setIsAuditLoading(true)
    setStatus('正在读取审计日志...')
    try {
      const data = await listAuditLogs()
      setAuditLogs(data)
      setStatus(data.length ? `读取到 ${data.length} 条审计日志。` : '当前没有审计日志。')
    } catch (error) {
      setStatus(error instanceof Error ? error.message : '读取审计日志失败')
    } finally {
      setIsAuditLoading(false)
    }
  }

  async function handleRollback(auditLogId: string) {
    const confirmed = window.confirm('确认回滚这条变更吗？系统会恢复 before_data，并写入一条新的 rollback 审计日志。')
    if (!confirmed) return

    setStatus('正在回滚变更...')
    try {
      await rollbackAuditLog(auditLogId, 'Manual rollback from admin page')
      setStatus('已回滚，并写入 rollback 审计日志。')
      await loadAuditLogs()
      await loadSubmissions()
    } catch (error) {
      setStatus(error instanceof Error ? error.message : '回滚失败')
    }
  }

  function simulatePreviewResult(id: string, message: string) {
    setPreviewFeedback((current) => ({
      ...current,
      [id]: message
    }))
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">ADMIN</p>
          <h1>审核后台</h1>
          <p>先判断事实能不能发，再判断值不值得推。管理员不需要每条都重写成长文。</p>
        </div>
        <span className="count-badge">受限访问</span>
      </div>

      <GlassCard>
        <p className="eyebrow">WORKFLOW</p>
        <h2>快审优先，细编兜底</h2>
        <p>AI 先整理候选信息，人工只做两步判断：事实是否可信，口味是否值得推荐。拿不准时再进入字段细编。</p>
        <div className="note-grid">
          <span>先过事实核验</span>
          <span>再给推荐判断</span>
          <span>所有动作可回滚</span>
        </div>
      </GlassCard>

      <PublishedContentOpsPanel />

      <GlassCard className="admin-preview-card">
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">PREVIEW</p>
            <h2>快审预览</h2>
            <p>这两条是演示样本，用来看“少写字、快判断”的效果。真实队列会复用同一套卡片结构。</p>
          </div>
          <span className="count-badge">本地演示</span>
        </div>

        <div className="submission-list">
          {previewQueue.map((item) => {
            const current = ensureQuickState(item.id, item.suggestedIssueTags)
            return (
              <ReviewQueueCard
                key={item.id}
                data={item}
                mode="preview"
                quickState={current}
                feedback={previewFeedback[item.id]}
                onFactVerdictChange={(value) => updateQuickState(item.id, item.suggestedIssueTags, { factVerdict: value })}
                onTasteVerdictChange={(value) => updateQuickState(item.id, item.suggestedIssueTags, { tasteVerdict: value })}
                onToggleIssueTag={(tag) => toggleIssueTag(item.id, item.suggestedIssueTags, tag)}
                onApproveRecommend={() => simulatePreviewResult(item.id, `已模拟：事实=${current.factVerdict}，推荐=值得推。这个动作适合你“我知道它不错，但不想写长文”的场景。`)}
                onApproveNeutral={() => simulatePreviewResult(item.id, `已模拟：事实=${current.factVerdict}，推荐=一般。数据可公开，但不会因为 AI 高分就被主推。`)}
                onRejectForMoreInfo={() => simulatePreviewResult(item.id, `已模拟退回：${current.issueTags.join('、') || '信息不足'}。适合把“知道它行，但资料不完整”的情况先挂起。`)}
                onEdit={() => simulatePreviewResult(item.id, '这时再进入细编区补价格、营业时段、标签，不需要一开始就强迫自己写完整理由。')}
              />
            )
          })}
        </div>
      </GlassCard>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">QUEUE</p>
            <h2>待审核提交</h2>
            <p>{configured ? '使用当前登录账号访问管理员 API。账号必须存在于 admin_users 表。' : '当前缺少 VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY，先看上面的本地预览；配置后这里会读取真实审核队列。'}</p>
          </div>
          <button className="secondary-action" type="button" onClick={loadSubmissions} disabled={!configured || isLoading}>
            {isLoading ? '读取中...' : '读取队列'}
          </button>
        </div>

        {status ? <p className="helper-text">{status}</p> : null}

        {liveReviewCards.length ? (
          <div className="submission-list">
            {liveReviewCards.map((card) => {
              const item = items.find((current) => current.id === card.id)
              if (!item) return null
              const current = ensureQuickState(card.id, card.suggestedIssueTags)
              return (
                <ReviewQueueCard
                  key={card.id}
                  data={card}
                  mode="live"
                  quickState={current}
                  onFactVerdictChange={(value) => updateQuickState(card.id, card.suggestedIssueTags, { factVerdict: value })}
                  onTasteVerdictChange={(value) => updateQuickState(card.id, card.suggestedIssueTags, { tasteVerdict: value })}
                  onToggleIssueTag={(tag) => toggleIssueTag(card.id, card.suggestedIssueTags, tag)}
                  onApproveRecommend={() => handleQuickApprove(item, 'recommend')}
                  onApproveNeutral={() => handleQuickApprove(item, current.tasteVerdict === 'skip' ? 'skip' : 'neutral')}
                  onRejectForMoreInfo={() => handleQuickReject(item)}
                  onEdit={() => selectSubmission(item)}
                />
              )
            })}
          </div>
        ) : (
          <EmptyState
            eyebrow="QUEUE EMPTY"
            title={configured ? '当前没有待审核提交' : '真实审核队列尚未接通'}
            description={configured ? '可以先去贡献页提交一条测试资料，再回来试这套快审流程。' : '上面的快审预览已经展示了新交互；接通 Supabase 后，这里会复用同样的卡片来处理真实 submissions。'}
          />
        )}

        {selectedItem ? (
          <div className="review-editor">
            <div className="section-heading card-heading">
              <div>
                <p className="eyebrow">EDIT BEFORE APPROVE</p>
                <h2>细编字段</h2>
                <p>快审拿不准时再进来补字段。这里的修改会写回 submission payload，并用于正式表入库；原始提交会保存在审计日志 before_data。</p>
              </div>
            </div>

            <div className="form-grid">
              <label>
                <span className="search-label">标题</span>
                <input className="search-input" value={getDraftValue('title')} onChange={(event) => setDraftValue('title', event.target.value)} />
              </label>
              <label>
                <span className="search-label">人均价格</span>
                <input className="search-input" inputMode="numeric" value={getDraftValue('price')} onChange={(event) => setDraftValue('price', event.target.value)} />
              </label>
              <label>
                <span className="search-label">区域</span>
                <input className="search-input" value={getDraftValue('area')} onChange={(event) => setDraftValue('area', event.target.value)} />
              </label>
              <label>
                <span className="search-label">菜系/类型</span>
                <input className="search-input" value={getDraftValue('cuisine')} onChange={(event) => setDraftValue('cuisine', event.target.value)} />
              </label>
              <label>
                <span className="search-label">怎么吃</span>
                <select className="search-input" value={getDraftValue('serviceMode')} onChange={(event) => setDraftValue('serviceMode', event.target.value)}>
                  {serviceModeOptions.map((option) => <option key={option} value={option}>{option}</option>)}
                </select>
              </label>
              <label>
                <span className="search-label">餐段</span>
                <select className="search-input" value={getDraftValue('mealPeriod')} onChange={(event) => setDraftValue('mealPeriod', event.target.value)}>
                  {mealPeriodOptions.map((option) => <option key={option} value={option}>{option}</option>)}
                </select>
              </label>
              <label>
                <span className="search-label">关联餐厅 ID</span>
                <input className="search-input" value={getDraftValue('restaurantId')} onChange={(event) => setDraftValue('restaurantId', event.target.value)} />
              </label>
              <label>
                <span className="search-label">评分</span>
                <input className="search-input" inputMode="numeric" value={getDraftValue('rating')} onChange={(event) => setDraftValue('rating', event.target.value)} />
              </label>
            </div>

            <label className="search-label" htmlFor="admin-review-content">说明</label>
            <textarea id="admin-review-content" className="text-area" value={getDraftValue('content')} onChange={(event) => setDraftValue('content', event.target.value)} />

            <div className="form-grid">
              <label>
                <span className="search-label">全部标签</span>
                <input className="search-input" value={getDraftValue('tags')} onChange={(event) => setDraftValue('tags', event.target.value)} />
              </label>
              <label>
                <span className="search-label">场景标签</span>
                <input className="search-input" value={getDraftValue('scenarioTags')} onChange={(event) => setDraftValue('scenarioTags', event.target.value)} />
              </label>
              <label>
                <span className="search-label">硬条件标签</span>
                <input className="search-input" value={getDraftValue('constraintTags')} onChange={(event) => setDraftValue('constraintTags', event.target.value)} />
              </label>
              <label>
                <span className="search-label">偏好标签</span>
                <input className="search-input" value={getDraftValue('preferenceTags')} onChange={(event) => setDraftValue('preferenceTags', event.target.value)} />
              </label>
            </div>

            <div className="hero-actions compact-actions">
              <button className="secondary-action" type="button" onClick={() => handleReview(selectedItem.id, 'reject', 'Manual reject from edit panel')}>拒绝这条</button>
              <button
                className="primary-action"
                type="button"
                onClick={() => {
                  const current = ensureQuickState(selectedItem.id, buildSuggestedIssueTags(selectedItem.payload))
                  handleReview(
                    selectedItem.id,
                    'approve',
                    'Manual approve from edit panel',
                    normalizeDraftPayload({
                      ...draftPayload,
                      moderationSignals: {
                        factVerdict: current.factVerdict,
                        tasteVerdict: current.tasteVerdict,
                        issueTags: current.issueTags,
                        reviewMode: 'manual-edit',
                        reviewedAt: new Date().toISOString()
                      }
                    })
                  )
                }}
              >
                按编辑内容通过
              </button>
            </div>
          </div>
        ) : null}
      </GlassCard>

      <GlassCard className="demo-note">
        <p className="eyebrow">NEXT</p>
        <h2>下一步：让真实队列复用这套快审卡片</h2>
        <p>如果这版预览方向对，你后面只需要补两件事：一是把 quick review 信号写进 review note 或结构化字段，二是给队列加优先级排序，不再让管理员一条条硬读长文。</p>
      </GlassCard>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">ROLLBACK</p>
            <h2>审计日志与回滚</h2>
            <p>每次审核动作都会记录 before/after 快照。后续自动审批写入正式表前，也必须先写审计日志，确保污染数据可以回退。</p>
          </div>
          <button className="secondary-action" type="button" onClick={loadAuditLogs} disabled={!configured || isAuditLoading}>
            {isAuditLoading ? '读取中...' : '读取审计日志'}
          </button>
        </div>

        <div className="audit-list">
          {auditLogs.map((log) => (
            <article key={log.id} className="audit-card">
              <div>
                <span>{log.action}</span>
                <strong>{log.target_table} / {log.target_id}</strong>
                <p>{log.reason || '无备注'} · {new Date(log.created_at).toLocaleString()}</p>
              </div>
              <button className="secondary-action" type="button" onClick={() => handleRollback(log.id)} disabled={log.action === 'rollback'}>
                {log.action === 'rollback' ? '回滚记录' : '回滚'}
              </button>
            </article>
          ))}
        </div>
      </GlassCard>
    </div>
  )
}
