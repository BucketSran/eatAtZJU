# Feature Delivery Workflow

This workflow keeps 食在浙大 from becoming a pile of one-off patches. Use it for every non-trivial feature, bug, data change, or integration.

## 0. Classify The Work

Pick one type before coding:

- `feature`: new user-visible capability.
- `bug`: current behavior violates intended behavior.
- `data`: restaurant, tag, ranking, or review data change.
- `ops`: deployment, migration, domain, env var, backup, or rollback work.
- `risk`: privacy, security, copyright, abuse, or compliance issue.

## 1. Register It

- Add/update `docs/FEATURE_REGISTRY.md`.
- Create/update a GitHub issue when GitHub automation is available.
- If no issue exists yet, include a short spec in the commit or PR description.

Required spec fields:

- User problem.
- Scope for this slice.
- Explicit non-goals.
- Data and privacy impact.
- MCP/tool candidates.
- Acceptance criteria.
- Rollback plan if the feature touches production data.

## 2. Decide Tooling First

Before writing custom code, check `docs/MCP_INTEGRATION_MATRIX.md`.

Default decisions:

- Use existing platform capabilities for auth, storage, database, deployment, maps, and browser testing.
- Write custom code only for product-specific logic: recommendation scoring, ZJU-specific taxonomy, UGC trust model, and UI composition.
- If a tool needs credentials, paid quota, or production permission, stop and record the decision before using it.

## 3. Design The Contract

Every feature needs at least one durable guard:

- Static contract in `scripts/check.cjs`.
- API smoke script.
- Seed data invariant.
- Migration/RLS assertion.
- Browser smoke checklist.
- Issue acceptance criteria.

Examples:

- A new restaurant filter must have frontend and backend parity checks.
- A new profile field must have migration, API mapping, UI, and RLS checks.
- A new external link must have safe target/rel attributes and documented provider URLs.

## 4. Implement In A Small Slice

- Keep UI components focused.
- Keep data access behind services/repositories.
- Avoid touching unrelated files.
- Prefer additive changes to large rewrites.
- Update copy and empty states with the same feature slice.

## 5. Verify

Minimum local checks:

```bash
npm run check
npm run build
```

When relevant:

```bash
npm run smoke:api
npm run smoke:auth
```

Manual/browser smoke:

- Home recommendation.
- Discover filters and random pick.
- Restaurant detail.
- Profile login/preferences.
- Contribute/admin queue if UGC changed.

## 6. Deploy And Observe

- Prefer GitHub push deploys for normal work.
- Use Vercel CLI for deployment inspection.
- Verify production aliases after deploy.
- Run API smoke against production when API behavior changed.

## 7. Close The Loop

- Update `docs/FEATURE_REGISTRY.md` status.
- Update `docs/ROADMAP.md` if milestone scope changes.
- Record residual risks instead of claiming perfect readiness.
- If the feature creates future work, add it as a follow-up issue or registry note.

## Bug Workflow

For bugs, do not only patch the symptom:

1. Reproduce or reason from code.
2. Identify the owning feature ID from `FEATURE_REGISTRY.md`.
3. Add a guard that would have caught the bug.
4. Fix the code.
5. Verify the guard fails before/fixes after when practical.
6. Deploy if the bug affects production.

## Data Workflow

For data changes:

- Never invent student reviews, scores, or check-ins.
- Label public-source summaries clearly.
- Keep source references.
- Run seed invariants.
- Prefer staged import: collect -> normalize -> review -> seed/migrate.

## MCP Workflow

MCP/tools are used at development time, not as hidden runtime infrastructure. When using one:

- State which tool/skill is being used and why.
- Keep secrets outside code and command arguments.
- Prefer official docs or provider APIs for third-party integrations.
- Add fallback behavior when a tool/service is unavailable.
