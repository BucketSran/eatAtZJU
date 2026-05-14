import { Link } from 'react-router-dom'

type GuideMission = {
  body: string
  href: string
  label: string
  target: string
  title: string
}

const guideMissions: GuideMission[] = [
  {
    body: '先点首页的随机一餐，让系统按校区和偏好给你一张饭点答案。',
    href: '/?tutorial=1',
    label: '第 1 关',
    target: '首页 · 随机一餐',
    title: '先让浙小食帮你摇'
  },
  {
    body: '再加校区、预算和少量关键词。边界越清楚，选择越不离谱。',
    href: '/?tutorial=1',
    label: '第 2 关',
    target: '首页 · 添加需求',
    title: '给随机加一点条件'
  },
  {
    body: '进入发现页，按场景筛选：正餐、饮品、夜宵、聚餐分开看。',
    href: '/discover',
    label: '第 3 关',
    target: '发现 · 场景筛选',
    title: '缩小候选范围'
  },
  {
    body: '地图只负责看位置、点餐厅和去导航；详细判断放到列表卡片里。',
    href: '/discover',
    label: '第 4 关',
    target: '发现 · 美食地图',
    title: '看附近有哪些点'
  },
  {
    body: '点进餐厅详情，收藏常吃店，也可以直接打开地图软件导航。',
    href: '/restaurants/r001',
    label: '第 5 关',
    target: '详情 · 收藏与导航',
    title: '把答案变成行动'
  },
  {
    body: '榜单会按饭点、校区和特殊场景切换。考试周和夜宵不用混着找。',
    href: '/leaderboards',
    label: '第 6 关',
    target: '榜单 · 切换榜单',
    title: '看看大家都在吃什么'
  },
  {
    body: '发现缺店或信息变了，就提交一张小卡片。餐段可以多选。',
    href: '/contribute',
    label: '第 7 关',
    target: '贡献 · 多选餐段',
    title: '帮下一位同学少纠结'
  }
]

export function GuidePage() {
  return (
    <div className="route-stack guide-route">
      <section className="hero-panel guide-hero mission-hero">
        <div className="guide-persona" aria-hidden="true">
          <span>浙</span>
        </div>
        <p className="eyebrow">ZHEXIAOSHI TRAINING</p>
        <h1>你好，灿若星辰的浙大人</h1>
        <p className="hero-copy">我是浙小食。接下来不是让你读说明书，而是带你打一遍“饭点雷达训练关”。每关只做一件事，饿的时候也能看懂。</p>
        <div className="guide-progress" aria-label="新手任务进度">
          <span style={{ width: `${Math.round((1 / guideMissions.length) * 100)}%` }} />
        </div>
        <div className="hero-actions compact-actions">
          <Link className="primary-action" to="/?tutorial=1">
            开始游戏式引导
          </Link>
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
            <Link className="guide-card-link" to={mission.href}>
              去试试
            </Link>
          </article>
        ))}
      </section>
    </div>
  )
}
