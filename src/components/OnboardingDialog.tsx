import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'

const ONBOARDING_KEY = 'eatAtZju:web:onboarding:v1'
const githubIssuesUrl = 'https://github.com/BucketSran/eatAtZJU/issues'

function hasSeenOnboarding() {
  if (typeof window === 'undefined') return true
  return window.localStorage.getItem(ONBOARDING_KEY) === '1'
}

function rememberOnboarding() {
  if (typeof window !== 'undefined') window.localStorage.setItem(ONBOARDING_KEY, '1')
}

export function OnboardingDialog() {
  const [open, setOpen] = useState(() => !hasSeenOnboarding())

  useEffect(() => {
    if (!open) return undefined
    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') closeDialog()
    }
    window.addEventListener('keydown', onKeyDown)
    return () => window.removeEventListener('keydown', onKeyDown)
  }, [open])

  function closeDialog() {
    rememberOnboarding()
    setOpen(false)
  }

  if (!open) return null

  return (
    <div className="onboarding-backdrop" role="presentation">
      <section className="onboarding-dialog" role="dialog" aria-modal="true" aria-labelledby="onboarding-title">
        <p className="eyebrow">WELCOME</p>
        <h2 id="onboarding-title">你好，灿若星辰的浙大人。</h2>
        <p>欢迎来到「食在浙大」。这里不是冷冰冰的榜单机器，而是一只努力帮你少纠结三分钟的饭点小雷达。</p>
        <div className="onboarding-steps">
          <span><strong>1</strong> 先选默认校区，首页和随机一餐就不会把你从紫金港摇到玉泉。</span>
          <span><strong>2</strong> 去“发现”里按正餐/饮品、预算、辣不辣和场景筛选。</span>
          <span><strong>3</strong> 如果餐厅信息不准，来 GitHub 提 Issue，我们会把饭点雷达越校越准。</span>
        </div>
        <div className="hero-actions compact-actions">
          <button className="primary-action" type="button" onClick={closeDialog}>
            知道了，开饭！
          </button>
          <Link className="secondary-action" to="/profile" onClick={closeDialog}>
            先去设置校区
          </Link>
          <a className="text-link" href={githubIssuesUrl} target="_blank" rel="noreferrer">
            去 GitHub 提 Issue
          </a>
        </div>
      </section>
    </div>
  )
}
