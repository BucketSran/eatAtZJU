# Domain Docs

How the mattpocock engineering skills should consume this repo's domain documentation when exploring the codebase.

## Layout

This is a **single-context** repository for 食在浙大 / eatAtZJU. The current target architecture is a React + TypeScript + Vite frontend, Vercel Serverless Functions under `api/`, and Supabase for database/auth/storage. The WeChat mini-program files remain as prototype/reference assets until the Web/PWA path reaches feature parity.

## Before exploring, read these

For non-trivial product or architecture work, read:

1. `AGENTS.md` — project overview, commands, security rules, and workflow requirements.
2. `CLAUDE.md` — local project memory and current technical goal.
3. `docs/DEMO_PLAN.md` — v0.1 demo scope and acceptance criteria.
4. `docs/UI_STYLE_GUIDE.md` — product visual language and component style.
5. `docs/FEATURE_REGISTRY.md` and `docs/FEATURE_WORKFLOW.md` — feature/bug/data/ops tracking rules.
6. `docs/MCP_USAGE_PLAN.md` and `docs/MCP_INTEGRATION_MATRIX.md` — tool/provider boundaries.
7. `docs/ROADMAP.md` and `docs/WORKPLAN.md` — milestone and active work context.

For architecture decisions, read:

- `docs/ADR-*.md` — this repo currently stores ADRs directly in `docs/` instead of `docs/adr/`.
- If a future `docs/adr/` directory or root `CONTEXT.md` / `CONTEXT-MAP.md` appears, read the relevant files as well.

If any optional context files don't exist, proceed silently. Don't suggest creating them upfront unless the task is specifically about documentation structure or unresolved domain language.

## Use the project's vocabulary

Product-facing language should remain warm, practical, student-focused, and trustworthy. Prefer the existing project terms:

- 食在浙大
- 校园美食发现与分享平台
- 餐厅 / 推荐菜 / 收藏 / 排行榜 / 投稿 / 审核
- Web/PWA path for the current implementation direction
- WeChat mini-program prototype for the legacy/reference implementation

When output names a domain concept in an issue title, PRD, diagnosis, refactor plan, test name, or ADR, use the vocabulary from the project docs instead of inventing synonyms.

## Flag ADR conflicts

If a recommendation contradicts an existing ADR or security rule, surface it explicitly and explain why reopening the decision might be worth it. Do not silently override decisions about Supabase RLS, UGC moderation, service-role key secrecy, or Vercel deployment boundaries.
