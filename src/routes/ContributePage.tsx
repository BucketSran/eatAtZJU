import { useState, type FormEvent } from 'react'
import { GlassCard } from '../components/GlassCard'
import { submitContribution, type SubmissionType } from '../services/submissionService'
import { isSupabaseBrowserConfigured } from '../services/supabaseBrowserClient'

const typeOptions: Array<{ label: string; value: SubmissionType }> = [
  { label: '新增餐厅', value: 'restaurant' },
  { label: '提交评论', value: 'review' },
  { label: '信息纠错', value: 'correction' }
]

export function ContributePage() {
  const [type, setType] = useState<SubmissionType>('restaurant')
  const [title, setTitle] = useState('')
  const [content, setContent] = useState('')
  const [status, setStatus] = useState('')
  const configured = isSupabaseBrowserConfigured()

  async function submitForm(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    setStatus('正在提交...')

    try {
      const result = await submitContribution(type, { title, content })
      setStatus(`已提交审核：${result.id}`)
      setTitle('')
      setContent('')
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

      <GlassCard>
        <form className="form-stack" onSubmit={submitForm}>
          <label className="search-label" htmlFor="submission-type">提交类型</label>
          <select id="submission-type" className="search-input" value={type} onChange={(event) => setType(event.target.value as SubmissionType)}>
            {typeOptions.map((option) => (
              <option key={option.value} value={option.value}>{option.label}</option>
            ))}
          </select>

          <label className="search-label" htmlFor="submission-title">标题</label>
          <input id="submission-title" className="search-input" value={title} maxLength={80} placeholder="例如：北门新开的砂锅店" onChange={(event) => setTitle(event.target.value)} required />

          <label className="search-label" htmlFor="submission-content">说明</label>
          <textarea id="submission-content" className="text-area" value={content} maxLength={1000} placeholder="写下位置、菜品、人均、适合场景或纠错内容。" onChange={(event) => setContent(event.target.value)} required />

          <button className="primary-action" type="submit">提交到审核队列</button>
          {status ? <p className="helper-text">{status}</p> : null}
        </form>
      </GlassCard>
    </div>
  )
}
