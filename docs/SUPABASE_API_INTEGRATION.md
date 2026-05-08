# Supabase API Integration

日期：2026-05-08

## 目标

让现有 Vercel API Functions 优先读取 Supabase，同时在未配置 Supabase 或 Supabase 请求失败时回退到 seed 数据，保证 demo preview 不会因为数据库环境缺失而直接挂掉。

## 已接入 API

- `GET /api/restaurants`
- `GET /api/restaurants/[id]`
- `GET /api/recommend/today`
- `POST /api/submissions`
- `GET /api/admin/submissions`
- `POST /api/admin/submissions`

响应会带上：

```json
{
  "source": "supabase | seed",
  "fallbackReason": "supabase_not_configured | supabase_error"
}
```

当 `source=supabase` 时，表示数据来自 Supabase；当 `source=seed` 时，表示仍在使用本地 seed fallback。

## 新增文件

- `api/_shared/supabaseClient.cjs`：读取服务端 Supabase env 并创建 server client。
- `api/_shared/auth.cjs`：校验 bearer token，并为数据库操作创建 service-role 或 user-scoped client。
- `api/_shared/requestBody.cjs`：读取 Vercel request JSON body。
- `api/_shared/supabaseRestaurantRepository.cjs`：Supabase 数据读取、snake_case 到 camelCase 映射。
- `api/_shared/restaurantRepository.cjs`：统一 API repository，封装 Supabase 优先和 seed fallback。
- `api/_shared/requestValidation.cjs`：API query 参数的轻量边界校验。

## 环境变量

Vercel/API server-side：

```bash
SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
SUPABASE_DISABLE_FALLBACK=false
```

浏览器端未来如需 Supabase Auth：

```bash
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

注意：`SUPABASE_SERVICE_ROLE_KEY` 只能放在 Vercel 服务端环境变量，绝不能放到 `VITE_*` 或提交到仓库。

## Fallback 策略

| 场景 | 行为 | 原因 |
| --- | --- | --- |
| Supabase 未配置 | 回退 seed | 本地开发和 Vercel preview 仍可演示 |
| Supabase 请求报错 | 默认回退 seed | 避免 demo 因数据库短暂错误不可用 |
| Supabase 已配置但结果为空 | 不回退 seed | 避免掩盖 migration/seed 没导入的问题 |
| `SUPABASE_DISABLE_FALLBACK=true` | Supabase 报错直接 500 | 用于 staging/production 更早暴露真实后端问题 |

## 安全要点

### service-role 会绕过 RLS

Supabase service-role key 会绕过 RLS。因此 API repository 即使用 service-role，也必须在查询里显式加：

- `restaurants.status = 'published'`
- `dishes.status = 'published'`
- `reviews.status = 'approved'`

当前 Supabase repository 已经显式过滤这些状态。

### 不把错误细节返回给客户端

API handler 捕获异常后只返回通用错误文案，详细错误仅留在服务端日志，避免泄露 schema、SQL 或环境信息。

### bearer token 后续查询必须带用户上下文

服务端会先用 Supabase `auth.getUser(token)` 校验 bearer token。通过后：

- 如果配置了 `SUPABASE_SERVICE_ROLE_KEY`，服务端 API 使用 service-role client，但必须由 API 自己显式限制提交者、状态和审核动作。
- 如果没有 service-role，但配置了 anon key，服务端 API 会创建带 `Authorization: Bearer <jwt>` 的 user-scoped client，让 RLS 中的 `auth.uid()` 生效。

这样可以避免“token 校验成功，但数据库写入没有用户上下文”的线上失败。

### 不在空结果时回退

如果 Supabase 已配置但返回空列表/404，说明真实数据库状态就是空或缺失。此时不应悄悄使用 seed，否则会掩盖部署问题。

### API 边界做最小输入校验

动态餐厅 ID 只接受字母、数字、下划线和短横线；推荐策略只接受 `recommended` 或 `random`。无效输入直接返回 400，不进入 repository。

## 验证

已纳入 `npm run check`：

- seed service 基础查询。
- repository 在无 Supabase env 时回退 seed。
- 三个 API handler 在无 Supabase env 时返回 200 和 `source=seed`。
- API handler 会拒绝非法餐厅 ID 和非法推荐策略。
- Supabase schema/RLS 文件和 seed SQL 同步检查。

手动验证：

```bash
npm run check
npm run build
```

## 红队循环

| 漏洞 | 等级 | 修复 |
| --- | --- | --- |
| service-role 绕过 RLS 导致草稿/未审内容泄露 | P0 | API repository 显式过滤 `published/approved` |
| fallback 掩盖真实 Supabase 空库 | P1 | 只在未配置或请求错误时 fallback，不在空结果 fallback |
| fallback 掩盖 staging/production 错误 | P2 | 增加 `SUPABASE_DISABLE_FALLBACK=true` 开关 |
| API 响应无法判断数据来源 | P2 | 响应带 `source` 和 `fallbackReason` |
| Supabase env 泄露到浏览器 | P0 | service-role 只在 `SUPABASE_SERVICE_ROLE_KEY`，不使用 `VITE_` 前缀 |
| 非法路由参数进入数据库查询 | P1 | 对餐厅 ID 和推荐 strategy 做白名单校验，无效输入返回 400 |
| bearer 校验后 RLS 用户上下文丢失 | P1 | 新增 user-scoped Supabase client，anon 场景下带用户 JWT 查询 |
| UGC 直接写正式表 | P0 | `/api/submissions` 只写 pending queue，管理员审核后再进入后续发布流程 |

## 当前信心声明

对“API 能在未配置 Supabase 时保持 demo 可用，并在配置 Supabase 后优先读取数据库”的策略，当前没有未处理的 P0/P1 风险。仍不能声称真实 Supabase 已完全验证，因为本机没有 `psql`、Supabase CLI 或 Docker，迁移尚未在真实数据库执行。
