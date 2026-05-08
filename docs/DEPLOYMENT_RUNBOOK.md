# Deployment Runbook

日期：2026-05-08

## 当前目标

把本地 demo 推到真实 Supabase + Vercel preview：

1. 在 Supabase 执行 schema migration。
2. 导入 demo seed。
3. 在 Vercel 配置环境变量。
4. 部署 preview。
5. 验证 API 响应 `source=supabase`。

## 需要的凭证

这些值不要提交到仓库：

```bash
SUPABASE_DB_URL=postgresql://...
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

如果用 Vercel CLI，还需要：

```bash
VERCEL_TOKEN=...
VERCEL_ORG_ID=...
VERCEL_PROJECT_ID=...
```

当前本机未检测到这些环境变量，也没有 `supabase`、`vercel`、`psql` 或 Docker，因此本轮没有真实执行远端部署。

## 1. 执行 Supabase migration 和 seed

优先方式：使用仓库内脚本，不依赖 Supabase CLI 或 psql。

```bash
export SUPABASE_DB_URL='postgresql://...'
npm run supabase:apply:seed
```

如果只想执行 migration，不导入 seed：

```bash
export SUPABASE_DB_URL='postgresql://...'
npm run supabase:apply
```

脚本行为：

- 读取 `supabase/migrations/*.sql`。
- 用 `app_private.schema_migrations` 记录已执行文件。
- 已执行过的 migration 会跳过。
- `supabase/seed.sql` 可重复执行，因为它使用 upsert。
- 不会打印数据库连接串。

重要限制：如果你已经手动在 Dashboard 粘贴执行过 migration，但没有 `app_private.schema_migrations` 记录，再运行脚本可能因为 trigger 已存在而失败。此时建议新建干净 project 运行脚本，或手动补 migration record。

## 2. 配置 Vercel 环境变量

Vercel Dashboard 配置这些 server-side env：

```bash
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
SUPABASE_DISABLE_FALLBACK=true
CAMPUS_EMAIL_DOMAINS=zju.edu.cn,st.zju.edu.cn,intl.zju.edu.cn
```

如果未来浏览器端接 Supabase Auth，再配置：

```bash
VITE_SUPABASE_URL=https://xxxx.supabase.co
VITE_SUPABASE_ANON_KEY=...
```

当前代码已经接入 Supabase Auth、收藏同步、UGC submissions 和管理员审核页，因此如果要演示登录/提交/审核，`VITE_SUPABASE_URL` 与 `VITE_SUPABASE_ANON_KEY` 也需要配置到 Vercel Preview/Production。

建议：

- Preview 环境可先设 `SUPABASE_DISABLE_FALLBACK=false`，方便回退 demo。
- Staging/Production 建议设 `SUPABASE_DISABLE_FALLBACK=true`，让后端问题尽早暴露。

## 3. 部署 Vercel preview

如果已连接 GitHub，推送 `main` 后 Vercel 会自动生成 preview。

如果使用 Vercel CLI：

```bash
vercel pull --yes --environment=preview
vercel deploy
```

当前本机没有 `vercel` CLI 和 token，因此这一步尚未执行。

## 4. 验证 API 来源

验证本地 API handler 读取 Supabase：

```bash
export SUPABASE_URL='https://xxxx.supabase.co'
export SUPABASE_ANON_KEY='...'
export SUPABASE_SERVICE_ROLE_KEY='...'
EXPECT_API_SOURCE=supabase npm run smoke:api
```

验证远端 Vercel preview：

```bash
API_BASE_URL='https://your-preview.vercel.app' EXPECT_API_SOURCE=supabase npm run smoke:api
```

如果你预期 fallback：

```bash
EXPECT_API_SOURCE=seed npm run smoke:api
```

## 5. 红队检查清单

| 检查 | 期望 |
| --- | --- |
| `/api/restaurants` | 200，`source=supabase`，有餐厅数据 |
| `/api/restaurants/r001` | 200，`source=supabase`，有菜品和评论 |
| `/api/recommend/today` | 200，`source=supabase`，返回餐厅 |
| `/api/submissions` 无 bearer | 401 |
| `/api/admin/submissions` 无 bearer | 401 |
| `/profile` | 配置 `VITE_*` 后可发送邮箱验证码 |
| `/api/auth/campus-verify` 无 bearer | 401 |
| `/profile` 校园邮箱验证 | 登录后可写入 `user_trust.campus_email_verified` |
| `/contribute` | 登录后提交进入 `submissions.status=pending` |
| `/admin` | 管理员可读取 pending submissions |
| `/api/restaurants/../secret` | 400 |
| `/api/recommend/today?strategy=invalid` | 400 |
| `SUPABASE_DISABLE_FALLBACK=true` 且数据库错误 | 500，不回退 seed |
| Vercel env | service-role 不出现在 `VITE_*` 变量 |

## 6. 邮箱验证码模板

为避免校园邮箱拦截 Supabase magic link 外链，`/profile` 使用邮箱 OTP 登录。Supabase 的 `Authentication -> Email Templates -> Magic Link` 模板需要包含 `{{ .Token }}`，推荐模板见 `docs/SUPABASE_OTP_EMAIL_TEMPLATE.md`。

## 当前阻断项

我对“迁移/部署执行流程已经可操作”有信心，但对“真实 Supabase/Vercel 已完成”不能给出 100% 信心，因为缺少实际凭证和 CLI/token。本轮完成的是把缺口从人工步骤收敛为可执行脚本与 smoke test。
