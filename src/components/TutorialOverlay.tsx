import { useEffect, useMemo, useState, type CSSProperties } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'

const TUTORIAL_KEY = 'eatAtZju:web:tutorial:v2'

type TutorialStep = {
  body: string
  path: string
  targetId: string
  title: string
}

const tutorialSteps: TutorialStep[] = [
  {
    body: '现在点“随机一餐”。这一步会让浙小食先给你一个能吃的答案，适合真的饿了。',
    path: '/',
    targetId: 'home-random-pick',
    title: '第一关：先摇一餐'
  },
  {
    body: '点“添加需求”，学会把校区、预算和少量关键词加进去，随机就不会乱飞。',
    path: '/',
    targetId: 'home-add-requirement',
    title: '第二关：给随机加边界'
  },
  {
    body: '来到发现页后，先用这里选场景。场景会帮你隐藏不必要的复杂标签。',
    path: '/discover',
    targetId: 'discover-filter',
    title: '第三关：按场景缩小范围'
  },
  {
    body: '地图用来看位置和点餐厅，列表用来判断值不值得去。先点一个你感兴趣的点。',
    path: '/discover',
    targetId: 'discover-map',
    title: '第四关：看附近有什么'
  },
  {
    body: '详情页里可以收藏，也能直接打开地图软件导航。吃饭这件事要能落地。',
    path: '/restaurants/r001',
    targetId: 'restaurant-navigate',
    title: '第五关：收藏和导航'
  },
  {
    body: '榜单不是一张死榜。点这里切换早餐、午晚餐、夜宵和特殊场景。',
    path: '/leaderboards',
    targetId: 'leaderboard-tabs',
    title: '第六关：切换校园榜单'
  },
  {
    body: '如果你知道一家好店，就从这里提交。餐段可以多选，比如中餐、晚餐、夜宵。',
    path: '/contribute',
    targetId: 'contribute-meal-periods',
    title: '第七关：补充真实线索'
  }
]

function hasCompletedTutorial() {
  if (typeof window === 'undefined') return true
  return window.localStorage.getItem(TUTORIAL_KEY) === '1'
}

function rememberTutorialDone() {
  if (typeof window !== 'undefined') window.localStorage.setItem(TUTORIAL_KEY, '1')
}

function getTargetElement(targetId: string) {
  if (typeof document === 'undefined') return null
  return document.querySelector<HTMLElement>(`[data-tour-id="${targetId}"]`)
}

