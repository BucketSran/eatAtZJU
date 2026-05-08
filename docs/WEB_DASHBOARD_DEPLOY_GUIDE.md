# Web Dashboard Deployment Guide

日期：2026-05-08

这份指南用于从网页端完成 `食在浙大` 的真实 Supabase 数据库和 Vercel 部署。它不要求安装 Supabase CLI、Vercel CLI、psql 或 Docker。

## 0. 你最终会得到什么

完成后应该有：

- 一个 Supabase project，里面有真实 Postgres 表、RLS 权限、demo seed 数据。
- 一个 Vercel project，连接当前 GitHub 仓库 `BucketSran/eatAtZJU`。
- 一个 Vercel Preview/Production URL，可以打开 React demo。
- API 返回 `source=supabase`，说明页面数据来自真实数据库而不是本地 seed fallback。
- `/profile` 可登录，`/contribute` 可提交审核，`/admin` 可读取审核队列。

## 1. 创建 Supabase Project

1. 打开 Supabase Dashboard：<https://supabase.com/dashboard>。
2. 点击 `New project`。
3. Organization 选你的个人或团队组织。
4. Project name 建议填写：`eatatzju`。
5. Database password 使用强密码，并保存到密码管理器。后面拿数据库连接串时会用到。
6. Region 选离主要用户更近的区域。面向国内学生，优先考虑 `Singapore`、`Tokyo` 或其它亚洲区域；如果控制台没有这些选项，就选你账号可用的最近区域。
7. 点击创建，等待 project provision 完成。

注意：GitHub 仓库不用重建。Supabase project 是云端数据库，数据库结构仍然通过当前仓库的 `supabase/` 目录做版本管理。

## 2. 获取 Supabase URL 和 Keys

在 Supabase project 页面：

1. 进入 `Project Settings`。
2. 找到 `API Keys` 或 `API` 页面。
3. 复制这些值，先临时放到你自己的密码管理器或本地安全笔记里，不要提交到 GitHub：

```bash
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
VITE_SUPABASE_URL=https://xxxx.supabase.co
VITE_SUPABASE_ANON_KEY=...
```

取值规则：

- `SUPABASE_URL` 和 `VITE_SUPABASE_URL` 都填 Project URL。
- `SUPABASE_ANON_KEY` 和 `VITE_SUPABASE_ANON_KEY` 填 anon key 或 publishable key。
- `SUPABASE_SERVICE_ROLE_KEY` 填 service_role key 或 secret key。
- `SUPABASE_SERVICE_ROLE_KEY` 只能用于 Vercel 服务端环境变量，绝对不要放进 `VITE_*`。

## 3. 通过 SQL Editor 建表

在 Supabase project 页面：

1. 进入 `SQL Editor`。
2. 点击 `New query`。
3. 打开本仓库文件：`supabase/migrations/202605080001_initial_schema.sql`。
4. 全选复制 SQL 内容，粘贴到 SQL Editor。
5. 点击 `Run`。
6. 确认没有报错。

执行成功后，应该能在 `Table Editor` 看到这些表：

- `admin_users`
- `profiles`
- `user_trust`
- `restaurants`
- `dishes`
- `reviews`
- `favorites`
- `submissions`
- `audit_logs`

## 4. 通过 SQL Editor 导入 Demo Seed

继续在 Supabase `SQL Editor`：

1. 点击 `New query`。
2. 打开本仓库文件：`supabase/seed.sql`。
3. 全选复制 SQL 内容，粘贴到 SQL Editor。
4. 点击 `Run`。
5. 执行成功后，到 `Table Editor -> restaurants` 查看是否有餐厅数据。

期望数量：

- `restaurants`：60 条左右。
- `dishes`：180 条左右。
- `reviews`：120 条左右。

如果 SQL Editor 因为内容太长或网络原因失败，改用脚本方式：

```bash
export SUPABASE_DB_URL='postgresql://...'
npm run supabase:apply:seed
```

