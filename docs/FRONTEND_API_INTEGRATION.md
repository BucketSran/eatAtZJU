# Frontend API Integration

日期：2026-05-08

## 目标

React demo 页面不再只读浏览器内置 seed，而是优先调用 `/api/*`。这样 Vercel + Supabase 配好后，页面可以自然展示 Supabase 数据；本地 Vite 或 API 不可用时仍回退本地 seed，保证 demo 可用。

## 已接入页面

- `/` 首页：列表、今日首推、随机一餐
- `/discover`：搜索、筛选、排序、随机结果
- `/restaurants/:id`：详情、菜品、评论、类似推荐
- `/favorites`：收藏列表和空状态推荐
- `/profile`：偏好驱动推荐

## 新增服务

- `src/services/apiRestaurantClient.ts`：浏览器 API client，封装 `/api/restaurants`、`/api/restaurants/:id`、`/api/recommend/today`。
- `src/services/restaurantService.ts`：保留同步 seed service，同时新增 remote service：
  - `listRestaurantsRemote`
  - `getRestaurantDetailRemote`
  - `getFavoriteRestaurantsRemote`
  - `getRecommendedRestaurantRemote`
  - `getRandomRestaurantRemote`

## Fallback 策略

| 场景 | 行为 |
| --- | --- |
| Vercel API 可用 | 使用 API 返回数据 |
| API 返回 `source=supabase` | 页面标记“数据来自 Supabase” |
| API 未配置 Supabase 且返回 seed | 页面标记后端 seed fallback |
| 本地 Vite 没有 `/api` 或网络失败 | 回退浏览器内置 seed |
| Supabase 明确返回 404 | 不回退本地 seed，避免掩盖真实空库/缺失数据 |

## 环境变量

默认同域调用 `/api/*`。如果前端需要调用其它 API base URL，可设置：

```bash
VITE_API_BASE_URL=https://your-preview.vercel.app
```

不要在 `VITE_*` 中放 service-role key。

## 验证

已通过：

```bash
npm run check
npm run build
```

并用 `vite preview` 验证核心路由返回 200。

## 红队循环

| 漏洞 | 等级 | 修复 |
| --- | --- | --- |
| 前端仍读本地 seed，Supabase 数据无法展示 | P1 | 页面接入 `/api/*` remote service |
| 本地开发 API 不存在导致页面不可用 | P2 | remote service 失败时回退本地 seed |
| Supabase 404 被本地 seed 掩盖 | P1 | `source=supabase` 的 404 视为权威缺失，不 fallback |
| 用户不知道当前数据来源 | P3 | 页面显示简短数据源状态条 |
| 请求竞态覆盖新状态 | P2 | 页面 effect 使用 `AbortController` |
