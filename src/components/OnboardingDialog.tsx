import { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom'

const ONBOARDING_KEY = 'eatAtZju:web:onboarding:v1'

function hasSeenOnboarding() {
  if (typeof window === 'undefined') return true
  return window.localStorage.getItem(ONBOARDING_KEY) === '1'
}

function rememberOnboarding() {
  if (typeof window !== 'undefined') window.localStorage.setItem(ONBOARDING_KEY, '1')
}

function getFocusableElements(container: HTMLElement | null) {
  if (!container) return []
  return Array.from(container.querySelectorAll<HTMLElement>('a[href], button:not([disabled])'))
}

export function OnboardingDialog() {
  const [open, setOpen] = useState(() => !hasSeenOnboarding())
  const dialogRef = useRef<HTMLElement | null>(null)
  const primaryActionRef = useRef<HTMLAnchorElement | null>(null)
  const previousFocusRef = useRef<HTMLElement | null>(null)

  useEffect(() => {
    if (!open) return undefined
    previousFocusRef.current = document.activeElement instanceof HTMLElement ? document.activeElement : null
    primaryActionRef.current?.focus()

    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') closeDialog()
      if (event.key !== 'Tab') return

      const focusable = getFocusableElements(dialogRef.current)
      if (!focusable.length) return
      const first = focusable[0]
      const last = focusable[focusable.length - 1]

      if (event.shiftKey && document.activeElement === first) {
        event.preventDefault()
        last.focus()
      } else if (!event.shiftKey && document.activeElement === last) {
        event.preventDefault()
        first.focus()
      }
    }

    window.addEventListener('keydown', onKeyDown)
    return () => window.removeEventListener('keydown', onKeyDown)
    // closeDialog only stores a flag and flips local state; keeping this effect keyed
    // by open avoids re-registering the focus trap on every render.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [open])

  function closeDialog() {
    rememberOnboarding()
    setOpen(false)
    requestAnimationFrame(() => previousFocusRef.current?.focus())
  }

  if (!open) return null

  return (
    <div className="onboarding-backdrop" role="presentation">
      <section className="onboarding-dialog" role="dialog" aria-modal="true" aria-labelledby="onboarding-title" ref={dialogRef}>
        <p className="eyebrow">WELCOME</p>
        <h2 id="onboarding-title">你好，灿若星辰的浙大人。我是浙小食。</h2>
        <p>第一次来可以先走一遍产品导览；已经饿了，也可以直接开始摇一餐、搜餐厅、看榜单。</p>
        <div className="onboarding-welcome-card" aria-hidden="true">
          <span>浙</span>
          <strong>5 步上手</strong>
          <small>校区 · 随机 · 发现 · 榜单 · 贡献</small>
        </div>
        <div className="hero-actions compact-actions">
          <Link className="primary-action" to="/guide" onClick={closeDialog} ref={primaryActionRef}>
            让浙小食带我走一圈
          </Link>
          <button className="secondary-action" type="button" onClick={closeDialog}>
            直接开始
          </button>
        </div>
      </section>
    </div>
  )
}
