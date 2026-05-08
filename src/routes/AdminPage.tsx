import { useState } from 'react'
import { GlassCard } from '../components/GlassCard'
import { listPendingSubmissions, reviewSubmission, type AdminSubmission } from '../services/adminSubmissionService'
import { isSupabaseBrowserConfigured } from '../services/supabaseBrowserClient'

function stringifyPayload(payload: Record<string, unknown>) {
  const title = typeof payload.title === 'string' ? payload.title : '未命名提交'
  const content = typeof payload.content === 'string' ? payload.content : JSON.stringify(payload)
  return { title, content }
}

export function AdminPage() {
  const [items, setItems] = useState<AdminSubmission[]>([])
  const [status, setStatus] = useState('')
  const [isLoading, setIsLoading] = useState(false)
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
      await reviewSubmission(id, action)
      setItems((current) => current.filter((item) => item.id !== id))
      setStatus(action === 'approve' ? '已通过并记录审计日志。' : '已拒绝并记录审计日志。')
    } catch (error) {
      setStatus(error instanceof Error ? error.message : '审核失败')
    }
  }

  return (
    <div className="route-stack">
      <div className="page-heading split-heading">
        <div>
          <p className="eyebrow">ADMIN</p>
          <h1>审核后台</h1>
          <p>这里先放审核后台骨架；真实管理员登录后会读取 pending submissions。</p>
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
        <h2>上线前需要真实管理员账号</h2>
        <p>需要在 `admin_users` 表中添加管理员用户 ID，后台页面再接入真实列表和审核操作。</p>
      </GlassCard>
    </div>
  )
}
