# Demo v0.1 Plan

## Goal

Build a shareable Web/PWA demo for 食在浙大 that can be opened from a Vercel preview link and demonstrates the core food discovery loop:

1. Open the home page.
2. Get a recommended restaurant.
3. Search/filter by taste, price, and scene.
4. View restaurant details.
5. Favorite restaurants locally.
6. Use “random meal” when undecided.

This demo validates product feel and interaction flow. It is not yet a production community platform.

## Stack

- Frontend: React + TypeScript + Vite.
- Backend boundary: Vercel Serverless Functions in `api/`.
- Data: seed JSON first, Supabase next.
- Deployment: Vercel preview from GitHub.
- Prototype reference: existing WeChat mini-program pages.

## In Scope

- React app skeleton.
- Mobile-first layout.
- Home page.
- Discover/filter page.
- Restaurant detail page.
- Favorites page using `localStorage`.
- Profile/preferences page using `localStorage`.
- Seed data normalized from current mock data.
- Typed domain models for restaurants, dishes, reviews, filters, and recommendation results.
- `.env.example` before any Supabase/Vercel environment integration.
- Demo API functions for restaurants and recommendation.
- Basic build/check CI.
- UI style defined in `docs/UI_STYLE_GUIDE.md`.
- MCP/tool workflow defined in `docs/MCP_USAGE_PLAN.md`.

## Out of Scope

- Real login.
- Real UGC publishing.
- Image upload.
- Admin dashboard.
- Full Supabase Auth integration.
- Production moderation workflow.
- AI recommendation agent.
- WeChat mini-program production release.

## Demo Routes

- `/`: home and daily recommendation.
- `/discover`: search, filters, restaurant list.
- `/restaurants/:id`: restaurant details.
- `/favorites`: saved restaurants.
- `/profile`: preferences and demo explanation.

## Demo APIs

- `GET /api/restaurants`: list/search/filter/recommendation score.
- `GET /api/restaurants/:id`: detail with dishes and comments.
- `GET /api/recommend/today`: random or preference-weighted recommendation.

## Acceptance Criteria

- `npm run check` passes.
- `npm run build` passes after React skeleton is introduced.
- GitHub Actions runs `npm run check` and `npm run build` once the React skeleton exists.
- Vercel preview opens on mobile and desktop.
- User can search/filter restaurants.
- User can open details.
- User can favorite/unfavorite and refresh without losing favorites.
- Random meal result works.
- No secrets are committed.
- README includes local run and deployment notes.

## Demo Script

1. Open the Vercel preview link.
2. Show the hero section and explain “students decide where to eat faster.”
3. Click random meal.
4. Search for `辣` or `夜宵`.
5. Open a restaurant detail page.
6. Favorite the restaurant.
7. Open favorites page.
8. Explain the future path: Supabase Auth, submissions, moderation, rankings, meal plans.

## Stage Order

1. Review high-star reference repos and lock demo scope/tooling lessons.
2. Lock demo scope and visual direction.
3. Initialize React/Vite/TypeScript.
4. Normalize seed data and typed domain models.
5. Add API mock functions.
6. Build core UI pages.
7. Add Supabase schema/RLS draft.
8. Deploy Vercel preview.
9. Run demo acceptance checklist.
