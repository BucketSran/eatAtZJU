# 食在浙大策略风险登记册

## 信心声明

我不能诚实地声称对任何早期产品策略有数学意义上的 100% 信心。更可靠的目标是：

- 已知高风险项都有明确缓解措施。
- 剩余风险都被显式记录，不假装不存在。
- 每次进入下一阶段前都有可验证的退出条件。
- 工具和 MCP 用来提升开发/运营效率，但不成为产品运行时的隐形依赖。

因此，本登记册把“事实上的 100% 信心”定义为：当前阶段内没有未处理的 P0/P1 风险，P2/P3 风险都有 owner、触发条件和下一步动作。

## 风险等级

- P0：会导致产品不能上线、数据/账号泄露、违法违规或严重破坏用户信任。
- P1：会导致核心路径不可用、审核失败、数据污染或开发流程明显失控。
- P2：会降低体验、增加运营成本或影响推荐质量，但可局部绕开。
- P3：可接受的早期不完美，记录即可。

## 已识别漏洞与修复措施

| 编号 | 风险 | 等级 | 漏洞说明 | 修复措施 | 当前状态 |
| --- | --- | --- | --- | --- | --- |
| R01 | MCP 边界不清 | P1 | MCP/插件不能直接作为产品运行时能力。如果把 MCP 当客户端依赖，产品会不可发布。 | 明确 MCP 只用于开发、测试、数据整理、后台运营。运行时只调用 Vercel API、Supabase 前端安全能力或后端 API。 | 已缓解：写入技术路线 |
| R02 | GitHub CLI token 失效 | P2 | `gh auth status` 显示 token 失效，后续创建 issue/PR/查 CI 会受阻。 | 需要重新执行 `gh auth login -h github.com`。当前 `git push` 已可用。 | 待处理 |
| R03 | UGC 数据可信度不足 | P0 | 如果没有实名/校园身份、审核和反作弊，餐厅评分会被刷、被商家操纵或被恶意污染。 | 微信登录 + 校园邮箱验证 + submissions 审核队列 + 贡献信用 + 异常检测。 | 规划中 |
| R04 | 抓取/搬运学生内容合规风险 | P0 | 论坛、贴吧、小红书、微信群等内容不应未经授权直接复制，尤其是图片、昵称和原文评论。 | 初始数据只能人工整理为摘要标签和事实字段；图片/评论需授权或用户自行提交。 | 新增约束 |
| R05 | 隐私与定位权限风险 | P0 | 地图定位、用户偏好、收藏、打卡均属于个人行为数据。 | 上线前补隐私政策、权限弹窗说明、最小化采集、删除/导出机制。 | 规划中 |
| R06 | 微信内容安全缺失 | P0 | 评论、图片、餐厅名、菜品名都可能包含违规内容。 | 所有 UGC 先调用微信内容安全接口，再进入人工/社区审核。 | 规划中 |
| R07 | Supabase RLS/权限过宽 | P0 | 如果 RLS 策略或 service-role key 使用错误，用户可能读写他人数据或绕过审核。 | 默认最小权限；用户私有数据启用 RLS；service-role key 仅在 Vercel 服务端环境变量；管理员能力独立鉴权和审计。 | 规划中 |
| R08 | 管理员滥用或误审 | P1 | 审核台如果没有日志和回滚，错误审核会污染数据。 | 审核动作写 `audit_logs`；保留 payload 快照；支持撤回和二次复核。 | 新增约束 |
| R09 | 餐厅重复和实体合并 | P1 | 同一家店可能多个名字、分店、搬迁，导致评分分裂。 | 增加 canonicalName、aliases、sourceRefs、mergeHistory。 | 规划中 |
| R10 | 推荐算法被刷 | P1 | 打卡量、评分、收藏都可能被小号刷高。 | 引入身份权重、时间衰减、异常行为限制、同设备/同 openid 限频。 | 规划中 |
| R11 | 冷启动数据太少 | P2 | 初期只有少数 mock 数据，推荐看起来聪明但证据不足。 | 种子数据达到每个主要区域至少 20 家，且每家有标签、人均、菜品、来源备注。 | 待处理 |
| R12 | Mock 到 Supabase 迁移不够平滑 | P1 | 如果页面直接依赖本地数据结构，迁移 Supabase/Vercel Functions 时会大改前端。 | 保持服务层/repository 为唯一数据入口，增加 mock/api 双模式。 | 部分缓解 |
| R13 | 无自动检查 | P1 | 现在只能人工打开开发者工具，低级语法/数据错误容易漏。 | 新增 `npm run check` 和 GitHub Actions，检查 JS、JSON、服务层和数据基础不变量。 | 已缓解 |
| R14 | 发布配置风险 | P1 | 小程序 `touristappid`、Vercel env、Supabase keys、source map、域名和隐私配置都可能在发布前出错。 | 发布前必须复核 Vercel production env、Supabase anon/service-role key、域名、source map 和隐私策略。 | 新增约束 |
| R15 | 图片版权与肖像权 | P0 | 打卡图可能包含他人脸部、商家素材或平台水印。 | 用户授权声明、图片内容安全、必要时打码、投诉删除入口。 | 规划中 |
| R16 | 校园邮箱验证被滥用 | P1 | 邮箱验证码可被撞库、频繁请求或转让账号。 | 限频、验证码过期、设备风险控制、绑定微信 openid。 | 规划中 |
| R17 | 成本失控 | P2 | 图片存储、Vercel Functions 调用、Supabase 用量、AI 推荐理由生成都可能带来成本。 | 设置预算告警、限流、缓存、AI 只在后端异步生成。 | 规划中 |
| R18 | MCP/外部工具可用性不稳定 | P2 | 插件、connector、CLI token、网络代理都可能失效。 | 所有关键流程保留本地 CLI 或手工 fallback，不把 MCP 作为唯一路径。 | 已记录 |
| R19 | 缺少 GitHub issue/PR 规范 | P2 | 迭代多了以后上下文会散，vibecoding 容易变成漂流瓶。 | 增加 bug、feature、data、risk issue 模板，以及 PR checklist。 | 已缓解 |
| R20 | 无真实用户验证 | P1 | 功能看起来完整，但可能不解决学生真实选择困难。 | 10-20 人内测，记录“是否真的帮你决定吃什么”和失败原因。 | 待处理 |
| R21 | 从小程序切到 Web/PWA 影响传播路径 | P1 | 浙大学生天然更熟悉微信分享，小程序转 Web/PWA 可能降低微信内打开体验。 | Web/PWA 先验证产品，保留小程序原型；如内测证明微信入口关键，再用同一 Supabase 后端恢复小程序客户端。 | 新增约束 |
| R22 | Vercel Functions 不适合长任务 | P2 | 批量抓取、数据清洗和重 AI 任务可能超出 serverless 请求模型。 | 长任务改为离线脚本、Supabase scheduled jobs、队列或专门 worker，不阻塞用户请求。 | 新增约束 |
| R23 | SPA fallback 误吞 API 路由 | P1 | React Router 需要 fallback 到 `index.html`，但错误 rewrites 可能把 `/api/*` 也重写成前端页面。 | `vercel.json` 使用 negative lookahead，仅非 `/api/` 路径 fallback；新增 API 后必须用 Vercel preview 验证。 | 已缓解 |
| R24 | 前端骨架与真实数据路径脱节 | P1 | 如果 UI 继续用占位数据，后续接 API/Supabase 会返工。 | 已新增 schema-versioned seed、typed domain models、seed repository，并将下一阶段锁定为服务/API 边界。 | 已缓解 |
| R25 | 前后端 demo 规则重复 | P2 | 前端 TypeScript 服务和 Vercel CJS API 共享同一批 seed，但筛选/推荐规则各有实现，长期可能漂移。 | 当前用 `npm run check` 覆盖 API 服务入口；接 Supabase 前应抽出共享领域规则或增加前后端契约测试。 | 已记录 |
| R26 | 用户资料字段可被自提权 | P0 | 如果 `profiles` 同时保存 role、校园认证、信用分，并允许用户更新自己的 profile，用户可能把自己改成管理员或高信用。 | 将用户可编辑字段限定在 `profiles`；管理员身份放 `admin_users`，校园认证和信用分放 `user_trust`，写入走 service-role/管理员流程。 | 已缓解：写入 Supabase 迁移 |
| R27 | Supabase seed 与 JSON 漂移 | P1 | 如果 seed SQL 手写且不检查，demo JSON 和 Supabase 数据会不一致。 | 新增 `scripts/generate-supabase-seed.cjs`，`npm run check` 校验 `supabase/seed.sql` 是否由当前 JSON 生成。 | 已缓解 |
| R28 | Supabase 迁移尚未真实执行 | P2 | 当前已有版本化 SQL，但还没在真实 Supabase project/local stack 上跑迁移。 | 下一阶段使用 Supabase CLI 或 Dashboard 执行迁移，并补实际 SQL smoke test。 | 待处理 |
| R29 | service-role 绕过 RLS 泄露未发布内容 | P0 | Vercel API 如果使用 service-role key，RLS 不会拦截草稿/未审核数据。 | Supabase repository 显式过滤 `restaurants.status='published'`、`dishes.status='published'`、`reviews.status='approved'`。 | 已缓解 |
| R30 | seed fallback 掩盖生产后端问题 | P1 | 如果 Supabase 已配置但 API 总是回退 seed，可能掩盖空库、迁移失败或线上错误。 | 仅在未配置或 Supabase 请求异常时 fallback；空结果不 fallback；提供 `SUPABASE_DISABLE_FALLBACK=true` 用于 staging/production。 | 已缓解 |
| R31 | API 路由参数缺少边界校验 | P1 | 动态餐厅 ID 或推荐 strategy 如果直接进入查询，可能带来异常、日志污染或未来 SQL/SDK 查询风险。 | 新增 `requestValidation.cjs`，餐厅 ID 和推荐 strategy 采用白名单校验，无效输入返回 400。 | 已缓解 |
| R32 | 缺少真实部署凭证 | P1 | 没有 Supabase/Vercel 凭证时无法事实验证远端 migration、seed 和 preview。 | 新增 `scripts/apply-supabase.cjs`、`scripts/smoke-api.cjs` 和部署运行手册；待提供凭证后执行。 | 待处理 |
| R33 | 手动执行 migration 后脚本重复执行失败 | P2 | 如果已在 Dashboard 手动粘贴 SQL，但没有 migration record，脚本再跑可能遇到 trigger 已存在。 | 运行手册要求优先在干净 project 用脚本执行，或手动补 `app_private.schema_migrations` 记录。 | 已记录 |
| R34 | 前端仍停留在本地 seed | P1 | 即使 API 已接 Supabase，如果 React 页面继续直接读 seed，真实数据库数据不会展示。 | 新增浏览器 API client，核心页面优先调用 `/api/*`，失败才回退本地 seed。 | 已缓解 |
| R35 | 前端 fallback 掩盖 Supabase 404 | P1 | 如果真实 Supabase 明确返回 404，前端再用本地 seed 展示会掩盖空库或缺失数据。 | `source=supabase` 的 404 被视为权威缺失，不回退本地 seed。 | 已缓解 |
| R36 | 服务端 bearer 校验后丢失 RLS 用户上下文 | P1 | 如果校验 token 后仍用普通 anon client 查数据库，`auth.uid()` 为空，会导致提交/审核线上失败。 | 新增 user-scoped Supabase client；无 service-role 时用 anon key + bearer JWT 触发 RLS。 | 已缓解 |
| R37 | 首次登录覆盖云端偏好 | P2 | 如果登录后直接 upsert 本地偏好，可能覆盖用户已有云端资料。 | `ensureProfile` 先查询 profile；存在则拉取云端偏好，不自动覆盖。 | 已缓解 |
| R38 | 管理员审核缺少审计写权限 | P1 | RLS 只有 audit log read policy 时，anon/user-scoped 管理员无法写审计日志。 | 增加 `admins can insert audit logs` policy，并纳入 `npm run check`。 | 已缓解 |
| R39 | 线上登录/提交链路尚未远端实测 | P1 | 本地代码已接 Auth/UGC/Admin，但没有真实 Supabase/Vercel env，无法确认邮件回调、RLS、Vercel env 和远端 API。 | 提供真实凭证后执行 migration/seed、配置 Auth redirect、创建管理员、跑远端 smoke test。 | 待处理 |
| R40 | 校园邮箱认证被用户自提权 | P0 | 如果前端直接更新 `user_trust`，用户可把自己标成已验证，破坏学生可信机制。 | `user_trust` 只允许用户读取；校园邮箱验证通过 `/api/auth/campus-verify` 服务端 service-role 写入。 | 已缓解 |
| R41 | 自动审批污染正式数据且无法回退 | P0 | 如果自动审批直接写 `restaurants/dishes/reviews`，错误或恶意内容可能长期污染榜单和推荐。 | 新增审计日志回滚 API 和后台入口；未来自动审批必须先写 before/after 快照，再写正式表。 | 已缓解基线 |
| R42 | 大陆网络无法稳定访问 | P0 | 目标用户在浙大和中国大陆网络内；如果 Web 站依赖 Vercel 和浏览器直连 Supabase，可能出现无代理无法打开、登录失败或接口超时。 | 已添加 `eat.bucketsran.fun` 到 Vercel，并记录阿里云 DNS、Supabase redirect、国内云/小程序 fallback；上线前必须用大陆网络实测。 | 处理中 |

