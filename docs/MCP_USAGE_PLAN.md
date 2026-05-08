# MCP / Tool Usage Plan

## Principle

MCP and plugins are acceleration tools for development, testing, documentation, and operations. They are not application runtime infrastructure.

The product runtime should use:

- React browser code.
- Vercel Serverless Functions.
- Supabase client/server SDKs with RLS.
- Backend-only integrations through environment variables.

## Tools We Can Use Now

### GitHub

Use for:

- Issues and task tracking.
- Pull requests and review.
- CI status.
- Release notes and branch hygiene.

Current blocker:

- Local `gh` authentication has previously shown an invalid token. `git push` works, but issue/PR automation may require `gh auth login -h github.com`.

### Browser Use

Use after React app exists:

- Open local `http://localhost:5173`.
- Inspect page rendering.
- Test mobile-ish interactions.
- Take screenshots for demo review.
- Verify Vercel preview links.

Do not use Browser Use as a substitute for unit/build checks.

### Documents

Use for:

- PRD snapshots.
- Demo review notes.
- Research summaries.
- User interview synthesis.

### Spreadsheets

Use for:

- Restaurant seed data collection.
- Tag taxonomy.
- Review/audit rubric.
- Inner-test feedback tracking.

### Web / Official Docs Lookup

Use whenever integrating or changing:

- React/Vite config.
- Vercel deployment/functions behavior.
- Supabase SDK/Auth/RLS/Storage.
- Any third-party map or UI library.

Prefer official docs and primary sources.

## Planned MCP-Assisted Workflow by Stage

### Stage 0: Planning

- Update docs locally.
- Use GitHub for versioning.
- Optional: create GitHub issues once `gh` auth is fixed.

### Stage 1: React Skeleton

- Use official Vite/React docs if package versions or config are unclear.
- Run local commands directly.
- Use Browser Use after `npm run dev` works.

### Stage 2: Seed Data

- Use Spreadsheets or CSV workflows for restaurant collection.
- Keep imported data authorized and summarized.
- Validate with `npm run check`.

### Stage 3: Supabase

- Use official Supabase docs for schema, RLS, Auth, and Storage.
- Keep service-role key out of frontend.
- Add `.env.example`, never commit `.env`.

### Stage 4: Vercel Deployment

- Use Vercel docs for build, routing, and Functions.
- Use GitHub Actions for checks.
- Use Browser Use to inspect preview deployment.

### Stage 5: Demo Review

- Use Browser Use screenshots.
- Use GitHub issues for feedback items.
- Use Documents for demo notes and next-round planning.

## Runtime Boundaries

Allowed in browser:

- Supabase anon key with strict RLS.
- Calls to our own Vercel API.
- Public assets and public seed/demo data.

Server-only:

- Supabase service-role key.
- AI provider keys.
- Moderation provider keys.
- Admin review operations.
- Batch import credentials.

Forbidden:

- MCP credentials in app code.
- Direct browser use of service-role key.
- User-generated content becoming public without moderation.
- Scraped or copied third-party content without authorization.

## When to Pause and Ask

Pause before:

- Installing global tools or global memory.
- Writing `~/.claude/CLAUDE.md`.
- Connecting production Supabase/Vercel credentials.
- Enabling public writes.
- Adding paid APIs.
- Changing deployment domains or production env vars.

## Demo Tool Checklist

Before demo:

- `npm run check` passes.
- `npm run build` passes once React app exists.
- Vercel preview opens.
- Browser Use or manual browser check verifies core routes.
- No secrets in git diff.
- RLS assumptions documented if Supabase is connected.
