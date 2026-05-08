# 食在浙大当前工作清单

这份清单用于把项目从当前微信小程序 mock 原型，迁移到 React + Vercel + Supabase 主线，并推进到可测试、可运营、可持续迭代的版本。

## 0. 版本管理与协作基础

- 初始化 Git 仓库并推送到 `BucketSran/eatAtZJU`。
- 保持 `main` 为稳定分支，后续功能用 `feature/*` 或 `codex/*` 分支。
- 每轮迭代保留清晰 commit message 和变更说明。
- 已接入 GitHub Issues 模板、PR checklist 和 Actions sanity check，用于管理功能、Bug、数据任务、合规风险和发布节奏。
- 修复本机 GitHub CLI 认证：执行 `gh auth login -h github.com`，以便后续创建 issue、PR 和检查 CI。
- 用 issue 模板和 PR checklist 承接需求、数据任务和合规事项，避免上下文散落在聊天记录里。

## 1. 当前 MVP 打磨

- Demo v0.1 范围以 `docs/DEMO_PLAN.md` 为准。
- UI 实现必须先对齐 `docs/UI_STYLE_GUIDE.md`，避免通用模板化界面。
- MCP/工具介入以 `docs/MCP_USAGE_PLAN.md` 为准，不进入产品运行时。
- 保留微信小程序原型作为交互参考。
- 在 React 中复刻首页、发现、详情、收藏、我的页面。
- 调整地图、页面间跳转、收藏状态同步和移动端样式。
- 补充更多紫金港周边种子餐厅数据，至少覆盖北门、青芝坞、西园、申花、西溪天街。
- 将 mock 数据从 JS 文件逐步整理成可导入的 JSON seed。
- 每次提交前运行 `npm run check`。
- Web 发布前复核 Vercel env、Supabase anon/service-role key、source map、定位权限和隐私配置。

## 2. React/Vercel/Supabase 接入

- 创建 React + TypeScript + Vite app。
- 创建 Vercel 项目并接入 GitHub preview/production deployment。
- 创建 Supabase project。
- 设计并创建表：`restaurants`、`dishes`、`reviews`、`checkins`、`profiles`、`favorites`、`submissions`、`audit_logs`。
- 增加 Vercel Functions：`GET /api/restaurants`、`GET /api/restaurants/:id`、`POST /api/favorites/toggle`、`POST /api/recommend/today`。
- 将数据访问封装到 service/repository 层，前端组件不直接散落查询逻辑。
- 默认启用 RLS，用户写操作受到 RLS 或 Vercel Function 校验保护。

## 3. 学生可信数据机制

- 增加学生身份认证方案：Supabase Auth + 校园邮箱验证。
- 增加用户提交餐厅、菜品、短评和打卡图的入口。
- 所有 UGC 先进入 `submissions` 审核队列。
- 接入微信内容安全能力审核文本和图片。
- 设计贡献信用机制：高采纳率用户减少审核成本，异常评价进入复核。
- 不直接搬运学生社区原文、图片、昵称或截图；初始数据只保留授权内容、事实字段和摘要标签。
- 增加投诉删除和数据更正流程。

## 4. 推荐与榜单

- 完善规则推荐：距离、预算、评分、打卡量、时间段、偏好标签。
- 增加榜单：本周热吃、30 元以内、夜宵、一人食、适合约饭、爱辣榜。
- 后端生成推荐理由，初期用规则模板，后期可接轻量 AI Agent。
- 记录浏览、收藏、打卡行为，用于持续优化推荐。

## 5. 社交与约饭

- 约饭 MVP：地点、时间、人数、备注、分享卡片。
- 好友动态：收藏、打卡、短评可选择公开。
- 兴趣群：爱辣群、小吃探索群、减脂吃饭群等。
- 先做低成本分享和组队，不急着做复杂 IM。

## 6. 管理后台与 MCP/工具协作

- 使用 GitHub 管理 issue、PR、版本和代码 review。
- 使用表格维护初始餐厅数据，再通过脚本导入云数据库。
- Web/PWA 和 Admin 均可用 Browser Use 做本地页面测试和截图验收。
- 使用 Documents/Spreadsheets 沉淀 PRD、数据字典、审核规范和种子数据表。

## 7. AI 编程工作流

- 使用 `AGENTS.md` 作为项目记忆，保持架构、命令、安全边界和测试方式清晰。
- 非平凡功能先写 spec，再编码。
- 复杂逻辑采用 TDD 或至少先补测试/检查。
- 每个任务明确“不要做什么”，避免 AI 一次性重写过多文件。
- 第三方库集成优先查官方文档，不凭记忆硬写。

## 8. 发布前检查

- Vercel preview 链接可访问。
- 移动端浏览器/PWA 体验检查。
- 核查用户隐私、定位权限、图片上传和内容审核说明。
- 准备产品名称、图标、简介、隐私政策、用户协议和审核材料。
- 做一轮学生小范围内测，收集餐厅缺失、推荐不准、体验卡点。
