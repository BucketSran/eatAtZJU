# 食在浙大技术路线

## MVP 边界

这版优先验证“学生是否愿意用它决定吃什么”。因此先不做登录、真实发布、审核台和复杂社交，而是把发现、筛选、详情、收藏、推荐这些高频路径跑顺。

## 推荐的下一阶段架构

主线采用 React + Vercel + Supabase，保留当前微信小程序作为原型参考：

- 前端：React + TypeScript + Vite，优先做 Web/PWA MVP。
- 后端：Vercel Serverless Functions，放置输入校验、敏感密钥、推荐逻辑、审核工作流和后端集成。
- 数据库：Supabase Postgres，表按 `restaurants`、`dishes`、`reviews`、`checkins`、`profiles`、`favorites`、`meal_plans`、`submissions`、`audit_logs` 拆分。
- 认证：Supabase Auth，后续叠加校园邮箱验证。
- 文件：Supabase Storage 保存打卡图、菜单图、餐厅封面。
- 权限：Supabase Row Level Security，用户私有数据必须有 RLS 策略。
- 部署：Vercel 从 GitHub 自动部署 preview 和 production。
- 推荐：早期在 Vercel Functions 中实现规则推荐，后期再加轻量 Agent 生成推荐理由。

## MCP / 外部工具边界

MCP 和插件能力主要用于开发期与运营期，不进入产品运行时：

- GitHub：版本、issue、PR、CI 和代码 review。
- Browser Use：后续 Web Admin 的本地交互测试、截图和验收。
- Documents / Spreadsheets：PRD、数据字典、审核规范、种子数据表。
- AI Agent：只能通过后端或管理侧调用，用于生成推荐理由、辅助审核摘要或数据清洗建议。

客户端只调用公开安全的前端 SDK、Vercel API 或我们自己的后端 API。不要让客户端直接依赖 MCP、第三方管理 token 或 service-role key。

## 安全与合规门槛

- UGC 不得直接写入正式集合，必须先进入 `submissions`。
- 所有文本、图片类 UGC 先过微信内容安全接口，再进入人工或社区审核。
- 餐厅种子数据不得未经授权复制论坛、小红书、微信群等平台的原文、图片、昵称或截图。
- 个人数据最小化采集，收藏、偏好、打卡、定位都需要在隐私政策中说明。
- 用户数据写操作必须受到 RLS 或 Vercel Functions 校验保护，数据库权限默认最小化。
- 管理员操作必须写入 `audit_logs`，保留审核前后快照，支持回滚。
- Vercel 环境变量必须区分 preview/production；Supabase service-role key 只能存在于服务端环境变量。

## 数据集合草案

### restaurants

```js
{
  id: 'restaurant_id',
  name: '港湾家常菜',
  area: '紫金港北门',
  latitude: 30.3124,
  longitude: 120.0921,
  cuisine: '家常菜',
  priceAvg: 28,
  ratingAvg: 4.5,
  studentScore: 91,
  checkinCount: 412,
  tags: ['近', '实惠', '快餐'],
  status: 'published',
  createdAt: Date,
  updatedAt: Date
}
```

### dishes

```js
{
  id: 'dish_id',
  restaurantId: 'restaurant_id',
  name: '番茄牛腩饭',
  price: 26,
  heat: 93,
  tags: ['下饭', '热菜'],
  status: 'published'
}
```

### reviews

```js
{
  id: 'review_id',
  restaurantId: 'restaurant_id',
  userId: 'user_id',
  rating: 5,
  text: '性价比稳定，适合赶课。',
  tags: ['快', '实惠'],
  images: [],
  status: 'approved',
  createdAt: Date
}
```

### profiles

```js
{
  id: 'user_id',
  nickName: '紫金港饭搭子',
  campusEmailVerified: true,
  preferences: ['近', '实惠', '辣'],
  creditScore: 80,
  createdAt: Date
}
```

### favorites

```js
{
  userId: 'user_id',
  restaurantId: 'restaurant_id',
  createdAt: Date
}
```

### submissions

```js
{
  id: 'submission_id',
  type: 'restaurant' | 'dish' | 'review',
  payload: {},
  submitterId: 'user_id',
  status: 'pending' | 'approved' | 'rejected',
  reviewerId: 'admin_user_id',
  createdAt: Date,
  reviewedAt: Date
}
```

### audit_logs

```js
{
  id: 'audit_log_id',
  actorId: 'admin_user_id',
  action: 'approve' | 'reject' | 'merge' | 'rollback',
  targetCollection: 'submissions',
  targetId: 'submission_id',
  before: {},
  after: {},
  reason: '信息完整且通过内容安全',
  createdAt: Date
}
```

## API / Vercel Functions 草案

- `GET /api/restaurants`：列表、筛选、搜索、推荐排序
- `GET /api/restaurants/:id`：餐厅详情、菜品、评论
- `POST /api/favorites/toggle`：收藏/取消收藏
- `POST /api/submissions/review`：提交短评和打卡
- `POST /api/submissions/restaurant`：学生新增餐厅
- `POST /api/admin/submissions/:id/review`：管理员审核
- `POST /api/recommend/today`：今日推荐/随机吃什么

## 从小程序 mock 迁移到 React/Vercel/Supabase

1. 保留当前小程序原型不动。
2. 将 `data/restaurants.js` 整理为带 schema version 的 seed JSON。
3. 新建 React + TypeScript + Vite 应用，复刻首页、发现、详情、收藏、我的流程。
4. 新建 Vercel Functions，先从 seed/mock 返回数据，再切 Supabase。
5. 新建 Supabase schema、RLS policies 和 seed import 脚本。
6. 将收藏和偏好从 localStorage 迁移到 Supabase Auth + `profiles`/`favorites`。
7. 接入校园邮箱验证、UGC 审核队列和管理员后台。

## 不进入下一阶段的阻断条件

- `npm run check` 不通过。
- 数据源绕过服务层或 repository 直接散落在页面里。
- 没有明确 Supabase RLS 权限模型。
- 没有内容安全与审核队列就开放真实 UGC。
- 没有隐私政策和定位权限说明就进入公开测试。

## 产品下一步优先级

1. 建 React/Vite/Vercel/Supabase 骨架。
2. 将当前 mock 数据 seed 化，并同步 Supabase schema。
3. 复刻当前小程序核心页面到 React。
4. 做用户提交评价/打卡入口，但先进入审核池。
5. 做榜单：本周热吃、30 元内、夜宵、适合约饭、一人食。
6. 做约饭 MVP：创建饭局、地点、时间、人数、可分享给好友。
7. 做管理员审核台和贡献信用机制。
