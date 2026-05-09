import { useState } from 'react'
import { GlassCard } from '../components/GlassCard'
import { listAuditLogs, rollbackAuditLog, type AdminAuditLog } from '../services/adminAuditService'
import { listPendingSubmissions, reviewSubmission, type AdminSubmission } from '../services/adminSubmissionService'
import { isSupabaseBrowserConfigured } from '../services/supabaseBrowserClient'

function stringifyPayload(payload: Record<string, unknown>) {
  const title = typeof payload.title === 'string' ? payload.title : '未命名提交'
  const content = typeof payload.content === 'string' ? payload.content : JSON.stringify(payload)
  const tags = Array.isArray(payload.tags) ? payload.tags.filter((tag) => typeof tag === 'string').join(' / ') : ''
  const meta = [payload.serviceMode || payload.diningMode, payload.mealPeriod, tags].filter((item) => typeof item === 'string' && item).join(' · ')
  return { title, content, meta }
}

export function AdminPage() {
  const [items, setItems] = useState<AdminSubmission[]>([])
  const [auditLogs, setAuditLogs] = useState<AdminAuditLog[]>([])
  const [status, setStatus] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [isAuditLoading, setIsAuditLoading] = useState(false)
  const configured = isSupabaseBrowserConfigured()

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

  async function handleReview(id: string, action: 'approve' | 'reject') {
    setStatus(action === 'approve' ? '正在通过提交...' : '正在拒绝提交...')
    try {
      const result = await reviewSubmission(id, action)
      setItems((current) => current.filter((item) => item.id !== id))
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

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">ADMIN</p>
          <h1>审核后台</h1>
          <p>管理员可以读取 pending submissions，执行通过/拒绝，并留下审计日志。</p>
        </div>
        <span className="count-badge">受限访问</span>
      </div>

      <GlassCard>
        <p className="eyebrow">WORKFLOW</p>
        <h2>审核流已具备 API 骨架</h2>
        <p>服务端已新增管理员 submissions API：管理员可以读取 pending submissions，执行 approve/reject，并写入 audit logs。</p>
        <div className="note-grid">
          <span>GET /api/admin/submissions</span>
          <span>POST approve/reject</span>
          <span>写入 audit_logs</span>
        </div>
      </GlassCard>

      <GlassCard>
        <div className="section-heading card-heading">
          <div>
            <p className="eyebrow">QUEUE</p>
            <h2>待审核提交</h2>
            <p>{configured ? '使用当前登录账号访问管理员 API。账号必须存在于 admin_users 表。' : '当前缺少 VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY，不能读取线上审核队列。'}</p>
          </div>
          <button className="secondary-action" type="button" onClick={loadSubmissions} disabled={!configured || isLoading}>
            {isLoading ? '读取中...' : '读取队列'}
          </button>
        </div>

        {status ? <p className="helper-text">{status}</p> : null}

        <div className="submission-list">
          {items.map((item) => {
            const payload = stringifyPayload(item.payload)
            return (
              <article key={item.id} className="submission-card">
                <div>
                  <span>{item.type}</span>
                  <strong>{payload.title}</strong>
                  {payload.meta ? <p>{payload.meta}</p> : null}
                  <p>{payload.content}</p>
                </div>
                <div className="hero-actions compact-actions">
                  <button className="secondary-action" type="button" onClick={() => handleReview(item.id, 'reject')}>拒绝</button>
                  <button className="primary-action" type="button" onClick={() => handleReview(item.id, 'approve')}>通过</button>
                </div>
              </article>
            )
          })}
        </div>
      </GlassCard>

      <GlassCard className="demo-note">
        <p className="eyebrow">NEXT</p>
        <h2>下一步：提交一条测试资料</h2>
        <p>如果读取队列后没有出现 `Admin access required`，说明当前账号已经具备管理员权限。当前为空只是还没有 pending submission，请先到贡献页提交一条测试内容。</p>
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
