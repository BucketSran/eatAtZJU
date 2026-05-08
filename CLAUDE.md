# CLAUDE.md

This file is the project memory for Claude Code and Claude-compatible coding agents working on eatAtZJU.

## Read First

Before making non-trivial changes, read:

1. `AGENTS.md` for project overview, commands, style, tests, and security rules.
2. `docs/ADR-0001-react-vercel-supabase.md` for the accepted architecture decision.
3. `docs/RISK_REGISTER.md` for current safety, privacy, UGC, and deployment risks.
4. `docs/WORKPLAN.md` for the active task roadmap.

## Current Product Direction

The main implementation direction is now Web/PWA:

- React + TypeScript + Vite frontend.
- Vercel Serverless Functions backend under `api/`.
- Supabase Postgres/Auth/Storage with RLS.
- Vercel deployment from GitHub.

The existing WeChat mini-program code is a prototype/reference and should not be deleted until the React version reaches feature parity.

## Default Language

- Communicate with the user in Chinese unless they ask otherwise.
- Code, file names, commit messages, API names, and technical identifiers should remain concise English.
- Product-facing Chinese copy should be warm, student-focused, and trustworthy.

## Required Commands

Run before commit:

```bash
npm run check
```

When React migration starts, add and use:

```bash
npm run dev
npm run build
npm run lint
npm run test
```

## MCP / Tool Policy

Use tools deliberately:

- GitHub: repository, issues, PRs, CI, code review, release workflow.
- Browser Use: local/preview web UI inspection, screenshots, interaction testing.
- Documents/Spreadsheets: PRD, data dictionary, audit rules, seed data workflows.
- Official docs/web lookup: required when integrating or updating third-party libraries.

Do not treat MCP as product runtime infrastructure. The product runtime should call browser-safe SDKs, Vercel APIs, Supabase with RLS, or backend-only integrations.

## Non-Negotiable Security Rules

- Never expose Supabase service-role keys, AI provider keys, or admin credentials in frontend code.
- Supabase anon key is allowed in frontend only with strict RLS.
- User-generated content must go through `submissions` and moderation before publication.
- Do not copy unauthorized content from forums, Xiaohongshu, WeChat groups, or similar sources.
- Location, favorites, preferences, check-ins, and uploaded images require privacy-policy coverage.
- Admin actions must be audited and reversible.

## Coding Workflow

- For non-trivial features, write or update a spec before coding.
- Implement in small slices. Avoid whole-app rewrites.
- Preserve existing user changes and never run destructive git commands without explicit approval.
- When adding a dependency, prefer official or mature packages and check current docs.
- State residual risk if something cannot be verified.

## Immediate Next Technical Goal

Build the React/Vercel/Supabase foundation while preserving the current mini-program prototype:

1. Create React + TypeScript + Vite skeleton.
2. Convert mock restaurant data into schema-versioned seed JSON.
3. Add Vercel Functions for restaurant list/detail and recommendation.
4. Draft Supabase schema and RLS migrations.
5. Port current core pages to React.
