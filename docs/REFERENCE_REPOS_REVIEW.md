# Reference Repos Review

## Search Goal

Before starting implementation, we searched GitHub for high-star repositories related to:

- Vibe coding / AI-assisted app building.
- From-zero-to-product AI coding workflows.
- React + Supabase + Vercel starters.
- WeChat mini-program templates and ecosystem references.

Selection rule: prioritize repositories with more than 500 stars and extract reusable process/design lessons, not copy their stack blindly.

## Shortlist

| Repo | Stars at search time | Why it matters | What we learn |
| --- | ---: | --- | --- |
| `shanraisshan/claude-code-best-practice` | 51.7k | Large Claude Code best-practice repo; includes memory, commands, agents, hooks, MCP concepts. | Keep project memory, commands, MCP boundaries, and orchestration rules explicit. |
| `coleam00/context-engineering-intro` | 13.3k | Frames context engineering as the disciplined replacement for loose vibe coding. | Treat specs, examples, constraints, and validation as first-class inputs. |
| `datawhalechina/vibe-vibe` | 4.9k | Chinese systematic vibe coding tutorial from idea to product. | Make the path beginner/reviewer friendly: idea -> spec -> implementation -> deploy -> review. |
| `cloudflare/vibesdk` | 5k | Full-stack AI app generator platform; strong example of productized AI coding workflow. | Separate AI generation/runtime infra from product app runtime; keep deploy and customization story clear. |
| `dyad-sh/dyad` | 20.3k | Local open-source AI app builder with `.agents`, `.claude`, `.cursor`, docs, e2e tests. | Maintain explicit agent rules and testable workflows; local-first development still needs structure. |
| `get-convex/chef` | 4.6k | AI app builder that emphasizes backend awareness. | Our AI workflow must understand data model/API boundaries, not just generate UI. |
| `imbhargav5/nextbase-nextjs-supabase-starter` | 784 | Supabase + Vercel-oriented starter with env examples, type generation, unit/integration/e2e testing. | Add env examples, typed data access, Supabase schema workflow, build/test pipeline. |
| `justjavac/awesome-wechat-weapp` | 50.9k | WeChat mini-program ecosystem resource list. | Keep mini-program ecosystem as fallback/reference; Taro/uni-app/Remax can matter if WeChat entry becomes critical. |
| `Tencent/tdesign-miniprogram` | 1.6k | Mature WeChat MiniProgram/Uniapp UI component library. | If we revive mini-program client, use a proven component system rather than hand-rolling everything. |
| `Tencent/tdesign-miniprogram-starter-retail` | 807 | Retail mini-program template from TDesign. | Food/retail discovery patterns can inspire list/detail/cart-like flows, but not our Web UI directly. |

## Key Lessons for eatAtZJU

### 1. Treat Context as Product Infrastructure

High-quality AI coding repos do not rely on a single prompt. They keep durable context in files:

- `AGENTS.md`.
- `CLAUDE.md`.
- Tool/MCP rules.
- Specs and ADRs.
- Review checklists.

We already added these. Next step is to keep implementation changes aligned with them.

### 2. Keep Demo Scope Brutally Small

Vibe coding works best when the first deployable scope is small:

- Browse.
- Filter/search.
- Detail.
- Favorite.
- Random recommendation.

Do not add login, UGC, image upload, admin, or social features before the first demo link works.

### 3. Backend Awareness Is Non-Optional

AI app builders often look UI-first, but good ones include backend constraints. For us:

- Data access must live behind services/repositories.
- Vercel Functions define server-side boundaries.
- Supabase RLS is a product safety feature, not an afterthought.
- Seed data should match the eventual schema.

### 4. Add Environment and Type Discipline Early

From Supabase/Vercel starters, we should add early:

- `.env.example`.
- No committed `.env`.
- Typed restaurant/dish/review models.
- Build/test scripts.
- CI runs `check` and `build`.

### 5. Use MCP for Workflow, Not Runtime

Reference repos with MCP/agents reinforce our current rule:

- MCP can help with GitHub, browser inspection, docs, seed data, and official docs lookup.
- MCP credentials and tools must never become part of product runtime.

### 6. Preserve WeChat as a Strategic Option

Even if React/PWA is the demo mainline, WeChat remains important for Chinese campus distribution:

- Keep current mini-program prototype.
- If PWA adoption is weak, use Supabase as shared backend and revive mini-program client.
- Learn from TDesign mini-program patterns if/when that happens.

## Changes to Our Plan

Based on this review, Demo v0.1 should add these implementation requirements:

1. Add `.env.example` before any Supabase/Vercel env integration.
2. Add typed domain models before React UI grows.
3. Convert mock data to schema-versioned seed JSON before API work expands.
4. Add `npm run build` to CI as soon as React skeleton exists.
5. Add Browser Use inspection after local React dev server works.
6. Keep all Vercel/Supabase secrets server-only.
7. Do not open UGC until RLS, submissions, moderation, and audit logs are ready.

## Repos Not Directly Adopted

We are not cloning or basing the project on any reviewed repo because:

- AI app builders are too broad for a focused campus food app.
- Next.js/Supabase starters are useful, but our accepted stack is Vite + Vercel Functions rather than Next.js.
- WeChat templates are useful if we revive mini-program production work, but current demo is Web/PWA.

## Source Links

- https://github.com/shanraisshan/claude-code-best-practice
- https://github.com/coleam00/context-engineering-intro
- https://github.com/datawhalechina/vibe-vibe
- https://github.com/cloudflare/vibesdk
- https://github.com/dyad-sh/dyad
- https://github.com/get-convex/chef
- https://github.com/imbhargav5/nextbase-nextjs-supabase-starter
- https://github.com/justjavac/awesome-wechat-weapp
- https://github.com/Tencent/tdesign-miniprogram
- https://github.com/Tencent/tdesign-miniprogram-starter-retail
