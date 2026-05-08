# Demo Foundation Strategy Review

Date: 2026-05-08

## Scope Reviewed

This review covers the first implementation slice for Demo v0.1:

- React + TypeScript + Vite skeleton.
- Vercel-compatible SPA routing foundation.
- `.env.example`.
- schema-versioned seed JSON.
- typed domain models.
- upgraded local checks and GitHub Actions build.

This review does not claim production readiness for public UGC, auth, Supabase writes, image upload, or admin workflows.

## Implemented Controls

- `npm run dev`, `npm run check`, `npm run build`, `npm run preview` are now available.
- CI runs `npm ci`, `npm run check`, and `npm run build`.
- `scripts/check.cjs` validates JS/CJS syntax, JSON parsing, legacy mock data, seed schema version, seed relationships, rating/price/location ranges, and service-layer smoke checks.
- `seed/restaurants.json`, `seed/dishes.json`, and `seed/reviews.json` are schema-versioned.
- `src/types/*` defines typed domain models before UI logic grows.
- `.env.example` documents browser-safe and server-only environment variables.
- `vercel.json` uses a non-API SPA fallback so future `/api/*` routes are not swallowed by React Router fallback.

## Vulnerabilities Found During Review

| Risk | Severity | Fix | Status |
| --- | --- | --- | --- |
| CI would not catch production build failures. | P1 | Added `npm run build` to GitHub Actions. | Fixed |
| Existing check script only covered legacy JS/mock data. | P1 | Replaced it with `scripts/check.cjs`, validating seed JSON and TypeScript via `tsc`. | Fixed |
| `package.json` ESM mode could break existing mini-program CommonJS modules. | P1 | Avoided global `type: module`; kept legacy CommonJS compatible. | Fixed |
| SPA fallback could rewrite future `/api/*` routes to `index.html`. | P1 | Updated `vercel.json` to exclude `/api/` via negative lookahead. | Fixed |
| Seed data could drift from future Supabase schema. | P1 | Added schema version and typed domain models; check script validates relationships. | Fixed for current slice |
| Secrets could be accidentally committed when Supabase starts. | P0 | Added `.env.example`; `.gitignore` already excludes `.env` and `.env.*` while allowing examples. | Fixed for current slice |
| React skeleton could become disconnected from API/repository boundary. | P1 | Added `src/services/seedRepository.ts`; next slice must keep UI behind services/repositories. | Fixed for current slice |
| Apple-style UI could accidentally copy Apple brand assets. | P2 | `docs/UI_STYLE_GUIDE.md` states Apple-inspired, not Apple-branded. | Fixed |

## Verification Evidence

Commands run successfully:

```bash
npm ci
npm run check
npm run build
npm run dev -- --host 127.0.0.1
curl -I http://127.0.0.1:5173/
curl -I http://127.0.0.1:5173/discover
curl -I http://127.0.0.1:5173/restaurants/r001
```

HTTP smoke checks returned `200 OK` for the local dev routes above.

Official docs consulted:

- Vite guide: Node version, dev server, build behavior.
- Vercel Vite docs: Vite deployment support.
- Vercel rewrites docs: `vercel.json` source/destination and negative lookahead pattern.
- Supabase React quickstart: browser anon key pattern, with service-role kept server-side by project rule.

## Current Confidence Statement

For the current slice, I have factual confidence that the strategy is sound enough to proceed:

- The React/Vite foundation builds.
- The seed/type/check pipeline protects core data invariants.
- CI is aligned with local verification.
- The Vercel SPA fallback has a documented API exclusion.
- Secrets are not present in committed files.

This is the closest useful form of “100% confidence” for this stage: no known unmitigated P0/P1 risks remain inside the implemented demo foundation slice.

## Not Yet Covered

Do not treat these as approved yet:

- Real Supabase project connection.
- Supabase RLS production policies.
- Public login.
- Public UGC writes.
- Image upload.
- Admin moderation.
- Production Vercel domain/env configuration.
- Real student data collection.

Those require separate review loops before release.

## Next Required Slice

Proceed to:

1. Implement restaurant repository/service methods over seed data.
2. Add Vercel Functions for list/detail/recommendation.
3. Port home/discover/detail/favorites/profile from placeholders to real seed-backed UI.
4. Re-run this review loop after API functions exist.
