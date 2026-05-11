import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { campusOptions } from '../constants/restaurantTaxonomy'
import {
  createContentChangeRequest,
  listContentChangeRequests,
  submitContentChangeRequests,
  updateContentChangeRequestStatus,
  type AdminContentChangeRequest,
  type ContentChangeAction,
  type ContentChangeStats,
  type ContentChangeStatus
} from '../services/adminContentChangeService'
import { listRestaurantsRemote } from '../services/restaurantService'
import { isSupabaseBrowserConfigured } from '../services/supabaseBrowserClient'
import type { RestaurantSummary } from '../types'
import { GlassCard } from './GlassCard'

type PublishedChangeDraft = {
  id: string
  action: ContentChangeAction
  status: ContentChangeStatus
  title: string
  targetName: string
  targetId?: string
  summary: string
  payload: Record<string, unknown>
  submissionType: 'restaurant' | 'correction'
  submissionPayload: Record<string, unknown>
  submissionId?: string
  requestId?: string
}

type EditDraft = {
  name: string
  area: string
  price: string
  tags: string
  reason: string
}

type QuickAddDraft = EditDraft & {
  campus: string
  cuisine: string
}

const actionLabels: Record<ContentChangeAction, string> = {
  demote: '移出推荐',
  archive: '下架隐藏',
  edit: '修正资料',
  add: '新增餐厅'
}

const statusLabels: Record<ContentChangeStatus, string> = {
  draft: '草案',
  queued: '审核中',
  materialized: '已落库',
  rejected: '已驳回'
}

const historyStatusOptions = ['全部', 'draft', 'queued', 'materialized', 'rejected'] as const
const historyActionOptions = ['全部', 'demote', 'archive', 'edit', 'add'] as const

const initialQuickAdd: QuickAddDraft = {
  name: '',
  campus: '紫金港',
  area: '',
  cuisine: '',
  price: '',
  tags: '',
  reason: ''
}

function normalizeText(value: string) {
  return value.toLowerCase().replace(/[^\p{L}\p{N}]/gu, '')
}

function parseTags(value: string) {
  return value
    .split(/[,，/]/)
    .map((tag) => tag.trim())
    .filter(Boolean)
}

function createDraftId(action: ContentChangeAction) {
  return `${action}_${Date.now().toString(36)}_${Math.random().toString(36).slice(2, 7)}`
}

function createRestaurantEditDraft(restaurant: RestaurantSummary): EditDraft {
  return {
    name: restaurant.name,
    area: restaurant.area,
    price: String(restaurant.price),
    tags: restaurant.tags.slice(0, 8).join('，'),
    reason: restaurant.reason
  }
}

