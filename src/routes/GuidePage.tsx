import { Link } from 'react-router-dom'

type GuideStep = {
  accent: string
  body: string
  cta: string
  href: string
  label: string
  title: string
}

const guideSteps: GuideStep[] = [
  {
    accent: 'campus',
    body: '先告诉浙小食你今天在哪个校区，首页随机和榜单都会少走冤枉路。',
    cta: '去设置校区',
    href: '/profile',
    label: '01',
    title: '选择校区'
  },
  {
    accent: 'random',
    body: '纠结时直接摇一餐，也可以加上预算、正餐/饮品、堂食/外卖这些边界。',
    cta: '回首页开摇',
    href: '/',
    label: '02',
    title: '随机一餐'
  },
  {
    accent: 'discover',
    body: '想自己掌控，就用发现页搜索、筛标签、看地图，把候选范围压到几家。',
    cta: '去发现',
    href: '/discover',
    label: '03',
    title: '发现 / 搜索 / 地图'
  },
  {
    accent: 'leaderboard',
    body: '榜单会结合校区、饭点和偏好，把适合现在吃的选择排在前面。',
    cta: '看榜单',
    href: '/leaderboards',
    label: '04',
    title: '校园美食榜'
  },
  {
    accent: 'contribute',
    body: '看到信息不准、缺少餐厅或有新发现，就提交线索，等审核后进入公共数据。',
    cta: '去贡献',
    href: '/contribute',
    label: '05',
    title: '一起补全'
  }
]

function GuideIllustration({ accent, label }: { accent: string; label: string }) {
  return (
    <div className={`guide-illustration ${accent}`} aria-hidden="true">
      <span className="guide-plate" />
      <span className="guide-dot one" />
      <span className="guide-dot two" />
      <span className="guide-line" />
      <strong>{label}</strong>
    </div>
  )
}

export function GuidePage() {
  return (
    <div className="route-stack guide-route">
      <section className="hero-panel guide-hero">
        <div className="guide-persona" aria-hidden="true">
          <span>浙</span>
        </div>
        <p className="eyebrow">PRODUCT GUIDE</p>
        <h1>第一次来？让浙小食带你走一圈</h1>
        <p className="hero-copy">我是浙小食。这里不用先研究复杂功能，按下面五步走，你就能从“今天吃什么”一路走到发现、榜单和贡献。</p>
        <div className="hero-actions compact-actions">
          <Link className="primary-action" to="/">
            直接开始
          </Link>
          <Link className="secondary-action" to="/discover">
            先逛发现页
          </Link>
        </div>
      </section>

      <section className="guide-step-grid" aria-label="食在浙大产品导览">
        {guideSteps.map((step) => (
          <article key={step.title} className="guide-step-card">
            <GuideIllustration accent={step.accent} label={step.label} />
            <div>
              <span>{step.label}</span>
              <h2>{step.title}</h2>
              <p>{step.body}</p>
            </div>
            <Link className="guide-card-link" to={step.href}>
              {step.cta}
            </Link>
          </article>
        ))}
      </section>
    </div>
  )
}
