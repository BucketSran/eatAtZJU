# MCP / Tool Integration Matrix

This matrix decides when to use existing tools instead of building from scratch.

## Development And Operations

| Need | Preferred Tool | Use For | Do Not Use For | Current Status |
| --- | --- | --- | --- | --- |
| Code hosting and task tracking | GitHub plugin / `git` / `gh` | Issues, milestones, PRs, commits, CI triage | Storing secrets or product runtime state | Git push works; issue automation depends on auth. |
| Deployment | Vercel CLI, `deploy-to-vercel`, `vercel-cli-with-tokens` skills | Preview/prod deploys, logs, env checks, alias inspection | Passing tokens as CLI args | Connected to GitHub and Vercel production. |
| Browser QA | Browser Use / mcp-chrome when available | Open local/prod pages, click flows, screenshots, smoke tests | Replacing `npm run check` | Available as plugin; use for UI regressions. |
| Docs/artifacts | Documents plugin | PRD snapshots, runbooks, demo notes | Source of truth for code behavior | Local markdown remains canonical. |
| Data spreadsheets | Spreadsheets plugin | Tag taxonomy, restaurant candidate review, feedback triage | Unreviewed public publishing | Useful for later data ops. |
| React performance | Vercel React skills | Bundle, data fetching, rendering, component refactor reviews | Blind rewrites | Installed under `.agents/skills`. |

## Product Runtime Integrations

| Need | Preferred Existing Service | Current Use | Build Custom Only For |
| --- | --- | --- | --- |
| Auth | Supabase Auth | Email OTP login | Account merge UX and ZJU trust rules. |
| Database | Supabase Postgres + RLS | Restaurants, reviews, submissions, users, favorites | Product-specific schema, migrations, scoring projections. |
| Storage | Supabase Storage | Avatars | Client compression and moderation workflow. |
| Serverless API | Vercel Functions | Restaurant APIs, favorites, profile, admin | Business logic and validation. |
| Maps | AMap/Baidu/Apple map URLs/APIs | Navigation links | ZJU-specific campus centers and routing copy. |
| Deployment | Vercel + GitHub | Production site and aliases | Release policy and smoke scripts. |

## Future Candidate Integrations

| Need | Candidate | When To Add | Caution |
| --- | --- | --- | --- |
| Issue/milestone automation | GitHub plugin or `gh` | After GitHub auth is stable | Do not create noisy issues for tiny tweaks. |
| Visual design assets | Figma/Canva plugin | When icon/UI assets need iteration | Preserve existing Apple-like visual language. |
| Moderation | Provider moderation API or Supabase Edge Function | Before public UGC launch | Needs privacy/cost review. |
| Analytics | Vercel Analytics or privacy-preserving event logs | Before beta test | Avoid collecting precise location or sensitive data. |
| Mainland delivery | China-hosted proxy/API layer or CloudBase | If Vercel/Supabase remains hard to access | More ops complexity and compliance work. |
| WeChat identity | WeChat mini-program login + account link codes | Mini-program parity phase | Bind to one `app_user`, avoid split identities. |

## Decision Rules

- If the need is commodity infrastructure, prefer a provider/tool.
- If the need is ZJU-specific trust, recommendation, taxonomy, or UX, implement in this repo.
- If the tool touches production data, credentials, paid quota, or user privacy, document the decision first.
- If the tool cannot be called from the current environment, create a manual runbook instead of blocking product work.
- If using a third-party API, add provider fallback or graceful degradation.

## Per-Feature MCP Review Template

Use this block in new feature specs:

```markdown
## MCP / Tool Review

- Can this use an existing provider/API?
- Can Browser Use automate smoke testing?
- Can GitHub issue/PR automation track the work?
- Does this need Supabase/Vercel config instead of custom code?
- What credentials, costs, or policy risks exist?
- What is the fallback if the tool is unavailable?
```