## 风险归属约定

- Product owner：用户问题、MVP 范围、内测反馈、发布材料。
- Engineering owner：React/Vercel/Supabase 代码、小程序原型、数据库权限、CI、性能和回滚。
- Data owner：餐厅 seed、标签、数据来源备注、去重合并。
- Trust owner：身份验证、内容安全、隐私、版权、投诉删除、审核规范。

在 GitHub issue 中，凡是标记为 `risk` 或 `compliance` 的任务，默认不能在没有 Trust owner 确认的情况下关闭。

## 阶段准入门槛

### 进入 React/Vercel/Supabase 实现前

- `npm run check` 通过。
- 已确认 ADR-0001 作为主线架构。
- 数据访问仍通过服务层或 repository，不散落在页面里。
- seed 数据结构有 schema version。
- 已决定 Supabase project、Vercel project 和环境变量命名。
- 已设计核心表的 RLS 权限模型。
- 已新增 Supabase 初始迁移和 seed SQL 同步检查。

### 开放 UGC 前

- 微信登录、校园身份验证、内容安全、审核队列全部上线。
- 用户提交不直接写入正式 `restaurants`、`dishes`、`reviews`。
- 审核日志和回滚机制上线。
- 隐私政策、用户协议、投诉删除入口准备好。

### 小范围内测前