function buildPublishedChange(action: ContentChangeAction, restaurant: RestaurantSummary, editDraft?: EditDraft): PublishedChangeDraft {
  const basePayload = {
    targetTable: 'restaurants',
    targetId: restaurant.id,
    targetName: restaurant.name
  }

  if (action === 'demote') {
    const submissionPayload = {
      title: `把 ${restaurant.name} 移出推荐`,
      content: `人工快改：${restaurant.name} 不建议继续主推。保留公开信息，但建议标记为不主推，避免 AI 冷启动分数继续把它顶到前面。`,
      restaurantId: restaurant.id,
      campus: restaurant.campusLabel,
      area: restaurant.area,
      tags: ['已发布快改', '不主推'],
      opsAction: 'demote',
      opsTarget: basePayload
    }

    return {
      id: createDraftId(action),
      action,
      status: 'draft',
      title: `把 ${restaurant.name} 移出推荐`,
      targetName: restaurant.name,
      targetId: restaurant.id,
      summary: '保留公开信息，但标记为不主推，避免 AI 冷启动分数继续把它顶到前面。',
      payload: {
        ...basePayload,
        patch: {
          recommendationPolicy: 'not_recommended',
          moderationNote: '人工判断不主推'
        }
      },
      submissionType: 'correction',
      submissionPayload
    }
  }

  if (action === 'archive') {
    const submissionPayload = {
      title: `下架 ${restaurant.name}`,
      content: `人工快改：建议从公开列表隐藏 ${restaurant.name}。这不是不可逆删除，正式执行前需要管理员确认并保留审计记录。`,
      restaurantId: restaurant.id,
      campus: restaurant.campusLabel,
      area: restaurant.area,
      tags: ['已发布快改', '下架隐藏'],
      opsAction: 'archive',
      opsTarget: basePayload
    }

    return {
      id: createDraftId(action),
      action,
      status: 'draft',
      title: `下架 ${restaurant.name}`,
      targetName: restaurant.name,
      targetId: restaurant.id,
      summary: '从公开列表隐藏，但保留审计记录和回滚入口，不做不可逆删除。',
      payload: {
        ...basePayload,
        patch: {
          status: 'archived',
          moderationNote: '人工下架隐藏'
        }
      },
      submissionType: 'correction',
      submissionPayload
    }
  }

  const draft = editDraft ?? createRestaurantEditDraft(restaurant)
  const tags = parseTags(draft.tags)
  const submissionPayload = {
    title: `修正 ${restaurant.name}`,
    content: `人工快改：${draft.reason.trim() || `修正 ${restaurant.name} 的公开资料。`}`,
    restaurantId: restaurant.id,
    campus: restaurant.campusLabel,
    area: draft.area.trim(),
    price: draft.price ? Number(draft.price) : restaurant.price,
    tags: tags.length ? tags : ['已发布快改', '修正资料'],
    opsAction: 'edit',
    opsTarget: basePayload,
    patch: {
      name: draft.name.trim(),
      area: draft.area.trim(),
      price: draft.price ? Number(draft.price) : restaurant.price,
      tags,
      reason: draft.reason.trim()
    }
  }

  return {
    id: createDraftId(action),
    action,
    status: 'draft',
    title: `修正 ${restaurant.name}`,
    targetName: restaurant.name,
    targetId: restaurant.id,
    summary: `${draft.name} · ${draft.area} · ¥${draft.price || restaurant.price}/人。先进入待确认变更，管理员同意后再写正式表。`,
    payload: {
      ...basePayload,
      patch: {
        name: draft.name.trim(),
        area: draft.area.trim(),
        price: draft.price ? Number(draft.price) : restaurant.price,
        tags: parseTags(draft.tags),
        reason: draft.reason.trim()
      }
    },
    submissionType: 'correction',
    submissionPayload
  }
}

function buildAddChange(draft: QuickAddDraft): PublishedChangeDraft {
  const tags = parseTags(draft.tags)
  const createPayload = {
    title: draft.name.trim(),
    campus: draft.campus,
    area: draft.area.trim(),
    cuisine: draft.cuisine.trim(),
    price: draft.price ? Number(draft.price) : undefined,
    tags: tags.length ? tags : ['已发布快改', '新增餐厅'],
    content: draft.reason.trim(),
    sourceRefs: [{ type: 'manual_admin_ops', note: '人工快速新增草案' }],
    opsAction: 'add'
  }

  return {
    id: createDraftId('add'),
    action: 'add',
    status: 'draft',
    title: `新增 ${draft.name}`,
    targetName: draft.name,
    summary: `${draft.campus} · ${draft.area} · ${draft.cuisine} · ¥${draft.price || '待补'}/人。先作为新增餐厅草案等待管理员确认。`,
    payload: {
      targetTable: 'restaurants',
      create: createPayload
    },
    submissionType: 'restaurant',
    submissionPayload: createPayload
  }
}

function findDuplicateHints(name: string, restaurants: RestaurantSummary[]) {
  const normalized = normalizeText(name)
  if (!normalized) return []

  const keyword = normalized.slice(0, 3)
  return restaurants
    .filter((restaurant) => {
      const restaurantName = normalizeText(restaurant.name)
      return restaurantName.includes(normalized) || normalized.includes(restaurantName) || (keyword.length >= 2 && restaurantName.includes(keyword))
    })
    .slice(0, 3)
}