数据库连接串可在 Supabase project 顶部或 Database 页面点击 `Connect` 获取。Serverless/临时脚本场景优先选 pooler transaction mode 或 Dashboard 推荐的 connection string。

## 5. 配置 Supabase Auth Redirect URL

因为我们的登录是邮箱 magic link，Supabase 必须允许跳回 Vercel URL。

在 Supabase project 页面：

1. 进入 `Authentication`。
2. 进入 `URL Configuration`。
3. `Site URL` 先填你的 Vercel 正式 URL，例如：

```text
https://eat-at-zju.vercel.app
```

4. `Redirect URLs` 增加：

```text
http://localhost:5173/**
https://*.vercel.app/**
https://eat-at-zju.vercel.app/**
```

说明：

- `http://localhost:5173/**` 用于本地 Vite 开发。
- `https://*.vercel.app/**` 用于 Vercel preview。正式上线后可以收紧。
- `https://eat-at-zju.vercel.app/**` 换成你的实际 Production URL。

## 6. 在 Vercel 导入 GitHub 仓库

1. 打开 Vercel Dashboard：<https://vercel.com/dashboard>。
2. 点击 `Add New...` 或 `New Project`。
3. 选择 GitHub provider。
4. 选择仓库：`BucketSran/eatAtZJU`。
5. Framework Preset 选择 `Vite`，如果 Vercel 自动识别了就保持默认。
6. Root Directory 保持仓库根目录，不要选 `src` 或 `api`。
7. Build Command 使用默认或填写：

```bash
npm run build
```

8. Output Directory 使用：

```bash
dist
```

9. 先不要点 Deploy，继续配置环境变量。

## 7. 在 Vercel 配置环境变量

在 Vercel import project 页面或 project 创建后的 `Settings -> Environment Variables` 添加：

```bash
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_ANON_KEY=你的 anon 或 publishable key
SUPABASE_SERVICE_ROLE_KEY=你的 service_role 或 secret key
SUPABASE_DISABLE_FALLBACK=true
CAMPUS_EMAIL_DOMAINS=zju.edu.cn,st.zju.edu.cn,intl.zju.edu.cn
VITE_SUPABASE_URL=https://xxxx.supabase.co
VITE_SUPABASE_ANON_KEY=你的 anon 或 publishable key
```

建议作用范围：

- Preview：全部添加。
- Production：全部添加。
- Development：可选，本地如果只用 `.env.local` 就不用在 Vercel Development 里配。

安全检查：

- `SUPABASE_SERVICE_ROLE_KEY` 不得以 `VITE_` 开头。
- `VITE_SUPABASE_ANON_KEY` 可以公开，因为它受 RLS 保护。
- `CAMPUS_EMAIL_DOMAINS` 可选，用于控制哪些邮箱域会被 `/profile` 认证为校园邮箱；多个域名用英文逗号分隔。
- 不要把任何 key 粘贴到 GitHub issue、README、聊天截图或提交记录里。

## 8. 部署 Vercel

1. 环境变量填完后，点击 `Deploy`。
2. 等待 build 完成。
3. 打开 Vercel 给出的 URL。
4. 先访问首页、发现页、详情页，确认页面能打开。

如果部署失败，优先看 Vercel 的 `Build Logs`：

- 如果是 TypeScript/build 报错，先回本地运行 `npm run check` 和 `npm run build`。
- 如果是 API 运行时报错，检查环境变量名字是否完全一致。

## 9. 验证 API 是否真的走 Supabase

拿到 Vercel URL 后，在本地终端运行：

```bash
API_BASE_URL='https://你的-vercel-url.vercel.app' EXPECT_API_SOURCE=supabase npm run smoke:api
```

成功时应该看到类似：

```json
{
  "restaurants": { "status": 200, "source": "supabase" },
  "detail": { "status": 200, "source": "supabase" },
  "today": { "status": 200, "source": "supabase" }
}
```

如果看到 `source=seed`：

