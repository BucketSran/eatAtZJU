# Feature Registry

This registry is the single index of product capabilities for 食在浙大. Before adding or changing a non-trivial feature, update the relevant row or add a new row.

## Status Labels

- `live`: implemented, deployed, and covered by checks or smoke tests.
- `mvp`: implemented enough for demo, but still has known product or data gaps.
- `planned`: agreed direction, not implemented.
- `blocked`: waiting on account, policy, data, or product decision.

## Current Feature Map

| ID | Feature | Status | User Entry | Frontend | API / Service | Data / Infra | Quality Gate | Next Risk |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| F01 | Restaurant discovery | live | `/discover` | `src/routes/DiscoverPage.tsx`, `src/components/RestaurantCard.tsx` | `src/services/restaurantService.ts`, `api/restaurants/index.js` | `restaurants`, seed fallback | `checkApiService`, build | More restaurants and richer explicit category fields needed. |
| F02 | Restaurant detail | live | `/restaurants/:id` | `src/routes/RestaurantDetailPage.tsx` | `api/restaurants/[id].js` | `restaurants`, `reviews`, `dishes` | `checkApiHandlers` | Dish-level data is intentionally sparse until verified. |
| F03 | Map navigation links | live | Detail hero, restaurant cards | `src/components/MapNavigationLinks.tsx` | `src/lib/mapLinks.ts` | Public lat/lng fields | `checkMapNavigationContracts` | Need real-device validation for app handoff on iOS/Android/WeChat webview. |
| F04 | Time-aware home recommendation | live | `/` | `src/routes/HomePage.tsx` | `api/recommend/today.js` | restaurant tags, default campus | `checkProfileContracts` | Needs explicit availability/open-hours later. |
| F05 | Structured filters and random pick | live | `/discover?random=1` | `src/routes/DiscoverPage.tsx` | `getRandomRestaurantRemote` | taxonomy constants | `checkProfileContracts` | Current random is still uniform within filtered candidates. |
| F06 | Leaderboards | live | `/leaderboards` | `src/routes/LeaderboardsPage.tsx` | `src/services/leaderboardService.ts` | Supabase/seed restaurants | `checkLeaderboardContracts` | Board definitions need tuning after real UGC grows. |
| F07 | Favorites | live | `/favorites`, cards | `src/routes/FavoritesPage.tsx`, `favoriteStore` | `api/favorites/index.js` | `app_favorites` | `checkApiHandlers` | Conflict handling across devices is basic merge. |
| F08 | Email login and profile | live | `/profile` | `src/routes/ProfilePage.tsx` | `api/profile/index.js`, `api/profile/avatar.js` | Supabase Auth, `app_users`, Storage | `checkProfileContracts`, `smoke:auth` | Need stronger profile conflict UI for cross-channel identity. |
| F09 | Default campus and preferences | live | `/profile` | `ProfilePage`, `preferenceStore` | profile API | `app_users.default_campus` | `checkProfileContracts` | Preference taxonomy should evolve with real usage analytics. |
| F10 | Campus email verification | mvp | `/profile` | `ProfilePage` | `api/auth/campus-verify.js` | `user_trust` | `checkApiHandlers` | Allowed domains and privacy copy need final policy review. |
| F11 | UGC contribution queue | mvp | `/contribute` | `src/routes/ContributePage.tsx` | `api/submissions/index.js` | `submissions` | `checkApiHandlers` | Needs image moderation and anti-abuse before public launch. |
| F12 | Admin review queue | mvp | `/admin` | `src/routes/AdminPage.tsx` | `api/admin/submissions/index.js` | `admin_users`, `audit_logs` | `checkApiHandlers`, RLS checks | Needs operational playbook and rollback drills. |
| F13 | Real public data bootstrap | mvp | scripts/docs | `docs/REAL_DATA_BOOTSTRAP.md` | `scripts/collect-real-restaurants.cjs` | AMap verified POI, seed SQL | `checkSeedData` | Public-source summaries must not pretend to be student comments. |
| F14 | Supabase deployment and migrations | live | ops | `scripts/apply-supabase.cjs` | server-side Supabase client | migrations, seed SQL | `checkSupabaseFiles` | Need scheduled backup/export before larger UGC launch. |
| F15 | WeChat mini-program prototype | mvp | WeChat DevTools | `pages/`, `services/`, `cloudfunctions/` | Cloud function prototype | CloudBase env | docs only | Web and mini-program feature parity is not complete. |
| F16 | China access/domain path | planned | production URL | docs | Vercel + custom domain | `eat.bucketsran.fun` | deployment smoke | Vercel/Supabase access from mainland remains variable. |

## New Feature Intake Checklist

- Add or update a row in this registry.
- Create or update a GitHub issue using the feature template.
- Link the feature to one milestone in `docs/ROADMAP.md`.
- Identify whether an MCP/tool can reduce custom work using `docs/MCP_INTEGRATION_MATRIX.md`.
- Add or update a contract check in `scripts/check.cjs`.
- Add demo or smoke-test instructions if the feature changes core user paths.
