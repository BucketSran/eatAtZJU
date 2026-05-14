import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'

const TUTORIAL_KEY = 'eatAtZju:web:tutorial:v3'

type GuideMission = {
  body: string
  label: string
  target: string
  title: string
}

const guideMissions: GuideMission[] = [
  {
    body: '点一下随机一餐，先拿到一个真实候选，再决定要不要加条件。',
    label: '第 1 关',
    target: '首页 · 随机一餐',
    title: '先摇出一个答案'
  },
  {
    body: '打开添加需求，学会用校区、预算和少量关键词把随机范围缩小。',
    label: '第 2 关',
    target: '首页 · 添加需求',
    title: '给随机加边界'
  },
  {
    body: '进入发现页，先选吃饭场景，再看列表和地图。',
    label: '第 3 关',
    target: '发现 · 场景筛选',
    title: '别从标签墙开始'
  },
  {
    body: '点地图点位，看位置、卡片和导航之间怎么配合。',
    label: '第 4 关',
    target: '发现 · 美食地图',
    title: '把餐厅放回地图里'
  },
  {
    body: '打开详情页，试着理解收藏和导航分别解决什么问题。',
    label: '第 5 关',
    target: '详情 · 收藏与导航',
    title: '把推荐变成行动'
  },
  {
    body: '切换不同榜单，知道什么时候看早餐、正餐、夜宵和特殊场景。',
    label: '第 6 关',
    target: '榜单 · 切换榜单',
    title: '用榜单做比较'
  },
  {
    body: '提交一条线索，理解餐段多选和审核队列。',
    label: '第 7 关',
    target: '贡献 · 多选餐段',
    title: '帮下一位同学少纠结'
  }
]

export function GuidePage() {
  const navigate = useNavigate()
  const [hasFinished, setHasFinished] = useState(false)

  useEffect(() => {
    setHasFinished(window.localStorage.getItem(TUTORIAL_KEY) === '1')
  }, [])

  function restartTutorial() {
    window.localStorage.removeItem(TUTORIAL_KEY)
    window.localStorage.removeItem('eatAtZju:web:tutorial:v2')
    navigate('/?tutorial=1')
  }

  return (
    <div className="route-stack guide-route">
      <section className="hero-panel guide-hero mission-hero">
        <div className="guide-persona" aria-hidden="true">
          <span>浙</span>
        </div>
        <p className="eyebrow">ZHEXIAOSHI TRAINING</p>
        <h1>你好，灿若星辰的浙大人</h1>
        <p className="hero-copy">我是浙小食。这里不是说明书，是饭点雷达第一关。你会一边点、一边看到功能反馈，学完就知道该怎么找饭。</p>
        <div className="guide-training-status" aria-live="polite">
          <strong>{hasFinished ? '你已经通关过一次' : '训练还没开始'}</strong>
          <span>{hasFinished ? '想复习也可以重开，浙小食不会笑你。' : '每关只做一件事，先从随机一餐开始。'}</span>
        </div>
        <div className="guide-progress" aria-label="新手任务进度">
          <span style={{ width: hasFinished ? '100%' : `${Math.round((1 / guideMissions.length) * 100)}%` }} />
        </div>
        <div className="hero-actions compact-actions guide-training-actions">
          <Link className="primary-action" to="/?tutorial=1">
            {hasFinished ? '再走一遍训练' : '开始新手训练'}
          </Link>
          <button className="secondary-action" type="button" onClick={restartTutorial}>
            重新训练
          </button>
          <Link className="secondary-action" to="/">
            我先自己逛逛
          </Link>
        </div>
      </section>

      <section className="guide-mission-list" aria-label="浙小食新手任务">
        {guideMissions.map((mission, index) => (
          <article key={mission.label} className="guide-mission-card">
            <div className="mission-index" aria-hidden="true">{index + 1}</div>
            <div className="mission-copy">
              <span>{mission.label} · {mission.target}</span>
              <h2>{mission.title}</h2>
              <p>{mission.body}</p>
            </div>
            <Link className="guide-card-link" to={`/?tutorial=1&step=${index + 1}`}>
              去练这关
            </Link>
          </article>
        ))}
      </section>
    </div>
  )
}
