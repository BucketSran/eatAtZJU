# Campus WiFi Access Plan

## 背景

现象：同一套账号与线上站点，在手机流量下可以登录，但在浙大校园 WiFi 下无法打开或无法完成登录。

这类问题优先按网络链路处理，而不是先假设业务代码损坏。当前 Web 入口托管在 Vercel，数据库、认证与头像存储托管在 Supabase。二者在中国大陆和校园网环境下都可能受 DNS、IPv6、出口路由、代理策略或网关策略影响。

## 当前判断

已知事实：

- `eat-at-zju.vercel.app` 是 Vercel 域名。
- `eat.bucketsran.fun` 是自定义域名，但仍指向 Vercel。
- `thzyquhyeefiztcwgaph.supabase.co` 指向 Supabase/Cloudflare。
- 手机流量可登录，说明账号、Supabase Auth、前端登录主流程大概率正常。
- 校园 WiFi 无法打开，更像是校园网到 Vercel/Supabase 的链路问题。

因此，只把域名从 `vercel.app` 换成 `bucketsran.fun` 不能保证解决。如果学校网络限制的是 Vercel IP、Cloudflare/Supabase 链路或境外出口，自定义域名仍会失败。

## 一键诊断

在出现问题的网络下运行：

```bash
npm run net:campus
```

该脚本会检查：

- Vercel 默认域名
- 自定义域名
- Vercel API
- Supabase Auth health
- IPv4/IPv6 连通性
- DNS A/AAAA/CNAME 解析

判断方式：

- Vercel 与自定义域名都失败：优先怀疑 Vercel/IP/境外出口被校园网限制。
- Vercel 失败但自定义域名成功：优先使用 `eat.bucketsran.fun`，并在产品里主推该域名。
- 页面能打开但登录失败：优先怀疑浏览器直连 Supabase Auth/Storage 失败。
- IPv4 成功 IPv6 失败，或反过来：优先排查校园网 IPv6/IPv4 出口策略。

## 推荐解决策略

### 阶段 1：低成本验证

目标：确认到底是域名问题、Vercel 问题，还是 Supabase 问题。

1. 在校园 WiFi 下分别访问：
   - `https://eat.bucketsran.fun`
   - `https://eat-at-zju.vercel.app`
2. 在校园 WiFi 下运行 `npm run net:campus`。
3. 如果只有 `vercel.app` 失败，自定义域名成功，后续所有公开传播使用 `eat.bucketsran.fun`。

### 阶段 2：国内入口

目标：让中国大陆用户不需要直连 Vercel。

推荐使用腾讯云开发 CloudBase 或微信云开发：

- 静态 Web/PWA 部署到 CloudBase Web Hosting。
- API 通过 `eatAtZjuApi` 云函数访问 Supabase。
- 浏览器只访问腾讯云开发域名，不直接访问 Vercel。

这样可以复用已有的 `cloudfunctions/eatAtZjuApi`，降低迁移成本。

### 阶段 3：认证去直连 Supabase

目标：解决“页面能打开但登录失败”。

当前 Web 端仍使用 Supabase Browser Client。若校园 WiFi 无法访问 Supabase，登录、资料、头像、收藏同步可能失败。

更稳的方案：

- 国内入口调用 CloudBase 云函数发送邮箱 OTP。
- 云函数服务端调用 Supabase Auth。
- 用户输入验证码后，云函数服务端验证 OTP 并返回应用侧会话或短期绑定令牌。
- 前端后续调用国内 API 网关，不直接调用 Supabase。

微信小程序路径已经部分具备类似能力：

- `sendCampusEmailOtp`
- `verifyCampusEmailOtp`
- `confirmCampusEmailBind`

后续可以把这套能力抽成 Web 也能使用的国内认证网关。

### 阶段 4：主库策略

目标：避免国内网关到 Supabase 的服务端出口也不稳定。

两种路线：

- Supabase 仍为主库：CloudBase 云函数只是 API 网关。
- 国内数据库为主库：CloudBase/TencentDB 存用户与 UGC，Supabase 只做海外/后台镜像。

MVP 阶段建议先用“CloudBase 网关 + Supabase 主库”，因为数据库一致性成本最低。

## 不能做的事

- 不要把 Supabase service role key 暴露到浏览器。
- 不要只靠换域名判断问题解决。
- 不要同时维护两套独立主库而没有同步/回滚策略。
- 不要把登录 magic link 作为校园网唯一登录方案，校园邮箱网关和 Supabase 链路都可能拦截。

## 事实上的信心边界

对“手机流量可登录，校园 WiFi 不可打开”的根因判断，我对 Vercel/Supabase 境外链路或校园网策略问题有高信心。

但在拿到校园 WiFi 下的 `npm run net:campus` 输出前，不能 100% 区分：

- DNS 污染
- IPv6 路由问题
- Vercel IP 不通
- Supabase/Cloudflare 不通
- 校园认证网关/安全策略
- 用户设备代理或浏览器缓存

所以真正稳妥的最终解不是“继续调 Vercel”，而是增加国内入口。
