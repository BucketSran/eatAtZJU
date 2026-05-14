import { useEffect, useMemo, useState, type CSSProperties } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import { TUTORIAL_REQUIREMENT_DEMO_DURATION_MS, TUTORIAL_REQUIREMENT_DEMO_EVENT } from '../constants/tutorialDemo'

const TUTORIAL_KEY = 'eatAtZju:web:tutorial:v3'

type TutorialPhase = 'action' | 'success'

type TutorialStep = {
  actionLabel: string
  before: string
  demoDurationMs?: number
  demoEvent?: string
  demoPoints: string[]
  demoSelector?: string
  fallback: string
  path: string
  preventNativeClick?: boolean
  success: string
  successTitle: string
  targetId: string
  title: string
}

const tutorialSteps: TutorialStep[] = [
  {
    actionLabel: '点首页的「随机一餐」按钮',
    before: '先让浙小食给你一个答案。饿的时候不用先研究筛选，点一下就能看到结果落在哪张卡片里。',
    demoPoints: ['按钮会进入「正在摇…」状态', '结果会出现在 RANDOM PICK 卡片', '不满意可以直接再摇一次'],
    fallback: '如果按钮还没出现，页面可能还在加载；你也可以先点「先看演示」。',
    path: '/',
    success: '你刚刚完成了最短路径：不用填表，先得到一个能吃的候选。后面加需求，只是为了让这个答案更像你。',
    successTitle: '摇一餐不是玄学，是先给答案',
    targetId: 'home-random-pick',
    title: '第一关：先摇一餐'
  },
  {
    actionLabel: '点「添加需求」打开底部筛选',
    before: '随机不是乱抽。先加校区、预算和几个关键偏好，系统就会把离谱选项挡在外面。',
    demoDurationMs: TUTORIAL_REQUIREMENT_DEMO_DURATION_MS,
    demoEvent: TUTORIAL_REQUIREMENT_DEMO_EVENT,
    demoPoints: ['演示会自动套用玉泉 · 正餐', '不辣和非食堂会依次点亮', '这次演示只影响当前页面，不会偷偷保存偏好'],
    fallback: '如果底部筛选没有弹出，可以先点「先看演示」，下一关仍然会继续。',
    path: '/',
    success: '看到底部筛选了吗？你刚刚把随机范围缩小了。之后再点随机一餐，候选会优先按这组需求来。',
    successTitle: '随机开始听你的话了',
    targetId: 'home-add-requirement',
    title: '第二关：给随机加边界'
  },
  {
    actionLabel: '点一个发现页场景卡片',
    before: '发现页不应该让你面对一墙标签。先选场景，例如快速正餐、饮品甜点或夜宵，再做少量微调。',
    demoPoints: ['场景负责粗筛', '关键条件负责兜底', '隐藏标签只参与推荐分'],
    demoSelector: '.scene-card:not(.active), .scene-chip:not(.active), .scene-card, .scene-chip',
    fallback: '如果场景还没渲染出来，先看演示即可；列表和地图加载完成后会自动同步。',
    path: '/discover',
    success: '这一步的价值是「先说你现在想干嘛」。系统会把复杂标签藏到背后，只把必要选择留给你。',
    successTitle: '筛选从场景开始，不从标签墙开始',
    targetId: 'discover-filter',
    title: '第三关：按场景缩小范围'
  },
  {
    actionLabel: '点地图区域或一个餐厅点位',
    before: '地图只做三件事：看位置、点餐厅、去导航。具体好不好吃，交给底部卡片和列表判断。',
    demoPoints: ['点位用短名和颜色表达信息', '点开后会出现餐厅卡片', '卡片可以关闭，不会一直挡地图'],
    fallback: '如果当前筛选没有地图点位，教程会先说明逻辑；你可以放宽条件再看地图。',
    path: '/discover',
    success: '你已经理解地图的角色了：它不是榜单，也不是详情页，而是帮你判断「这家离我有多远」。',
    successTitle: '地图负责位置感',
    targetId: 'discover-map',
    title: '第四关：看附近有什么'
  },
  {
    actionLabel: '点详情页的导航区域',
    before: '餐厅详情页负责把推荐变成行动：收藏常吃店，或者打开地图软件开始走。',
    demoPoints: ['收藏会进入你的常用列表', '导航可以选择地图软件', '教程里不会强迫你真的跳出页面'],
    fallback: '如果这家店还在加载，先等标题出现；教程会区分加载中和确认不存在。',
    path: '/restaurants/r001',
    preventNativeClick: true,
    success: '这里就是从「看起来不错」到「现在出发」的最后一步。以后真实导航可以接高德、百度或系统地图。',
    successTitle: '推荐要能落地到路线',
    targetId: 'restaurant-navigate',
    title: '第五关：收藏和导航'
  },
  {
    actionLabel: '点顶部的一个榜单标签',
    before: '榜单适合有目标地找：早餐、正餐、夜宵、考试周、氛围感，不应该全挤在同一张榜里。',
    demoPoints: ['标签切换不同榜单逻辑', '校区会影响排序', '随机解决纠结，榜单解决比较'],
    demoSelector: '.leaderboard-tab:not(.active), button',
    fallback: '如果榜单还没加载，先看演示；数据回来后标签会继续可用。',
    path: '/leaderboards',
    success: '你刚刚切换的是「找法」，不是简单换标题。榜单让你按场景比较，而随机帮你快速拍板。',
    successTitle: '榜单是有目标的找饭工具',
    targetId: 'leaderboard-tabs',
    title: '第六关：切换校园榜单'
  },
  {
    actionLabel: '点贡献页的餐段多选区域',
    before: '如果你知道一家好店，就提交线索。餐段可以多选，因为一家店可能同时适合中餐、晚餐和夜宵。',
    demoPoints: ['提交不会直接公开', '餐段多选能让推荐更准确', '管理员审核后才进入公共列表'],
    fallback: '如果贡献表单还没滚到餐段区域，教程会帮你定位；看不到时可以先看演示。',
    path: '/contribute',
    success: '这就是社区数据增长的入口。你贡献的是线索，系统负责结构化，管理员负责把关。',
    successTitle: '真实线索从这里进审核队列',
    targetId: 'contribute-meal-periods',
    title: '第七关：补充真实线索'
  }
]