function toContentChangeInput(draft: PublishedChangeDraft) {
  return {
    action: draft.action,
    targetId: draft.targetId,
    targetName: draft.targetName,
    summary: draft.summary,
    payload: draft.payload,
    submissionType: draft.submissionType,
    submissionPayload: draft.submissionPayload
  }
}

function formatDateTime(value: string) {
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return value
  return date.toLocaleString('zh-CN', {
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit'
  })
}

export function PublishedContentOpsPanel() {
  const [restaurants, setRestaurants] = useState<RestaurantSummary[]>([])
  const [campus, setCampus] = useState('紫金港')
  const [query, setQuery] = useState('')
  const [loadStatus, setLoadStatus] = useState('正在读取已发布餐厅...')
  const [selectedRestaurantId, setSelectedRestaurantId] = useState('')
  const [editDraft, setEditDraft] = useState<EditDraft | null>(null)
  const [quickAddDraft, setQuickAddDraft] = useState<QuickAddDraft>(initialQuickAdd)
  const [changeDrafts, setChangeDrafts] = useState<PublishedChangeDraft[]>([])
  const [submitStatus, setSubmitStatus] = useState('')
  const [submittingDraftId, setSubmittingDraftId] = useState('')
  const [savedRequests, setSavedRequests] = useState<AdminContentChangeRequest[]>([])
  const [contentStats, setContentStats] = useState<ContentChangeStats>({ total: 0, byStatus: {}, byAction: {} })
  const [historyStatus, setHistoryStatus] = useState<(typeof historyStatusOptions)[number]>('全部')
  const [historyAction, setHistoryAction] = useState<(typeof historyActionOptions)[number]>('全部')
  const [historyQuery, setHistoryQuery] = useState('')
  const [historyStatusText, setHistoryStatusText] = useState('')
  const [isHistoryLoading, setIsHistoryLoading] = useState(false)
  const [batchStatus, setBatchStatus] = useState('')
  const configured = isSupabaseBrowserConfigured()

  async function loadContentChangeHistory() {
    if (!configured) {
      setSavedRequests([])
      setContentStats({ total: 0, byStatus: {}, byAction: {} })
      setHistoryStatusText('当前未配置 Supabase，快改历史暂不可用。')
      return
    }

    setIsHistoryLoading(true)
    setHistoryStatusText('正在读取快改历史...')
    try {
      const result = await listContentChangeRequests({
        status: historyStatus,
        action: historyAction,
        q: historyQuery.trim()
      })
      setSavedRequests(result.requests)
      setContentStats(result.stats)
      setHistoryStatusText(result.requests.length ? `读取到 ${result.requests.length} 条快改历史。` : '当前筛选条件下没有快改历史。')
    } catch (error) {
      setSavedRequests([])
      setHistoryStatusText(error instanceof Error ? error.message : '读取快改历史失败')
    } finally {
      setIsHistoryLoading(false)
    }
  }

  useEffect(() => {
    const controller = new AbortController()
    setLoadStatus('正在读取已发布餐厅...')

    listRestaurantsRemote({ campus, sort: 'recommended' }, undefined, controller.signal)
      .then((result) => {
        setRestaurants(result.data)
        setLoadStatus(result.data.length ? `已读取 ${result.data.length} 家 ${campus} 已发布餐厅。` : `当前没有读取到 ${campus} 餐厅。`)
      })
      .catch((error: unknown) => {
        if (error instanceof DOMException && error.name === 'AbortError') return
        setRestaurants([])
        setLoadStatus('读取已发布餐厅失败，稍后重试。')
      })

    return () => controller.abort()
  }, [campus])

  useEffect(() => {
    loadContentChangeHistory().catch(() => undefined)
  }, [configured, historyStatus, historyAction])

  const visibleRestaurants = useMemo(() => {
    const normalizedQuery = normalizeText(query)
    return restaurants
      .filter((restaurant) => {
        if (!normalizedQuery) return true
        const haystack = normalizeText([restaurant.name, restaurant.area, restaurant.cuisine, ...restaurant.tags].join(' '))
        return haystack.includes(normalizedQuery)
      })
      .slice(0, 8)
  }, [query, restaurants])

  const selectedRestaurant = useMemo(
    () => restaurants.find((restaurant) => restaurant.id === selectedRestaurantId) ?? null,
    [restaurants, selectedRestaurantId]
  )

  const duplicateHints = useMemo(() => findDuplicateHints(quickAddDraft.name, restaurants), [quickAddDraft.name, restaurants])
  const filteredDraftRequestIds = useMemo(() => savedRequests.filter((request) => request.status === 'draft').map((request) => request.id), [savedRequests])
  const localDraftCount = changeDrafts.filter((draft) => draft.status === 'draft').length

  function pushChangeDraft(draft: PublishedChangeDraft) {
    setChangeDrafts((current) => [draft, ...current].slice(0, 12))
  }

  function selectForEdit(restaurant: RestaurantSummary) {
    setSelectedRestaurantId(restaurant.id)
    setEditDraft(createRestaurantEditDraft(restaurant))
  }

  function updateEditDraft(key: keyof EditDraft, value: string) {
    setEditDraft((current) => current ? { ...current, [key]: value } : current)
  }

  function updateQuickAddDraft(key: keyof QuickAddDraft, value: string) {
    setQuickAddDraft((current) => ({ ...current, [key]: value }))
  }

  function submitEditDraft(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (!selectedRestaurant || !editDraft) return
    pushChangeDraft(buildPublishedChange('edit', selectedRestaurant, editDraft))
  }

  function submitQuickAdd(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (!quickAddDraft.name.trim()) return
    pushChangeDraft(buildAddChange(quickAddDraft))
  }

  function setLocalChangeStatus(id: string, status: ContentChangeStatus) {
    setChangeDrafts((current) => current.map((draft) => draft.id === id ? { ...draft, status } : draft))
  }

  async function submitDraftToQueue(draft: PublishedChangeDraft) {
    if (!configured) {
      setSubmitStatus('当前未配置 Supabase，只能本地预览草案。')
      return
    }

    setSubmittingDraftId(draft.id)
    setSubmitStatus(`正在提交到审核队列：${draft.title}`)
    try {
      const request = await createContentChangeRequest(toContentChangeInput(draft), true)
      setChangeDrafts((current) => current.map((item) => item.id === draft.id ? {
        ...item,
        requestId: request.id,
        submissionId: request.sourceSubmissionId ?? undefined,
        status: request.status
      } : item))
      setSubmitStatus(request.sourceSubmissionId ? `已提交审核队列：${request.sourceSubmissionId}` : `已保存快改请求：${request.id}`)
      await loadContentChangeHistory()
    } catch (error) {
      setSubmitStatus(error instanceof Error ? error.message : '提交审核队列失败')
    } finally {
      setSubmittingDraftId('')
    }
  }

  async function submitFilteredDrafts() {
    if (!configured) {
      setBatchStatus('当前未配置 Supabase，无法批量提交。')
      return
    }
    if (!filteredDraftRequestIds.length) {
      setBatchStatus('当前筛选结果没有可提交的草案。')
      return
    }

    setBatchStatus(`正在批量提交 ${filteredDraftRequestIds.length} 条快改草案...`)
    try {
      const requests = await submitContentChangeRequests(filteredDraftRequestIds)
      setBatchStatus(`已提交 ${requests.filter((request) => request.status === 'queued').length} 条快改草案到审核队列。`)
      await loadContentChangeHistory()
    } catch (error) {
      setBatchStatus(error instanceof Error ? error.message : '批量提交失败')
    }
  }

  async function rejectFilteredDrafts() {
    if (!configured) {
      setBatchStatus('当前未配置 Supabase，无法批量驳回。')
      return
    }
    if (!filteredDraftRequestIds.length) {
      setBatchStatus('当前筛选结果没有可驳回的草案。')
      return
    }

    setBatchStatus(`正在批量驳回 ${filteredDraftRequestIds.length} 条快改草案...`)
    try {
      const requests = await updateContentChangeRequestStatus(filteredDraftRequestIds, 'rejected')
      setBatchStatus(`已驳回 ${requests.filter((request) => request.status === 'rejected').length} 条快改草案。`)
      await loadContentChangeHistory()
    } catch (error) {
      setBatchStatus(error instanceof Error ? error.message : '批量驳回失败')
    }
  }

  return (
    <GlassCard className="published-ops-card">
      <div className="section-heading card-heading">
        <div>
          <p className="eyebrow">PUBLISHED OPS</p>
          <h2>已发布内容快改</h2>
          <p>针对已经公开的餐厅，先生成可审核的变更草案，再由管理员确认。适合快速处理“不主推、下架、修正、新增”。</p>
        </div>
        <span className="count-badge">{localDraftCount + (contentStats.byStatus.draft || 0)} 条草案</span>
      </div>

      <div className="published-ops-layout">
        <section className="published-search-panel">
          <div className="form-grid">
            <label>
              <span className="search-label">校区</span>
              <select className="search-input" value={campus} onChange={(event) => setCampus(event.target.value)}>
                {campusOptions.map((option) => <option key={option} value={option}>{option}</option>)}
              </select>
            </label>
            <label>
              <span className="search-label">搜索已发布餐厅</span>
              <input className="search-input" value={query} onChange={(event) => setQuery(event.target.value)} placeholder="张亮 / 炸鸡 / 北门" />
            </label>
          </div>
          <p className="helper-text">{loadStatus}</p>

          <div className="published-result-list">
            {visibleRestaurants.map((restaurant) => (
              <article className="published-result-card" key={restaurant.id}>
                <div>
                  <span>{restaurant.cuisine}</span>
                  <strong>{restaurant.name}</strong>
                  <p>{restaurant.area} · ¥{restaurant.price}/人 · 推荐分 {Math.round(restaurant.recommendationScore ?? 0)}</p>
                  <div className="tag-row compact-tag-row">
                    {restaurant.tags.slice(0, 5).map((tag) => <span className="tag" key={tag}>{tag}</span>)}
                  </div>
                </div>
                <div className="published-card-actions">
                  <button className="secondary-action" type="button" onClick={() => pushChangeDraft(buildPublishedChange('demote', restaurant))}>不主推</button>
                  <button className="secondary-action danger-action" type="button" onClick={() => pushChangeDraft(buildPublishedChange('archive', restaurant))}>下架</button>
                  <button className="primary-action" type="button" onClick={() => selectForEdit(restaurant)}>修正</button>
                </div>
              </article>
            ))}
          </div>
        </section>

        <section className="published-edit-panel">
          <form className="ops-form-block" onSubmit={submitEditDraft}>
            <div>
              <p className="eyebrow">EDIT</p>
              <h3>修正现有餐厅</h3>
            </div>
            {selectedRestaurant && editDraft ? (
              <>
                <p className="helper-text">正在修正：{selectedRestaurant.name}</p>
                <div className="form-grid">
                  <label>
                    <span className="search-label">名称</span>
                    <input className="search-input" value={editDraft.name} onChange={(event) => updateEditDraft('name', event.target.value)} />
                  </label>
                  <label>
                    <span className="search-label">人均</span>
                    <input className="search-input" inputMode="numeric" value={editDraft.price} onChange={(event) => updateEditDraft('price', event.target.value)} />
                  </label>
                </div>
                <label>
                  <span className="search-label">区域</span>
                  <input className="search-input" value={editDraft.area} onChange={(event) => updateEditDraft('area', event.target.value)} />
                </label>
                <label>
                  <span className="search-label">标签</span>
                  <input className="search-input" value={editDraft.tags} onChange={(event) => updateEditDraft('tags', event.target.value)} />
                </label>
                <label>
                  <span className="search-label">修正说明</span>
                  <textarea className="text-area compact-text-area" value={editDraft.reason} onChange={(event) => updateEditDraft('reason', event.target.value)} />
                </label>
                <button className="primary-action" type="submit">提交修正草案</button>
              </>
            ) : (
              <p className="helper-text">先在左侧搜索并点“修正”。</p>
            )}
          </form>

          <form className="ops-form-block" onSubmit={submitQuickAdd}>
            <div>
              <p className="eyebrow">ADD</p>
              <h3>快速新增餐厅</h3>
            </div>
            <div className="form-grid">
              <label>
                <span className="search-label">名称</span>
                <input className="search-input" value={quickAddDraft.name} onChange={(event) => updateQuickAddDraft('name', event.target.value)} />
              </label>
              <label>
                <span className="search-label">校区</span>
                <select className="search-input" value={quickAddDraft.campus} onChange={(event) => updateQuickAddDraft('campus', event.target.value)}>
                  {campusOptions.map((option) => <option key={option} value={option}>{option}</option>)}
                </select>
              </label>
            </div>
            <div className="form-grid">
              <label>
                <span className="search-label">区域</span>
                <input className="search-input" value={quickAddDraft.area} onChange={(event) => updateQuickAddDraft('area', event.target.value)} />
              </label>
              <label>
                <span className="search-label">人均</span>
                <input className="search-input" inputMode="numeric" value={quickAddDraft.price} onChange={(event) => updateQuickAddDraft('price', event.target.value)} />
              </label>
            </div>
            <label>
              <span className="search-label">类型</span>
              <input className="search-input" value={quickAddDraft.cuisine} onChange={(event) => updateQuickAddDraft('cuisine', event.target.value)} />
            </label>
            <label>
              <span className="search-label">标签</span>
              <input className="search-input" value={quickAddDraft.tags} onChange={(event) => updateQuickAddDraft('tags', event.target.value)} />
            </label>
            <label>
              <span className="search-label">人工备注</span>
              <textarea className="text-area compact-text-area" value={quickAddDraft.reason} onChange={(event) => updateQuickAddDraft('reason', event.target.value)} />
            </label>
            {duplicateHints.length ? (
              <p className="ops-duplicate-note">
                可能已存在：{duplicateHints.map((restaurant) => restaurant.name).join('、')}。可以改成修正别名或提权，不一定要新增。
              </p>
            ) : null}
            <button className="primary-action" type="submit">提交新增草案</button>
          </form>
        </section>
      </div>

      {submitStatus ? <p className="helper-text">{submitStatus}</p> : null}

      <div className="ops-form-block change-history-panel">
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">CHANGE HISTORY</p>
            <h3>快改历史筛选</h3>
          </div>
          <button className="secondary-action" type="button" onClick={() => void loadContentChangeHistory()} disabled={isHistoryLoading}>
            {isHistoryLoading ? '读取中...' : '刷新历史'}
          </button>
        </div>

        <div className="ops-stats-grid">
          <span><strong>{contentStats.total}</strong> 全部</span>
          <span><strong>{contentStats.byStatus.draft || 0}</strong> 草案</span>
          <span><strong>{contentStats.byStatus.queued || 0}</strong> 审核中</span>
          <span><strong>{contentStats.byStatus.materialized || 0}</strong> 已落库</span>
          <span><strong>{contentStats.byStatus.rejected || 0}</strong> 已驳回</span>
          <span><strong>{contentStats.byAction.demote || 0}</strong> 不主推</span>
          <span><strong>{contentStats.byAction.archive || 0}</strong> 下架</span>
          <span><strong>{contentStats.byAction.edit || 0}</strong> 修正</span>
          <span><strong>{contentStats.byAction.add || 0}</strong> 新增</span>
        </div>

        <div className="form-grid">
          <label>
            <span className="search-label">状态</span>
            <select className="search-input" value={historyStatus} onChange={(event) => setHistoryStatus(event.target.value as (typeof historyStatusOptions)[number])}>
              {historyStatusOptions.map((option) => <option key={option} value={option}>{option === '全部' ? option : statusLabels[option]}</option>)}
            </select>
          </label>
          <label>
            <span className="search-label">动作</span>
            <select className="search-input" value={historyAction} onChange={(event) => setHistoryAction(event.target.value as (typeof historyActionOptions)[number])}>
              {historyActionOptions.map((option) => <option key={option} value={option}>{option === '全部' ? option : actionLabels[option]}</option>)}
            </select>
          </label>
          <label>
            <span className="search-label">关键词</span>
            <input className="search-input" value={historyQuery} onChange={(event) => setHistoryQuery(event.target.value)} placeholder="临渝 / 张亮 / 不主推" />
          </label>
        </div>

        <div className="published-card-actions history-actions">
          <button className="secondary-action" type="button" onClick={() => void loadContentChangeHistory()} disabled={isHistoryLoading}>应用筛选</button>
          <button className="primary-action" type="button" onClick={() => void submitFilteredDrafts()} disabled={!filteredDraftRequestIds.length}>批量提交筛选草案</button>
          <button className="secondary-action danger-action" type="button" onClick={() => void rejectFilteredDrafts()} disabled={!filteredDraftRequestIds.length}>批量驳回筛选草案</button>
        </div>

        {historyStatusText ? <p className="helper-text">{historyStatusText}</p> : null}
        {batchStatus ? <p className="helper-text">{batchStatus}</p> : null}

        <div className="change-history-list">
          {savedRequests.slice(0, 8).map((request) => (
            <article className={`change-request-card ${request.status}`} key={request.id}>
              <div>
                <span>{actionLabels[request.action]} · {statusLabels[request.status]}</span>
                <strong>{request.targetName}</strong>
                <p>{request.summary}</p>
                <p className="helper-text">{formatDateTime(request.createdAt)}{request.sourceSubmissionId ? ` · 审核单 ${request.sourceSubmissionId}` : ''}</p>
              </div>
              <div className="published-card-actions">
                <span className={`change-status ${request.status}`}>{statusLabels[request.status]}</span>
              </div>
            </article>
          ))}
        </div>
      </div>

      <div className="change-request-list">
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">CHANGE QUEUE</p>
            <h3>本地草案预览</h3>
          </div>
        </div>
        {changeDrafts.length ? changeDrafts.map((draft) => (
          <article className={`change-request-card ${draft.status}`} key={draft.id}>
            <div>
              <span>{actionLabels[draft.action]}</span>
              <strong>{draft.title}</strong>
              <p>{draft.summary}</p>
            </div>
            <div className="published-card-actions">
              <span className={`change-status ${draft.status}`}>{statusLabels[draft.status]}</span>
              {draft.submissionId ? <span className="change-status queued">已进队列</span> : null}
              <button className="primary-action" type="button" onClick={() => void submitDraftToQueue(draft)} disabled={Boolean(draft.submissionId) || draft.status !== 'draft' || submittingDraftId === draft.id}>
                {submittingDraftId === draft.id ? '提交中...' : draft.submissionId ? '已提交' : '提交审核队列'}
              </button>
              <button className="secondary-action danger-action" type="button" onClick={() => setLocalChangeStatus(draft.id, 'rejected')} disabled={draft.status !== 'draft'}>丢弃草案</button>
            </div>
          </article>
        )) : (
          <p className="helper-text">还没有变更草案。左侧可以先搜索已发布餐厅做“不主推/下架/修正”，或填写一个真实新增餐厅草案。</p>
        )}
      </div>
    </GlassCard>
  )
}
