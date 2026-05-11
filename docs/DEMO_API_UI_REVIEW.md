# Demo API 与 UI 纵切审计

日期：2026-05-08

## 本轮目标

把 Web/PWA demo 从“React 骨架 + seed 数据”推进到可演示纵切：

- 首页可展示推荐、随机一餐、快捷筛选和公开信息优先推荐。
- 发现页可搜索、筛选、排序，并展示随机结果。
- 详情页可展示餐厅基本信息、标签、匹配分、公开来源和系统整理说明。
- 收藏页可读取本地收藏，空状态可引导回发现页。
- 我的页可配置本地偏好，并实时影响推荐结果。
- Vercel API Functions 可提供餐厅列表、餐厅详情和今日推荐接口。

## 已实现范围

### 前端

- `src/services/restaurantService.ts` 作为 Web demo 数据入口。
- `src/lib/filters.ts` 统一处理关键词、标签、价格和排序。
- `src/lib/recommendation.ts` 统一处理规则推荐和随机选择。
- `src/services/favoriteStore.ts` 使用 `localStorage` 存储本地收藏。
- `src/services/preferenceStore.ts` 使用 `localStorage` 存储本地偏好。
- `src/components/RestaurantCard.tsx`、`FilterChips.tsx`、`SegmentedControl.tsx` 复用核心 UI。
- 首页、发现、详情、收藏、我的五个路由已全部接入 seed 数据。

### API

- `GET /api/restaurants`：列表、筛选、排序、匹配分和 metadata。
- `GET /api/restaurants/[id]`：详情、菜品、审核通过评论。
- `GET /api/recommend/today`：今日推荐，支持 `strategy=random`。
- `server/api/_shared/restaurantService.cjs` 复用 seed 数据并封装 API 侧规则。

## 验证结果

已通过：

```bash
npm run check
npm run build
```

额外 smoke test：

- `GET /` 返回 200。
- `GET /discover` 返回 200。
- `GET /restaurants/r001` 返回 200。
- `GET /favorites` 返回 200。
- `GET /profile` 返回 200。
- API handler mock 调用成功：餐厅列表、详情、今日推荐均返回 200 和有效 payload。

## 红队检查

| 风险 | 等级 | 结论 | 修复/缓解 |
| --- | --- | --- | --- |
| 前端仍是纯本地 seed，不是真实后端数据 | P2 | 可接受，当前目标是 demo 纵切 | 保持服务层边界，下一阶段切 Supabase repository |
| API 侧 CJS 逻辑与前端 TS 逻辑存在重复 | P2 | 当前 demo 可接受，但长期会漂移 | Supabase 接入前抽象共享领域规则或增加契约测试 |
| 收藏/偏好只存在本地浏览器 | P2 | 符合 demo 边界 | Supabase Auth 接入后迁移到用户表/RLS |
| 随机推荐不是稳定可复现 | P3 | 演示可接受 | 后续可用日期/用户 ID seed 做每日固定推荐 |
| 详情页缺少真实图片/地图 | P3 | 演示可接受 | 真实 UGC 前先解决图片授权和内容安全 |
| 未用真实浏览器进行视觉验收 | P2 | 代码与 HTTP smoke 已过，但仍需人工视觉检查 | 下一步用 Browser Use 或 Vercel Preview 截图复核桌面/移动端 |

## 当前信心声明

对“这条 demo 纵切可以继续作为可演示版本推进”，当前没有未处理的 P0/P1 风险。

不能声称对公开发布或真实 UGC 有 100% 信心，因为身份验证、审核、隐私、RLS、内容安全、版权授权和真实数据规模仍未完成。这个结论与 `docs/RISK_REGISTER.md` 的阶段门槛一致。

## 下一步建议

1. 用 Browser Use 或 Vercel Preview 做视觉验收，确认移动端和桌面布局。
2. 设计 Supabase schema、RLS 和 seed 导入脚本。
3. 把 API 从本地 seed repository 切到 Supabase repository，同时保留 seed fallback。
4. 扩充真实授权 seed 数据，至少覆盖紫金港主要区域和预算段。
