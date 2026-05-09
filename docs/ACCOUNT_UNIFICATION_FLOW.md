# 账号统一与合并流程

## 目标

一个真实学生账号对应一个 `app_users` 记录，可以同时绑定：

- 一个微信小程序身份：`identity_links.provider = 'wechat_miniapp'`
- 一个 Supabase 邮箱身份：`identity_links.provider = 'supabase_auth'`

微信可以先使用基础功能；绑定浙大邮箱后，账号获得更高可信度，并与 Web 端邮箱登录共享同一份用户名、头像和偏好。

## 当前落地方式

### Web 端资料

Web 端采用 `/api/profile` 作为用户资料唯一写入口：

- 浏览器只持有 Supabase Auth access token。
- Vercel API 校验 token 后，用服务端 Supabase key 创建/修复 `app_users` 与 `identity_links`。
- 用户名、头像、偏好都写入 `app_users`，避免 `profiles` 和 `app_users` 双表状态不一致。
- 头像通过 `/api/profile/avatar` 上传到 Supabase Storage 的 `app-avatars` bucket，Web 端会先尝试压缩到 0.5MB 以内。

### 小程序绑定

1. 小程序用户进入“我的”页，填写浙大邮箱。
2. 云函数调用 Supabase Auth 发送邮箱验证码。
3. 用户复制邮件里的数字验证码到小程序。
4. 云函数验证验证码，并创建一个 15 分钟有效的 `account_link_codes` 合并令牌。
5. 小程序展示微信账号资料与邮箱账号资料的差异。
6. 用户选择保留微信侧或邮箱侧的用户名、头像；偏好可选择合并、只保留微信、只保留邮箱。
7. 确认后，微信 `openId` 的 `identity_links` 会指向邮箱对应的同一个 `app_users`。

## 冲突处理规则

- 用户名：默认保留非默认昵称；否则保留邮箱侧。
- 头像：默认保留非默认头像；否则保留邮箱侧。
- 偏好：默认合并两边，并最多保留 20 个标签。

## 安全边界

- 合并令牌只保存哈希价值很低的短码，并且 15 分钟过期。
- 令牌只能由生成它的微信账号消费。
- 合并动作在 CloudBase 云函数里执行，使用服务端 Supabase key；浏览器和小程序端不会拿到服务端密钥。
- 浙大邮箱域名目前限制为 `zju.edu.cn`、`st.zju.edu.cn`、`intl.zju.edu.cn`，可用 `CAMPUS_EMAIL_DOMAINS` 环境变量扩展。

## 后续建议

- 将收藏表从 `auth.users.id` 迁移到 `app_users.id`，让收藏也天然跨 Web 与小程序同步。
- 给评论、打卡、投稿增加 `app_user_id`，替代只使用 `auth.users.id`。
- 在 Web 端显示已绑定身份：邮箱、微信、校园邮箱可信状态。