- 本地浏览器或 Vercel preview 跑通首页、发现、详情、收藏、偏好。
- API handler 能返回餐厅列表、餐厅详情和今日推荐。
- 登录、收藏同步、UGC submissions 和管理员审核 API 在真实 Supabase/Vercel preview 中至少跑通一次。
- Vercel preview、隐私配置、定位权限说明准备好。
- Demo 阶段至少 20 家 seed 餐厅；小范围内测前至少 80 家授权/可追溯真实种子餐厅，覆盖主要区域和预算段。
- 有反馈表或 issue 收集渠道。

### 正式发布前

- Vercel production env、Supabase keys、域名、source map、隐私策略已复核。
- 大陆网络无代理可访问，或已切换到国内云/微信小程序主入口。
- 内容安全和人工审核可承载预估提交量。
- 数据备份、预算告警和异常监控就位。
- 明确客服/投诉/删除流程。

## 红队循环结论

第一轮策略漏洞较多，但主要是早期项目的正常缺口。经过本轮修复，当前可接受的安全结论是：

- 可以继续沿“React + Vercel + Supabase + MCP 辅助开发/运营”的方向推进。
- 不应在未完成身份、审核、隐私和权限模型前开放真实 UGC。
- 不应把论坛/小红书/微信群内容当作可自由复制的数据源。
- 当前阶段最值得马上做的是：数据 seed 化、mock/api 双模式、React/Vercel/Supabase 骨架、Supabase RLS 权限设计。

架构调整后，当前阶段的策略置信度可以提升到“可继续推进 React/Vercel/Supabase Web/PWA MVP”。当前 React 骨架、seed、类型、CI/build 策略、Vercel API handler、seed-backed UI 纵切、Supabase 初始 schema/RLS 迁移、seed SQL 生成检查、Supabase-first API fallback、前端 API 优先读取和部署执行脚本已经完成闭环；但对“真实 Supabase/Vercel 已部署”“开放真实用户 UGC”和“公开发布”仍不能给出 100% 信心，因为这些阶段依赖尚未提供的 Supabase/Vercel 凭证、真实迁移执行、身份、审核、隐私、内容安全、授权数据和运营能力。
