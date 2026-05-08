# 食在浙大技术路线

## MVP 边界

这版优先验证“学生是否愿意用它决定吃什么”。因此先不做登录、真实发布、审核台和复杂社交，而是把发现、筛选、详情、收藏、推荐这些高频路径跑顺。

## 推荐的下一阶段架构

- 前端：微信小程序原生或 Taro/uni-app。如果只做微信端，当前原生结构足够轻。
- 后端：微信云开发优先，降低部署和登录成本。
- 数据库：云开发数据库，集合按 `restaurants`、`dishes`、`reviews`、`checkins`、`users`、`meal_plans`、`submissions` 拆分。
- 文件：云存储保存打卡图、菜单图、餐厅封面。
- 审核：用户提交进入 `submissions`，管理员审核后写入正式集合。
- 推荐：早期规则云函数，后期再加轻量 Agent 生成推荐理由。

## MCP / 外部工具边界

MCP 和插件能力主要用于开发期与运营期，不进入小程序运行时：

- GitHub：版本、issue、PR、CI 和代码 review。
- Browser Use：后续 Web Admin 的本地交互测试、截图和验收。
- Documents / Spreadsheets：PRD、数据字典、审核规范、种子数据表。
- AI Agent：只能通过后端或管理侧调用，用于生成推荐理由、辅助审核摘要或数据清洗建议。

小程序端只调用微信能力、云函数或我们自己的后端 API。不要让客户端直接依赖 MCP、第三方 token 或管理工具。

## 安全与合规门槛

- UGC 不得直接写入正式集合，必须先进入 `submissions`。
- 所有文本、图片类 UGC 先过微信内容安全接口，再进入人工或社区审核。
- 餐厅种子数据不得未经授权复制论坛、小红书、微信群等平台的原文、图片、昵称或截图。
- 个人数据最小化采集，收藏、偏好、打卡、定位都需要在隐私政策中说明。
- 用户数据写操作必须走云函数，数据库权限默认最小化。
- 管理员操作必须写入 `audit_logs`，保留审核前后快照，支持回滚。
- 发布前替换正式 AppID，开启必要 URL 校验，并复核 source map 上传策略。

## 数据集合草案

### restaurants

```js
{
  _id: 'restaurant_id',
  name: '港湾家常菜',
  area: '紫金港北门',
  location: { latitude: 30.3124, longitude: 120.0921 },
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
  _id: 'dish_id',
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
  _id: 'review_id',
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

### users

```js
{
  _id: 'user_id',
  nickName: '紫金港饭搭子',
  campusEmailVerified: true,
  preferences: ['近', '实惠', '辣'],
  creditScore: 80,
  favoriteRestaurantIds: [],
  createdAt: Date
}
```

### submissions

```js
{
  _id: 'submission_id',
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
  _id: 'audit_log_id',
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

## API / 云函数草案

- `listRestaurants(filters)`：列表、筛选、搜索、推荐排序
- `getRestaurantDetail(id)`：餐厅详情、菜品、评论
- `toggleFavorite(restaurantId)`：收藏/取消收藏
- `submitReview(payload)`：提交短评和打卡
- `submitRestaurant(payload)`：学生新增餐厅
- `reviewSubmission(submissionId, action)`：管理员审核
- `recommendToday(userId, context)`：今日推荐/随机吃什么

## 从 mock 迁移到云开发

1. 保留页面不动，把 `services/restaurantService.js` 的数据源替换为 `wx.cloud.callFunction`。
2. 把 `data/restaurants.js` 导入云数据库的 `restaurants` 和 `dishes` 集合。
3. 把本地 `utils/storage.js` 的收藏迁移到 `users.favoriteRestaurantIds`。
4. 加入微信登录与校园邮箱认证。
5. 加审核后台页面或独立 Web Admin。

## 不进入下一阶段的阻断条件

- `npm run check` 不通过。
- 数据源绕过 `services/restaurantService.js` 直接散落在页面里。
- 没有明确云数据库权限模型。
- 没有内容安全与审核队列就开放真实 UGC。
- 没有隐私政策和定位权限说明就进入公开测试。

## 产品下一步优先级

1. 接入真实学生种子数据，先覆盖紫金港北门、青芝坞、西溪天街、西园夜市。
2. 做用户提交评价/打卡入口，但先进入审核池。
3. 做榜单：本周热吃、30 元内、夜宵、适合约饭、一人食。
4. 做约饭 MVP：创建饭局、地点、时间、人数、可分享给好友。
5. 做管理员审核台和贡献信用机制。