- 检查 Vercel 是否配置了 `SUPABASE_URL`、`SUPABASE_ANON_KEY`、`SUPABASE_SERVICE_ROLE_KEY`。
- 检查变量是否应用到了当前部署环境。
- 修改环境变量后需要 Redeploy。
- 如果 `SUPABASE_DISABLE_FALLBACK=true`，正常情况下数据库错误会暴露为 500，不应静默回 seed。

## 10. 配置邮箱验证码模板

为了避免校园邮箱点击 Supabase 外链时被拦截，建议把 Magic Link 邮件改成验证码邮件。

Supabase Dashboard:

```text
Authentication -> Email Templates -> Magic Link
```

Subject:

```text
食在浙大登录验证码：{{ .Token }}
```

Body 可使用仓库文档：

```text
docs/SUPABASE_OTP_EMAIL_TEMPLATE.md
```

关键点是邮件正文必须包含 `{{ .Token }}`，这样用户能复制 6 位验证码到 `/profile` 登录。

## 11. 验证登录和 UGC

1. 打开 Vercel URL 的 `/profile`。
2. 输入邮箱，点击发送验证码。
3. 从邮件中复制 6 位验证码，不需要点击 Supabase 外链。
4. 回到 `/profile`，确认能看到当前账号。
5. 点击同步偏好、推送本地收藏、拉取云端收藏。
6. 如果邮箱属于允许域名，点击验证校园邮箱，到 Supabase `Table Editor -> user_trust` 确认 `campus_email_verified=true`。
7. 打开 `/contribute`，提交一条餐厅或纠错内容。
8. 到 Supabase `Table Editor -> submissions`，确认有一条 `status=pending` 的记录。

## 12. 创建第一个管理员

1. 用你的邮箱在 `/profile` 登录一次。
2. 在 Supabase `Authentication -> Users` 找到你的用户，复制 UUID。
3. 打开 `SQL Editor -> New query`。
4. 执行下面 SQL，把 UUID 换成你的用户 ID：

```sql
insert into public.admin_users (user_id, role)
values ('00000000-0000-0000-0000-000000000000', 'admin')
on conflict (user_id) do update set role = excluded.role;
```

5. 回到 Vercel URL 的 `/admin`。
6. 点击读取队列。
7. 对刚才提交的内容点击通过或拒绝。
8. 到 Supabase `audit_logs` 表确认有审计记录。

## 13. 常见问题排查

| 问题 | 可能原因 | 处理方式 |
| --- | --- | --- |
| 页面能打开，但 API 返回 `source=seed` | Vercel env 没配或没重新部署 | 配 env 后 Redeploy，再跑 smoke |
| Magic link 点开回不到网站 | 校园邮箱/网络拦截 Supabase 外链 | 使用邮箱验证码登录；确认 Magic Link 模板包含 `{{ .Token }}` |
| 邮件里没有 6 位验证码 | Magic Link 邮件模板没配置 `{{ .Token }}` | 按第 10 步修改模板 |
| `/contribute` 提交失败 `Please sign in first` | 没登录或 session 失效 | 重新登录 |
| `/admin` 返回 `Admin access required` | 当前用户不在 `admin_users` | 按第 11 步插入管理员 |
| `/admin` 审核失败 | audit_logs insert policy 缺失或 migration 没执行最新版本 | 重新确认 migration 是否包含 `admins can insert audit logs` |
| Vercel build 失败 | 依赖安装或 TypeScript 问题 | 本地先跑 `npm run check && npm run build` |
| Supabase SQL Editor 执行 seed 失败 | SQL 太长、网络中断或部分表未创建 | 先执行 migration，再重跑 seed；必要时用 `npm run supabase:apply:seed` |

## 14. 官方参考

- Supabase database connection：<https://supabase.com/docs/guides/database/connecting-to-postgres>
- Supabase API keys：<https://supabase.com/docs/guides/getting-started/api-keys>
- Supabase Auth redirect URLs：<https://supabase.com/docs/guides/auth/redirect-urls>
- Vercel Git deployments：<https://vercel.com/docs/git>
- Vercel environment variables：<https://vercel.com/docs/environment-variables>
