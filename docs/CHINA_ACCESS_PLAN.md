# China Access Plan

日期：2026-05-08

## 目标

`食在浙大` 的目标用户主要在中国大陆校园网络环境内。当前 `Vercel + Supabase` 方案适合快速 demo 和海外/代理环境验证，但不能默认认为它满足大陆学生的日常访问要求。

本计划把国内访问拆成三个阶段，先用 `bucketsran.fun` 建立可控入口，再逐步迁移到更适合大陆网络的部署方式。

## 当前状态

- 生产站点：`https://eat-at-zju.vercel.app`
- 计划正式入口：`https://eat.bucketsran.fun`
- Vercel 项目：`eat-at-zju`
- DNS 托管商：阿里云万网 DNS，当前 NS 为 `dns25.hichina.com`、`dns26.hichina.com`
- Vercel 已添加域名：`eat.bucketsran.fun`
- DNS 已配置：`A eat 76.76.21.21`
- 新域名 API 已验证：`/api/restaurants` 返回 `source=supabase`

## 阶段 1：自定义域名接入 Vercel

目的：先让产品拥有可控域名，便于后续切换云厂商、配置备案、更新 Auth redirect。

### 阿里云 DNS 记录

在阿里云 `云解析 DNS -> bucketsran.fun -> 解析设置` 增加：

| 字段 | 值 |
| --- | --- |
| 记录类型 | `A` |
| 主机记录 | `eat` |
| 解析线路 | `默认` |
| 记录值 | `76.76.21.21` |
| TTL | `10 分钟` 或默认值 |

不要暂时修改域名 NS 到 Vercel。修改 NS 会把整个 `bucketsran.fun` 的 DNS 管理权交给 Vercel，影响未来其它子域名和阿里云侧配置。

### 验证命令

```bash
dig +short eat.bucketsran.fun A
npx vercel domains inspect eat.bucketsran.fun
curl -I https://eat.bucketsran.fun
```

期望：

- `dig` 返回 `76.76.21.21`。
- Vercel domain inspect 不再提示 `not configured properly`。
- `curl -I` 返回 200、301、302 或其它 Vercel 可识别响应，不应是 DNS failure。

### Supabase Redirect

DNS 生效后，在 Supabase Dashboard：

```text
Authentication -> URL Configuration
```

把 `Site URL` 改为：

```text
https://eat.bucketsran.fun
```

`Redirect URLs` 至少保留：

```text
http://localhost:5173/**
https://*.vercel.app/**
https://eat-at-zju.vercel.app/**
https://eat.bucketsran.fun/**
```

## 阶段 1 的边界

这个阶段只能解决“正式域名”和“入口可迁移”的问题，不能保证大陆网络稳定访问。

仍可能存在：

- Vercel 边缘网络在部分大陆网络下访问慢或不可达。
- 浏览器端仍会直接请求 `*.supabase.co`，登录、收藏同步和用户资料可能受影响。
- 校园邮箱可能继续提示外链风险，虽然 OTP 登录已经避免必须点击 Supabase 链接。

## 阶段 2：国内可访问 POC

目的：验证真实校园网络下是否可以无代理打开、登录、浏览和提交。

### POC 检查清单

- 浙大校园网或大陆移动网络打开 `https://eat.bucketsran.fun`。
- 首页、发现页、餐厅详情页可加载数据。
- `/profile` 可收取 6 位邮箱验证码并登录。
- `/contribute` 可提交一条待审核内容。
- `/admin` 管理员可读取队列。

### 结论分支

如果全部通过：

- 暂时保留 `Vercel + Supabase` 作为 beta 架构。
- 继续做 UGC、审核、真实数据和自动审批。

如果入口能打开但登录/同步失败：

- 优先把浏览器端 Supabase Auth 改成后端代理或 cookie session。
- 浏览器只访问 `eat.bucketsran.fun` 下的 `/api/*`。

如果入口本身不可达或非常慢：

- 启动阶段 3，迁移静态前端和 API 到国内云。

## 阶段 3：国内云与小程序路线

面向真实浙大学生日常使用，建议把学生端主入口转向微信小程序，Web 站保留为演示、管理后台和运营工具。

候选架构：

| 层 | 推荐方向 |
| --- | --- |
| 学生端 | 微信小程序，作为主入口 |
| Web 管理后台 | React，继续复用当前代码 |
| 前端托管 | 阿里云 OSS/CDN、腾讯云静态网站托管或 CloudBase Hosting |
| API | CloudBase Functions，当前已新增 `eatAtZjuApi` 只读 POC |
| 数据库 | 短中期保留 Supabase 作为唯一事实源；如果 CloudBase -> Supabase 不稳定，再整体迁到国内数据库 |
| 身份 | 微信登录 + 校园邮箱验证 |
| 审核 | 当前 submissions/admin/audit/rollback 模型继续保留 |

## 备案判断

如果使用中国内地服务器或中国内地 CDN 加速，域名需要 ICP 备案。

`bucketsran.fun` 的 `.fun` 后缀在阿里云域名核验材料中属于可核验后缀范围；但备案还取决于实名认证、主体信息、接入服务和各省管局规则。

短期如果继续使用 Vercel 海外服务，不一定要求 ICP 备案，但这不能解决大陆访问稳定性问题。

## 风险循环

### 第 1 轮漏洞

| 漏洞 | 影响 | 修复 |
| --- | --- | --- |
| 只绑定 Vercel 域名，DNS 未配置 | 域名无法访问 | 已拿到 Vercel 要求的 `A eat 76.76.21.21` |
| 修改 NS 给 Vercel | 可能影响整个 `bucketsran.fun` | 当前只建议添加子域名 A 记录，不改 NS |
| Supabase 直连 | 大陆网络登录/同步可能失败 | OTP 已降低邮件外链依赖；后续评估 API 代理或国内云 |
| 未备案直接接入中国内地 CDN | 可能被云厂商阻断 | 阶段 3 前先确认 ICP 备案 |

### 第 1 轮结论

可以推进阶段 1，但不能把它视为最终大陆可访问方案。事实上的信心来自两条 fallback：

- `eat.bucketsran.fun` 可以先指向 Vercel，后续可无感切到国内云。
- 当前业务代码已通过 `/api/*` 和 Supabase repository 分层，迁移后端时不需要推倒 UI。

## 下一步

1. 把 Supabase `Site URL` 和 redirect allowlist 增加 `https://eat.bucketsran.fun/**`。
2. Web 继续作为 demo 和后台，不再作为大陆学生主入口。
3. 按 `docs/CLOUDBASE_MINIPROGRAM_SETUP.md` 部署 CloudBase 小程序只读 POC。
4. 如果 CloudBase 云函数访问 Supabase 稳定，再做微信 openid、收藏和 UGC。
5. 如果 CloudBase 云函数访问 Supabase 不稳定，再整体迁移数据库到国内云，不做长期双写。

## 官方参考

- Vercel domains CLI：<https://vercel.com/docs/cli/domains>
- Vercel add domain：<https://vercel.com/docs/getting-started-with-vercel/domains>
- Supabase custom domains：<https://supabase.com/docs/guides/platform/custom-domains>
- 阿里云 CDN 备案要求：<https://help.aliyun.com/zh/icp-filing/basic-icp-service/product-overview/use-alibaba-cloud-cdn>
- 阿里云域名核验准备：<https://help.aliyun.com/zh/icp-filing/basic-icp-service/user-guide/prepare-and-check-the-domain-name>
