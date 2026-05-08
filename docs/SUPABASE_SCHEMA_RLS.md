# Supabase Schema and RLS Plan

日期：2026-05-08

## 目标

把“食在浙大”的生产数据边界先设计清楚，再逐步把当前 seed-backed API 切到 Supabase。当前迁移文件是第一版安全基线，不代表已经可以开放真实 UGC。

## 文件

- 初始迁移：`supabase/migrations/202605080001_initial_schema.sql`
- seed SQL：`supabase/seed.sql`
- seed 生成器：`scripts/generate-supabase-seed.cjs`

更新 `seed/*.json` 后运行：

```bash
npm run seed:sql:write
npm run check
```

## 表设计

| 表 | 用途 | RLS 策略摘要 |
| --- | --- | --- |
| `restaurants` | 餐厅主数据 | 匿名/登录用户只读 `published`；管理员可管理 |
| `dishes` | 菜品数据 | 匿名/登录用户只读 published 且所属餐厅 published；管理员可管理 |
| `reviews` | 评论数据 | 匿名/登录用户只读 `approved`；用户可提交/编辑自己的 pending 评论；管理员可管理 |
| `favorites` | 用户收藏 | 仅本人读写删 |
| `profiles` | 用户可编辑资料与偏好 | 仅本人读写 |
| `user_trust` | 校园邮箱、信用分、贡献计数 | 用户只能读自己的状态；写入由服务端/管理员完成 |
| `submissions` | UGC 审核队列 | 用户只能创建/读取自己的 pending submission；管理员可审核 |
| `audit_logs` | 审核/管理动作日志 | 管理员只读；写入走服务端 service role |
| `admin_users` | 管理员/社区管理员名单 | 管理员可读；写入走 service role |

## 关键安全决策

### 1. 不让用户直接写正式公共表

真实 UGC 不直接写入 `restaurants`、`dishes`。新增餐厅、纠错、打卡等先进入 `submissions`，审核后由服务端或管理员写正式表。

### 2. 不把可提权字段放进用户可更新表

`profiles` 只保留 display name、avatar、preferences 这类用户可编辑字段。校园邮箱验证、信用分、贡献计数放进 `user_trust`，不开放用户写入，避免用户通过普通 update 自行提权。

### 3. 管理员权限独立建表

管理员身份来自 `admin_users`，通过 `public.is_platform_admin()` 在 RLS 中判断。管理员名单不由普通用户更新，避免 role 字段自我升级。

### 4. 审核与回滚必须有日志

`audit_logs` 记录 actor、action、target、before/after 和 reason。当前迁移只给管理员 read 权限，写入应由 Vercel Function 使用 service-role key 完成。

### 5. Seed 数据带来源标记

生成出的 `supabase/seed.sql` 会把 demo 来源写入 `source_refs`，避免后续把 mock/授权/社区整理数据混在一起。

### 6. 输入面先做硬限制

`profiles.preferences` 最多 20 个标签；`submissions.payload` 限制为 JSON object 且文本体积不超过 20KB；普通用户提交/更新 pending review 时只能指向 `published` 餐厅。

## API 迁移顺序

1. 新建 Supabase project，执行迁移和 seed。
2. 在 Vercel 设置 `SUPABASE_URL`、`SUPABASE_ANON_KEY`、`SUPABASE_SERVICE_ROLE_KEY`。
3. 新增 server-side Supabase client，只在 `api/` 使用 service-role key。
4. 将 `GET /api/restaurants` 从 seed repository 切到 Supabase repository。
5. 将 `GET /api/restaurants/[id]` 切到 Supabase join/query。
6. 保留 seed fallback，直到 Vercel Preview 通过。
7. 再接 Auth、favorites 和 submissions，不提前开放真实 UGC。

## 红队循环

| 漏洞 | 等级 | 修复 |
| --- | --- | --- |
| 用户更新 profile 时可能自提权 | P0 | 不在 `profiles` 放 role、credit、verified；这些拆到 `admin_users` 和 `user_trust` |
| 公开读到草稿/未审核内容 | P0 | public read policy 只允许 `published`/`approved` |
| 用户绕过审核写正式表 | P0 | 正式表写入只给管理员或 service role；普通 UGC 写 `submissions`/pending `reviews` |
| 管理员操作不可追溯 | P1 | 设计 `audit_logs`；管理类 API 必须写日志后才能合并 |
| Seed 与 JSON 漂移 | P1 | `npm run check` 会执行 `scripts/generate-supabase-seed.cjs --check` |
| 前后端服务切 Supabase 时返工 | P2 | 先保持 API/service repository 边界，再替换数据源 |
| 真实 Supabase CLI/数据库未执行迁移 | P2 | 当前只是版本化 SQL，下一步需要在实际 project 或 local Supabase 上跑迁移 |
| 用户提交过大 payload 或评论挂到草稿餐厅 | P2 | 加 payload 大小限制，并要求普通用户 review 只能指向 published 餐厅 |

## 本地验证

已通过：  

```bash
npm run check
npm run build
npm run seed:sql
```

本地也完成了前端路由 HTTP smoke test 和 API handler mock 调用。当前机器未检测到 `psql`、`supabase` CLI 或 Docker，因此尚未做真实 Postgres/Supabase 迁移执行验证。这个缺口已记录为 `R28`，进入下一阶段前需要补上。

## 当前信心声明

对“Supabase schema/RLS 作为下一阶段实现基线”，当前没有未处理的 P0/P1 风险。仍不能声称对真实上线有 100% 信心，因为迁移尚未在真实 Supabase project 执行，Auth 邮箱验证、内容安全、审核台、隐私政策和真实数据授权还没完成。

## 参考

- Supabase Row Level Security docs: https://supabase.com/docs/guides/database/postgres/row-level-security
- Supabase API key/security docs: https://supabase.com/docs/guides/api/api-keys
