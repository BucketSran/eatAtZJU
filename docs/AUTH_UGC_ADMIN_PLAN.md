# Auth, UGC, and Admin Integration

日期：2026-05-08

## 本轮目标

把真实线上数据库和部署前必须有的“用户链路”先接成可落地骨架：

- Supabase Auth 邮箱 magic link 登录。
- 服务端校园邮箱验证，写入 `user_trust.campus_email_verified`。
- 用户偏好写入 `profiles.preferences`。
- 本地收藏与 Supabase `favorites` 双向同步。
- 学生贡献进入 `submissions` 审核队列。
- 管理员读取 pending submissions 并 approve/reject。
- 审核动作写入 `audit_logs`。

## 已新增页面

| 页面 | 路径 | 说明 |
| --- | --- | --- |
| 我的 | `/profile` | 登录、同步偏好、推送/拉取收藏 |
| 贡献 | `/contribute` | 登录后提交餐厅/评论/纠错资料 |
| 审核后台 | `/admin` | 管理员读取并处理待审核提交 |

## 已新增 API

| API | 方法 | 权限 | 说明 |
| --- | --- | --- | --- |
| `/api/submissions` | `POST` | 登录用户 | 写入 pending submission |
| `/api/auth/campus-verify` | `POST` | 登录用户 | 验证当前 Auth 邮箱是否属于校园邮箱域，并写入 `user_trust` |
| `/api/admin/submissions` | `GET` | `admin_users` 管理员 | 读取待审核队列 |
| `/api/admin/submissions` | `POST` | `admin_users` 管理员 | approve/reject 并写审计日志 |

## 环境变量

浏览器端登录需要：

```bash
VITE_SUPABASE_URL=
VITE_SUPABASE_ANON_KEY=
```

服务端 API 需要：

```bash
SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
CAMPUS_EMAIL_DOMAINS=zju.edu.cn,st.zju.edu.cn,intl.zju.edu.cn
```

`SUPABASE_SERVICE_ROLE_KEY` 只能放在 Vercel 服务端环境变量，不能使用 `VITE_` 前缀。
`CAMPUS_EMAIL_DOMAINS` 是可选项，不配置时默认允许 `zju.edu.cn`、`st.zju.edu.cn`、`intl.zju.edu.cn`。如需允许所有浙大子域名，可设置为 `zju.edu.cn,*.zju.edu.cn`。

## 管理员启用方式

1. 用户先通过 `/profile` 登录一次，让 Supabase Auth 生成用户。
2. 在 Supabase Dashboard 查询该用户 UUID。
3. 执行：

```sql
insert into public.admin_users (user_id, role)
values ('00000000-0000-0000-0000-000000000000', 'admin')
on conflict (user_id) do update set role = excluded.role;
```

4. 用同一账号打开 `/admin`，点击读取队列。

## 红队修复记录

| 风险 | 修复 |
| --- | --- |
| 登录后首次同步覆盖云端偏好 | `ensureProfile` 先读取已有 profile；存在则拉取云端偏好，不自动覆盖 |
| bearer token 校验后数据库操作缺少用户上下文 | 新增 user-scoped Supabase client；无 service-role 时用 anon key + `Authorization: Bearer <jwt>` 触发 RLS |
| 管理员审核没有审计写入权限 | RLS 增加 `admins can insert audit logs` policy |
| UGC 直接公开污染正式数据 | `/api/submissions` 只写 `pending`，不直接改餐厅/菜品/评论正式表 |
| 未配置 Supabase 时页面误报成功 | 前端明确显示未配置状态，API 未登录/未配置返回 401/503 |
| 用户自提权成为校园认证用户 | `user_trust` 不开放用户写入，校园邮箱验证只走服务端 service-role API |

## 当前边界

这已经是可接真实 Supabase/Vercel 的代码骨架，但还没有事实完成线上部署。要真正上线，还需要：

- 创建 Supabase project。
- 执行 migration 和 seed。
- 在 Vercel 配置环境变量。
- 配置 Supabase Auth 邮件重定向 URL。
- 创建第一个管理员账号。
- 跑远端 smoke test。