export function TutorialOverlay() {
  const location = useLocation()
  const navigate = useNavigate()
  const [open, setOpen] = useState(false)
  const [stepIndex, setStepIndex] = useState(0)
  const [targetRect, setTargetRect] = useState<DOMRect | null>(null)
  const currentStep = tutorialSteps[stepIndex]
  const progressLabel = `${stepIndex + 1} / ${tutorialSteps.length}`

  useEffect(() => {
    const shouldStart = new URLSearchParams(location.search).get('tutorial') === '1'
    if (!shouldStart) return
    setStepIndex(0)
    setOpen(true)
    navigate('/', { replace: true })
  }, [location.search, navigate])

  useEffect(() => {
    if (!open || !currentStep) return undefined
    if (location.pathname !== currentStep.path) {
      navigate(currentStep.path)
    }
    return undefined
  }, [currentStep, location.pathname, navigate, open])

  useEffect(() => {
    if (open || hasCompletedTutorial()) return undefined
    return undefined
  }, [open])

  useEffect(() => {
    if (!open || !currentStep) return undefined

    let frame = 0
    let timer = 0
    const updateTarget = () => {
      const target = getTargetElement(currentStep.targetId)
      if (!target) {
        setTargetRect(null)
        return
      }
      target.scrollIntoView({ block: 'center', inline: 'nearest', behavior: 'smooth' })
      window.setTimeout(() => setTargetRect(target.getBoundingClientRect()), 120)
    }

    frame = window.requestAnimationFrame(updateTarget)
    timer = window.setTimeout(updateTarget, 360)
    window.addEventListener('resize', updateTarget)
    window.addEventListener('scroll', updateTarget, true)
    return () => {
      window.cancelAnimationFrame(frame)
      window.clearTimeout(timer)
      window.removeEventListener('resize', updateTarget)
      window.removeEventListener('scroll', updateTarget, true)
    }
  }, [currentStep, location.pathname, open])

  useEffect(() => {
    if (!open || !currentStep) return undefined
    const onClick = (event: MouseEvent) => {
      const target = getTargetElement(currentStep.targetId)
      if (!target || !(event.target instanceof Node) || !target.contains(event.target)) return
      window.setTimeout(() => goNext(), 260)
    }

    window.addEventListener('click', onClick, true)
    return () => window.removeEventListener('click', onClick, true)
    // goNext intentionally reads the current step index; this listener is reset
    // whenever the step changes.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentStep, open])

  function closeTutorial(done: boolean) {
    if (done) rememberTutorialDone()
    setOpen(false)
    setTargetRect(null)
  }

  function goNext() {
    if (stepIndex >= tutorialSteps.length - 1) {
      closeTutorial(true)
      return
    }
    setStepIndex((index) => Math.min(index + 1, tutorialSteps.length - 1))
  }

  const spotlightStyle = useMemo<CSSProperties>(() => {
    if (!targetRect) return { opacity: 0 }
    return {
      height: targetRect.height + 18,
      left: targetRect.left - 9,
      top: targetRect.top - 9,
      width: targetRect.width + 18
    }
  }, [targetRect])

  const fingerStyle = useMemo<CSSProperties>(() => {
    if (!targetRect) return { opacity: 0 }
    return {
      left: Math.min(window.innerWidth - 54, targetRect.left + targetRect.width * 0.62),
      top: Math.min(window.innerHeight - 80, targetRect.top + targetRect.height * 0.55)
    }
  }, [targetRect])

  const popoverStyle = useMemo<CSSProperties>(() => {
    if (typeof window === 'undefined' || !targetRect || window.innerWidth < 760) return {}
    const useRightSide = targetRect.left < window.innerWidth / 2
    const top = Math.min(window.innerHeight - 260, Math.max(28, targetRect.top))
    return {
      left: useRightSide ? Math.min(window.innerWidth - 380, targetRect.right + 24) : Math.max(24, targetRect.left - 380),
      top
    }
  }, [targetRect])

  if (!open || !currentStep) return null

  return (
    <div className="tutorial-layer" aria-live="polite">
      <div className="tutorial-scrim" aria-hidden="true" />
      <div className="tutorial-spotlight" style={spotlightStyle} aria-hidden="true" />
      <div className="tutorial-finger" style={fingerStyle} aria-hidden="true">☝</div>
      <section className="tutorial-popover" style={popoverStyle} role="dialog" aria-label="浙小食新手引导">
        <div className="tutorial-popover-head">
          <span>浙小食 · {progressLabel}</span>
          <button type="button" onClick={() => closeTutorial(true)}>跳过</button>
        </div>
        <div className="tutorial-guide-bubble">
          <strong>浙</strong>
          <p>{currentStep.body}</p>
        </div>
        <h2>{currentStep.title}</h2>
        <div className="tutorial-progress" aria-hidden="true">
          <span style={{ width: `${((stepIndex + 1) / tutorialSteps.length) * 100}%` }} />
        </div>
        <div className="tutorial-actions">
          <button className="secondary-action" type="button" onClick={() => closeTutorial(true)}>
            先不练了
          </button>
          <button className="primary-action" type="button" onClick={goNext}>
            {stepIndex === tutorialSteps.length - 1 ? '完成训练' : '下一步'}
          </button>
        </div>
      </section>
    </div>
  )
}
