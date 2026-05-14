# AGENTS.md

## Project Overview

食在浙大是面向浙大学生的校园美食发现与分享平台。当前仓库已有微信小程序原型，用于验证信息架构和核心交互；下一阶段主线采用 Web/PWA 架构：React 前端、Vercel Serverless Functions 后端、Supabase 数据库、Vercel 部署。

## Target Architecture

- Frontend: React + TypeScript + Vite.
- Backend: Vercel Serverless Functions under `api/`.
- Database/Auth/Storage: Supabase Postgres, Auth, Storage, RLS policies.
- Deployment: Vercel connected to GitHub.
- Prototype assets: current WeChat mini-program pages remain as reference until React migration completes.

## Build and Test Commands

```bash
npm run dev
npm run check
npm run build
npm run preview

```

`npm run lint` and `npm run test` should be added when the React implementation grows beyond the skeleton.

## Code Style Guidelines

- Keep modules small and cohesive. Prefer many focused files over one giant generated file.
- Keep data access behind service/repository functions. UI components must not directly embed database queries unless explicitly designed that way.
- Validate every user input at API boundaries.
- Never expose service-role keys, AI provider keys, or admin credentials to the browser.
- Use TypeScript for new React/Vercel/Supabase code.
- Preserve the existing product language: warm, student-focused, practical, and trustworthy.

## Testing Instructions

- Run `npm run check` and `npm run build` before every commit that changes app code.
- For complex logic, write tests before implementation.
- Add data invariant checks when changing restaurant seed data.
- For API functions, test success, validation failure, auth failure, and rate-limit/abuse paths.

## Vercel Deployment Constraints

- The project currently runs on Vercel Hobby. Hobby deployments allow no more than 12 Serverless Functions.
- Treat every `api/**/*.js` file as one Vercel Function, including nested `index.js` files.
- Before adding a new API route, first check whether it can be merged into an existing endpoint by method, query, or action name.
- Keep shared backend code under `server/api/_shared/`, never under `api/`, because files under `api/` become deployable functions.
- `npm run check` must fail if `api/**/*.js` exceeds 12 files.
- If GitHub/Vercel auto deploy fails with `No more than 12 Serverless Functions`, Dashboard redeploy will not fix it; remove or compose API routes, commit, and push a new GitHub revision.
- Before `vercel build --prod && vercel deploy --prebuilt --prod`, refresh Vercel production env locally with:

```bash
vercel env pull .vercel/.env.production.local --environment=production --scope bucketsrans-projects --yes
```

- Do not rely on `.env.local` for prebuilt production deploys; Vite reads `.vercel/.env.production.local` during `vercel build --prod`.

## Security Considerations

- UGC must enter an approval queue before becoming public.
- Supabase RLS must be enabled on tables containing user data or private workflow data.
- Browser code may use Supabase anon keys only with strict RLS. Service-role keys belong only in Vercel environment variables.
- Do not copy forum, Xiaohongshu, WeChat group, or other platform content without authorization.
- Location, favorites, preferences, check-ins, and uploaded images require privacy-policy coverage.
- Admin actions must be audited and reversible.

## Demo Planning Docs

Before building the demo UI, read:

- `docs/DEMO_PLAN.md` for v0.1 scope and acceptance criteria.
- `docs/UI_STYLE_GUIDE.md` for visual direction and component style.
- `docs/MCP_USAGE_PLAN.md` for tool usage boundaries.
- `docs/FEATURE_REGISTRY.md` before changing an existing feature or adding a new one.
- `docs/FEATURE_WORKFLOW.md` for the required feature/bug/data/ops delivery flow.
- `docs/MCP_INTEGRATION_MATRIX.md` before writing custom code that may be covered by an existing tool or provider.
- `docs/ROADMAP.md` to map the work to the right milestone.
- `docs/TAG_TAXONOMY.md` before adding, removing, or reclassifying restaurant tags and filters.

## Installed Agent Skills

This project includes Vercel Labs agent skills under `.agents/skills/`, installed from `https://github.com/vercel-labs/agent-skills`.

Use them as project-local references when relevant:

- `vercel-react-best-practices`: use for React component work, data fetching, rendering performance, bundle/perceived-speed optimization, and profile/dashboard UI refactors.
- `vercel-composition-patterns`: use when refactoring reusable React components or avoiding prop-heavy component APIs.
- `deploy-to-vercel`: use when creating preview/production deployments or checking Vercel project linkage.
- `vercel-cli-with-tokens`: use when managing Vercel via CLI with `VERCEL_TOKEN` or project/team IDs. Never pass tokens as command arguments.
- `web-design-guidelines`: use for UI/UX/accessibility review. Fetch the latest guideline source before doing the review.
- `vercel-react-view-transitions`: use only when adding route/shared-element/state transitions that communicate clear spatial continuity.
- `vercel-react-native-skills`: not part of the current Web/PWA path; only use if the project later adds React Native/Expo.

Global UI skill:

- `ui-ux-pro-max`: installed under `~/.codex/skills/ui-ux-pro-max` from `https://github.com/nextlevelbuilder/ui-ux-pro-max-skill`; use for mobile UI audits, interaction density, accessibility, touch-target, and visual-system reviews before broad UI changes.

## AI Coding Workflow

- Start with a spec or issue for non-trivial work.
- Register non-trivial feature, bug, data, ops, and risk work in `docs/FEATURE_REGISTRY.md`.
- For each non-trivial slice, identify whether MCP/tools can accelerate planning, testing, deployment, or provider integration before writing custom code.
- Clarify ambiguous product decisions before coding.
- Implement in small slices and verify after each slice.
- Prefer official documentation or current repository patterns over memory when integrating third-party libraries.
- Explicitly state what not to do when delegating AI work.
- Do not rewrite unrelated files, do not hide failures, and do not claim production readiness without checks.
- Add or update durable contract checks in `scripts/check.cjs` for behavior that should not regress.
