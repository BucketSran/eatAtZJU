# AI / Vibe Coding Guide

This guide adapts the referenced Linux.do post into project rules for 食在浙大.

## 0. Memory Files

Use layered memory deliberately:

- `AGENTS.md`: cross-agent project rules and repository-wide expectations.
- `CLAUDE.md`: Claude Code project memory; points Claude to the most important local docs and constraints.
- `docs/CLAUDE_GLOBAL_TEMPLATE.md`: optional user-level template for `~/.claude/CLAUDE.md`.

Do not blindly write global memory. Global memory affects every project, so review it first and only install it when the user explicitly wants those rules everywhere.

## 1. Spec First

For any non-trivial feature, create or update a spec before coding:

- User problem.
- Target users.
- Scope and non-scope.
- Data model impact.
- API impact.
- Security/privacy impact.
- Acceptance criteria.

For this demo, use:

- `docs/DEMO_PLAN.md` for demo scope.
- `docs/UI_STYLE_GUIDE.md` for visual direction.
- `docs/MCP_USAGE_PLAN.md` for tool boundaries.

## 2. Work in Small Slices

Prefer this loop:

1. Define a small task.
2. Implement the smallest useful slice.
3. Run checks.
4. Review diff.
5. Commit.
6. Repeat.

Avoid one-shot rewrites of the entire app.

## 3. Frontend First, But Not Data-Blind

For product exploration, build the frontend flow first with mock data. However:

- Keep mock data behind services/repositories.
- Match the eventual Supabase schema as early as possible.
- Add seed data checks so mock data does not drift into nonsense.

## 4. TDD Where It Matters

Use TDD for:

- Recommendation scoring.
- Filtering/search.
- Moderation state transitions.
- RLS-sensitive access assumptions.
- Submission approval/rollback flows.

Do not over-test throwaway visual experiments.

## 5. MCP and Documentation Use

Use MCP/tools for:

- Looking up current official library docs.
- GitHub issue/PR/CI workflows.
- Browser testing of deployed or local web pages.
- Managing docs and seed data.

Do not use MCP as runtime product infrastructure.

## 6. UI Before Implementation

Before implementing visible UI, check `docs/UI_STYLE_GUIDE.md`.

The demo should feel like an Apple-inspired product: calm surfaces, generous whitespace, crisp hierarchy, subtle glass depth, restrained motion, student trust signals, and mobile-first layouts.

## 7. Explicit Prohibitions

Do not:

- Put API keys in frontend code.
- Use Supabase service-role key outside server-side code.
- Allow UGC to bypass moderation.
- Copy unauthorized comments, images, or usernames from external platforms.
- Add a dependency just because AI suggested it; prefer mature, official, actively maintained packages.
- Generate large README churn unless documentation is part of the task.
- Make destructive git operations without explicit user approval.

## 8. Prompt Template for Future Tasks

```text
Context:
- Project: eatAtZJU
- Stack: React + TypeScript + Vite, Vercel Functions, Supabase
- Current files to inspect:
- Existing pattern to follow:
- UI style: docs/UI_STYLE_GUIDE.md
- Tool boundaries: docs/MCP_USAGE_PLAN.md

Task:

Requirements:
- Functional:
- Data/API:
- Security/privacy:
- UX:

Do not:
-

Validation:
- npm run check
- relevant tests
- manual page path
```

## 9. Definition of Done

A task is not done until:

- Code is committed or intentionally left unstaged with explanation.
- `npm run check` passes.
- Docs/specs are updated for architecture or workflow changes.
- Security/privacy implications are recorded when relevant.
- Any residual risk is stated explicitly.