function rememberTutorialDone() {
  if (typeof window !== 'undefined') window.localStorage.setItem(TUTORIAL_KEY, '1')
}

function clearPreviousTutorialKeys() {
  if (typeof window === 'undefined') return
  window.localStorage.removeItem('eatAtZju:web:tutorial:v2')
}

function getTargetElement(targetId: string) {
  if (typeof document === 'undefined') return null
  return document.querySelector<HTMLElement>(`[data-tour-id="${targetId}"]`)
}

function getDemoElement(step: TutorialStep) {
  const target = getTargetElement(step.targetId)
  if (!target) return null
  if (step.demoSelector) return target.querySelector<HTMLElement>(step.demoSelector) ?? target
  if (target.matches('button, a, [role="button"], input, textarea, select')) return target
  return target.querySelector<HTMLElement>('button:not([disabled]), a[href], [role="button"], input:not([disabled]), textarea, select') ?? target
}

export function TutorialOverlay() {
  const location = useLocation()
  const navigate = useNavigate()
  const [open, setOpen] = useState(false)
  const [phase, setPhase] = useState<TutorialPhase>('action')
  const [stepIndex, setStepIndex] = useState(0)
  const [targetRect, setTargetRect] = useState<DOMRect | null>(null)
  const [isDemoPlaying, setIsDemoPlaying] = useState(false)
  const currentStep = tutorialSteps[stepIndex]
  const progressLabel = `${stepIndex + 1} / ${tutorialSteps.length}`
  const isSuccess = phase === 'success'

  useEffect(() => {
    const params = new URLSearchParams(location.search)
    const shouldStart = params.get('tutorial') === '1'
    if (!shouldStart) return
    clearPreviousTutorialKeys()
    const requestedStep = Number(params.get('step'))
    const nextIndex = Number.isFinite(requestedStep) ? Math.min(Math.max(requestedStep - 1, 0), tutorialSteps.length - 1) : 0
    setStepIndex(nextIndex)
    setPhase('action')
    setOpen(true)
    navigate(tutorialSteps[nextIndex]?.path || '/', { replace: true })
  }, [location.search, navigate])

  useEffect(() => {
    if (!open || !currentStep) return undefined
    if (location.pathname !== currentStep.path) navigate(currentStep.path)
    return undefined
  }, [currentStep, location.pathname, navigate, open])

  useEffect(() => {
    if (!open) return
    setPhase('action')
    setIsDemoPlaying(false)
  }, [stepIndex, open])

  useEffect(() => {
    if (!open || !currentStep) return undefined

    let frame = 0
    let timer = 0
    let retryTimer = 0
    const startedAt = Date.now()
    const updateTarget = () => {
      const target = getTargetElement(currentStep.targetId)
      if (!target) {
        setTargetRect(null)
        if (Date.now() - startedAt < 6500) {
          retryTimer = window.setTimeout(updateTarget, 220)
        }
        return
      }
      target.scrollIntoView({ block: 'center', inline: 'nearest', behavior: 'smooth' })
      window.setTimeout(() => setTargetRect(target.getBoundingClientRect()), 120)
    }

    frame = window.requestAnimationFrame(updateTarget)
    timer = window.setTimeout(updateTarget, 420)
    window.addEventListener('resize', updateTarget)
    window.addEventListener('scroll', updateTarget, true)
    return () => {
      window.cancelAnimationFrame(frame)
      window.clearTimeout(timer)
      window.clearTimeout(retryTimer)
      window.removeEventListener('resize', updateTarget)
      window.removeEventListener('scroll', updateTarget, true)
    }
  }, [currentStep, location.pathname, open, phase])

  useEffect(() => {
    if (!open || !currentStep || phase !== 'action') return undefined

    const completeCurrentAction = (event?: MouseEvent | KeyboardEvent) => {
      const target = getTargetElement(currentStep.targetId)
      if (!target || !event?.target || !(event.target instanceof Node) || !target.contains(event.target)) return
      if (currentStep.preventNativeClick) {
        event.preventDefault()
        event.stopPropagation()
      }
      window.setTimeout(() => setPhase('success'), 260)
    }

    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key !== 'Enter' && event.key !== ' ') return
      completeCurrentAction(event)
    }

    window.addEventListener('click', completeCurrentAction, true)
    window.addEventListener('keydown', onKeyDown, true)
    return () => {
      window.removeEventListener('click', completeCurrentAction, true)
      window.removeEventListener('keydown', onKeyDown, true)
    }
  }, [currentStep, open, phase])

  function closeTutorial(done: boolean) {
    if (done) rememberTutorialDone()
    setOpen(false)
    setTargetRect(null)
    setPhase('action')
  }

  function goNext() {
    if (stepIndex >= tutorialSteps.length - 1) {
      closeTutorial(true)
      return
    }
    setStepIndex((index) => Math.min(index + 1, tutorialSteps.length - 1))
  }

  function playDemo() {
    if (!currentStep || isDemoPlaying) return
    setIsDemoPlaying(true)

    if (currentStep.demoEvent) {
      window.dispatchEvent(new CustomEvent(currentStep.demoEvent))
      const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches
      window.setTimeout(() => {
        setIsDemoPlaying(false)
        setPhase('success')
      }, reduceMotion ? 900 : currentStep.demoDurationMs ?? 1800)
      return
    }

    const deadline = Date.now() + 2800

    const attemptDemo = () => {
      const demoElement = getDemoElement(currentStep)
      if (!demoElement && Date.now() < deadline) {
        window.setTimeout(attemptDemo, 160)
        return
      }

      if (!demoElement || currentStep.preventNativeClick) {
        setIsDemoPlaying(false)
        setPhase('success')
        return
      }

      demoElement.scrollIntoView({ block: 'center', inline: 'nearest', behavior: 'smooth' })
      window.setTimeout(() => {
        demoElement.click()
        window.setTimeout(() => {
          setIsDemoPlaying(false)
          setPhase('success')
        }, 360)
      }, 120)
    }

    attemptDemo()
  }

  const spotlightStyle = useMemo<CSSProperties>(() => {
    if (!targetRect) return { opacity: 0 }
    return {
      height: targetRect.height + 18,
      left: targetRect.left - 9,
      opacity: isSuccess ? 0.82 : 1,
      top: targetRect.top - 9,
      width: targetRect.width + 18
    }
  }, [isSuccess, targetRect])

  const fingerStyle = useMemo<CSSProperties>(() => {
    if (!targetRect || isSuccess || typeof window === 'undefined') return { opacity: 0 }
    return {
      left: Math.min(window.innerWidth - 54, targetRect.left + targetRect.width * 0.62),
      top: Math.min(window.innerHeight - 80, targetRect.top + targetRect.height * 0.55)
    }
  }, [isSuccess, targetRect])

  const popoverStyle = useMemo<CSSProperties>(() => {
    if (typeof window === 'undefined' || !targetRect || window.innerWidth < 760) return {}
    const useRightSide = targetRect.left < window.innerWidth / 2
    const top = Math.min(window.innerHeight - 300, Math.max(28, targetRect.top))
    return {
      left: useRightSide ? Math.min(window.innerWidth - 400, targetRect.right + 24) : Math.max(24, targetRect.left - 400),
      top
    }
  }, [targetRect])

  if (!open || !currentStep) return null

  return (
    <div className={`tutorial-layer tutorial-state--${phase}`} aria-live="polite">
      <div className="tutorial-scrim" aria-hidden="true" />
      <div className="tutorial-spotlight" style={spotlightStyle} aria-hidden="true" />
      <div className="tutorial-finger" style={fingerStyle} aria-hidden="true">☝</div>
      <section className="tutorial-popover" style={popoverStyle} role="dialog" aria-label="浙小食新手引导">
        <div className="tutorial-popover-head">
          <span>浙小食 · {progressLabel} · {isSuccess ? '已完成' : '待操作'}</span>
          <button type="button" onClick={() => closeTutorial(true)}>跳过</button>
        </div>
        <div className="tutorial-guide-bubble">
          <strong>浙</strong>
          <p>{isSuccess ? currentStep.success : currentStep.before}</p>
        </div>
        <h2>{isSuccess ? currentStep.successTitle : currentStep.title}</h2>
        {!targetRect && !isSuccess ? <p className="tutorial-fallback-note">{currentStep.fallback}</p> : null}
        {isSuccess ? (
          <ul className="tutorial-demo-list" aria-label="刚刚展示的功能点">
            {currentStep.demoPoints.map((point) => <li key={point}>{point}</li>)}
          </ul>
        ) : (
          <p className="tutorial-action-hint">现在操作：{currentStep.actionLabel}</p>
        )}
        <div className="tutorial-progress" aria-hidden="true">
          <span style={{ width: `${((stepIndex + (isSuccess ? 1 : 0.55)) / tutorialSteps.length) * 100}%` }} />
        </div>
        <div className="tutorial-actions">
          <button className="secondary-action" type="button" onClick={() => closeTutorial(true)}>
            先不练了
          </button>
          {isSuccess ? (
            <button className="primary-action" type="button" onClick={goNext}>
              {stepIndex === tutorialSteps.length - 1 ? '完成训练' : '下一关'}
            </button>
          ) : (
            <button className="primary-action" type="button" onClick={playDemo} disabled={isDemoPlaying}>
              {isDemoPlaying ? '演示中…' : '先看演示'}
            </button>
          )}
        </div>
      </section>
    </div>
  )
}
