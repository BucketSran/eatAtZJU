# WeChat Mini Program Plan

日期：2026-05-08

## 决策

`食在浙大` 的学生主入口改为微信小程序。Web 站继续保留，用于：

- 可访问 Vercel 的 demo。
- 管理后台 `/admin`。
- 数据审核、回滚和运营工具。

数据库短中期仍然以 Supabase Postgres 作为唯一事实源，不做 Supabase DB 与 CloudBase DB 的长期双写同步。

## 架构

```text
微信小程序
  -> wx.cloud.callFunction
  -> CloudBase 云函数 eatAtZjuApi
  -> Supabase Postgres

React Web
  -> Vercel Functions
  -> Supabase Postgres
```

CloudBase 在这里是小程序后端代理层，不是第二个数据库。

## 为什么不做双数据库

长期双写会引入这些问题：

- 餐厅、菜品、评论的最新版本不一致。
- 审核结果和回滚需要跨库事务，但我们没有跨云事务能力。
- 收藏、信用分、校园认证可能出现冲突。
- 同一用户在 Web 和小程序的身份合并会变复杂。

当前原则是：

```text
一个数据库，两个入口，两套后端适配层。
```

## 已落地的仓库改动

- `project.config.json` 增加 `cloudfunctionRoot: cloudfunctions/`。
- 新增 CloudBase 普通云函数：`cloudfunctions/eatAtZjuApi`。
- 小程序页面改为优先调用云函数，失败时回退本地 seed。
- 新增迁移：`supabase/migrations/202605080002_app_identity_links.sql`。

## CloudBase 云函数 POC

函数名：

```text
eatAtZjuApi
```

支持 action：

| action | 用途 |
| --- | --- |
| `ping` | 测试云函数和 openid 注入 |
| `getMetadata` | 获取标签和价格区间 |
| `listRestaurants` | 获取餐厅列表 |
| `getRestaurantDetail` | 获取餐厅详情 |
| `getTodayRecommendation` | 获取今日推荐或随机推荐 |

云函数需要环境变量：

```text
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=你的 Supabase service role 或 secret key
```

如果只做公开只读 POC，也可以临时用：

```text
SUPABASE_ANON_KEY=你的 Supabase anon 或 publishable key
```

但正式写入、身份映射、收藏同步和 UGC 提交必须使用服务端 secret，不能放在小程序前端。

## 小程序调用方式

小程序端通过：

```js
wx.cloud.callFunction({
  name: 'eatAtZjuApi',
  data: {
    action: 'listRestaurants',
    query: {
      tag: '全部',
      preferences: '近,实惠,辣'
    }
  }
})
```

CloudBase 文档说明，小程序 SDK 可直接调用云函数，并且会自动携带用户身份；云函数中可从 `event.userInfo.openId` 获取 openid。

## 身份模型

新增两张表：

| 表 | 用途 |
| --- | --- |
| `app_users` | 产品内统一用户，不绑定某个登录渠道 |
| `identity_links` | 把 Supabase Auth UUID、微信 openid 等外部身份映射到 `app_users` |

未来一个真实用户可以同时有：

```text
app_user_id = 统一用户
provider = supabase_auth, provider_user_id = Web Supabase UUID
provider = wechat_miniapp, provider_user_id = 微信 openid
```

这避免 Web 用户和小程序用户长期分裂。

## 分阶段实现

### 阶段 1：只读 POC

目标：

- 小程序首页从 CloudBase 云函数读取 Supabase 餐厅列表。
- 详情页读取 Supabase 菜品和评论。
- 今日随机吃什么通过云函数返回。
- 云函数不可用时自动 fallback 本地 seed。

验收：

- 微信开发者工具能上传并调用 `eatAtZjuApi`。
- `ping` 返回 `ok: true`。
- `listRestaurants` 返回 60 条左右，并标记 `source: supabase`。

### 阶段 2：微信身份和收藏

目标：

- 云函数读取 `event.userInfo.openId`。
- 首次访问创建或查找 `app_users`。
- 建立 `identity_links(provider='wechat_miniapp')`。
- 小程序收藏写入同一套收藏表或新的 app-user 收藏表。

注意：当前 `favorites.user_id` 仍引用 `auth.users(id)`，不适合直接写微信 openid。下一步应新增 `app_favorites`，或重构 `favorites` 支持 `app_user_id`。

### 阶段 3：UGC 和审核

目标：

- 小程序提交餐厅/菜品/纠错进入 `submissions`。
- 管理后台继续用 Web `/admin` 审核。
- 审核写入 `audit_logs`，支持回滚。

注意：当前 `submissions.submitter_id` 仍引用 `auth.users(id)`，下一步需要新增 `app_submitter_id` 或 `app_submissions`。

### 阶段 4：真实发布

目标：

- 小程序注册、类目、隐私政策、用户协议完成。
- 内容安全、图片审核、投诉删除入口上线。
- 数据备份和错误监控就位。

## 风险和缓解

| 风险 | 等级 | 缓解 |
| --- | --- | --- |
| CloudBase 云函数访问 Supabase 不稳定 | P1 | 阶段 1 先做只读 POC；失败则考虑腾讯云 PostgreSQL 或 CloudBase DB 的整体迁移 |
| service key 泄露 | P0 | key 只放 CloudBase 云函数环境变量，绝不放小程序前端 |
| 身份模型和现有 auth.users 绑定冲突 | P1 | 先加 `app_users/identity_links`，不立即破坏现有 Web 表 |
| 小程序 UGC 绕过审核 | P0 | 所有写入先进入 submissions，不直接写正式餐厅/评论 |
| 双数据库造成数据漂移 | P0 | 明确 Supabase 是唯一事实源，不做长期双写 |

## 下一步

1. 在 Supabase SQL Editor 执行 `202605080002_app_identity_links.sql`。
2. 在微信开发者工具开通云开发环境。
3. 上传并部署 `cloudfunctions/eatAtZjuApi`。
4. 在 CloudBase 云函数环境变量配置 Supabase URL 和 server key。
5. 调用 `ping` 和 `listRestaurants` 做 POC 验证。
6. 若稳定，再做微信 openid -> `identity_links` 的写入闭环。

## 官方参考

- CloudBase 调用普通云函数：<https://docs.cloudbase.net/cloud-function/how-use>
- 微信小程序云开发文档：<https://developers.weixin.qq.com/miniprogram/dev/wxcloud/basis/getting-started.html>
- Supabase API keys：<https://supabase.com/docs/guides/getting-started/api-keys>
