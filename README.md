# 食在浙大 eatAtZJU

浙大学生专属的校园美食发现与分享平台 MVP。当前仓库已有微信小程序原型，用本地 mock 数据跑通核心体验：发现餐厅、筛选搜索、地图点位、详情页、收藏、偏好推荐和随机吃什么。

下一阶段主线采用 AI 友好的 Web/PWA 架构：React + TypeScript + Vite 前端、Vercel Serverless Functions 后端、Supabase 数据库/Auth/Storage、Vercel 部署。现有小程序代码先保留为产品原型和交互参考。

## 当前已实现

- 首页：学生口碑推荐、关键词搜索、口味/预算筛选、随机一餐
- 发现：地图展示紫金港周边餐厅点位，点击 marker 后列表置顶
- 详情：餐厅评分、人均、步行时间、热门菜品、学生短评
- 收藏：本地收藏夹，收藏状态同步到列表和详情页
- 我的：口味偏好配置，影响推荐排序
- 推荐：基于评分、学生可信分、距离、打卡量、偏好标签的规则打分
- Web demo：React 页面已接入 schema-versioned seed，支持首页、发现、详情、收藏和偏好配置
- API demo：Vercel Functions 提供餐厅列表、详情和今日推荐接口

## 目标架构

```text
React + TypeScript + Vite frontend
  -> Vercel Serverless Functions
    -> Supabase Auth
    -> Supabase Postgres with RLS
    -> Supabase Storage
Vercel deploys from GitHub
```

详细决策见：[docs/ADR-0001-react-vercel-supabase.md](/Users/bucketsran/Documents/TsingProject/eatAtZJU/docs/ADR-0001-react-vercel-supabase.md)。

## 如何运行

Web/PWA demo:

```bash
npm install
npm run dev
```

开发服务器默认运行在 `http://localhost:5173`。

生产构建和检查：

```bash
npm run check
npm run build
```

微信小程序原型仍保留，可用微信开发者工具导入当前目录查看。

## 项目结构

```text
index.html / vite.config.ts        React/Vite Web 入口与配置
src/                             React/Vite/TypeScript demo 源码
seed/                            schema-versioned demo seed 数据
api/                             Vercel Serverless Functions demo API
supabase/                         Supabase migrations and generated seed SQL
app.js / app.json / app.wxss      小程序入口与全局样式
components/restaurant-card/       餐厅卡片组件
data/restaurants.js               MVP mock 餐厅数据
services/restaurantService.js      餐厅查询、收藏装饰、地图 marker 服务
utils/recommend.js                规则推荐与筛选逻辑
utils/storage.js                  本地收藏和偏好存储
pages/home/                       首页推荐和筛选
pages/map/                        地图发现页
pages/restaurant/                 餐厅详情页
pages/favorites/                  收藏页
pages/profile/                    我的/偏好页
docs/TECHNICAL_PLAN.md            React/Vercel/Supabase 技术路线
docs/WORKPLAN.md                  当前迭代工作清单
docs/RISK_REGISTER.md             策略漏洞、风险等级和修复门槛
docs/ADR-0001-react-vercel-supabase.md React/Vercel/Supabase 架构决策
docs/VIBE_CODING_GUIDE.md         AI 编程工作流
docs/DEMO_PLAN.md                  Demo v0.1 范围和验收
docs/UI_STYLE_GUIDE.md             Demo UI 风格指南
docs/MCP_USAGE_PLAN.md             MCP/工具介入计划
docs/REFERENCE_REPOS_REVIEW.md     高星参考仓库调研
docs/DEMO_FOUNDATION_REVIEW.md     Demo 地基策略审计
docs/DEMO_API_UI_REVIEW.md         Demo API 与 UI 纵切审计
docs/SUPABASE_SCHEMA_RLS.md       Supabase schema/RLS 设计与审计
docs/SUPABASE_API_INTEGRATION.md  Supabase API 接入与 fallback 策略
docs/DEPLOYMENT_RUNBOOK.md        Supabase/Vercel 部署运行手册
docs/FRONTEND_API_INTEGRATION.md  React 前端 API 接入与 fallback 策略
AGENTS.md                         AI coding agent 项目规则
CLAUDE.md                         Claude Code 项目记忆
docs/CLAUDE_GLOBAL_TEMPLATE.md    全局用户记忆模板，不自动写入 ~/.claude
scripts/check.cjs                 本地 sanity check
scripts/generate-supabase-seed.cjs 从 seed JSON 生成 Supabase seed SQL
scripts/apply-supabase.cjs        执行 Supabase migration/seed
scripts/smoke-api.cjs             验证本地或远端 API 数据来源
.github/                          Issue/PR 模板和 GitHub Actions 检查
```

## 本地检查

```bash
npm run check
```

检查内容包括：

- 所有 JS/CJS 文件语法
- 所有 JSON 配置解析
- TypeScript 类型检查
- 小程序 legacy mock 数据基础不变量
- Web demo seed JSON 的 schemaVersion、关联完整性、评分/价格/经纬度范围
- 服务层筛选、收藏装饰、随机推荐和地图 marker 数量
- Vercel API 共享服务的列表、详情、筛选、推荐和随机入口
- Supabase 初始迁移的 RLS 覆盖和 seed SQL 同步

## 推荐逻辑

当前推荐分数由这些信号组成：

- 餐厅评分 `rating`
- 学生可信分 `studentScore`
- 距离校区远近 `distance`
- 打卡量 `checkins`
- 用户偏好标签命中数

后续可以把推荐规则迁移到 Vercel Functions / Supabase-backed repository，或加入好友推荐、时间段、预算历史等信号。

## 策略安全边界

- MCP/插件只作为开发、测试、数据整理和后台运营辅助，不作为产品运行时依赖。
- 真实 UGC 上线前必须完成身份验证、内容安全、审核队列、隐私政策和数据库权限模型。
- 学生社区内容只能做授权整理和事实摘要，不能直接搬运原文、图片、昵称或受版权保护的素材。
- 前端可以使用 Supabase anon key，但必须依赖严格 RLS；service-role key 和 AI/API 密钥只能放在 Vercel 服务端环境变量。
