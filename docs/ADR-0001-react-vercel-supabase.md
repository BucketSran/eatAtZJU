# ADR-0001: Adopt React + Vercel + Supabase as the Main Product Architecture

## Status

Accepted for the next implementation phase.

## Context

The initial MVP was built as a WeChat mini-program prototype to quickly explore the core product loop: browse restaurants, filter, view details, favorite, and get recommendations. After reviewing the AI-friendly architecture pattern from the referenced Linux.do post, we want a stack that is easier to iterate with AI coding, easier to deploy publicly, and easier to connect to managed database/auth/storage services.

The recommended stack is:

- React as the frontend framework.
- Vercel Serverless Functions as the backend layer.
- Supabase as database/auth/storage.
- Vercel for deployment.

This is a better fit for a fast Web/PWA MVP and admin workflows than a WeChat-only cloud stack.

## Decision

We will adopt the following architecture as the main line:

```text
React + TypeScript + Vite frontend
  -> Vercel Serverless Functions in api/
    -> Supabase Auth
    -> Supabase Postgres with RLS
    -> Supabase Storage
    -> moderation/recommendation services as backend-only integrations
Vercel deploys frontend and functions from GitHub
```

The existing WeChat mini-program implementation remains in the repository as a prototype/reference until the React migration reaches feature parity. We will not delete it in the same step as the architecture decision.

## Consequences

### Benefits

- Faster AI-assisted iteration because React/Vite/Node patterns are familiar and well documented.
- Vercel can deploy from GitHub with minimal operations work.
- Supabase provides managed Postgres, Auth, Storage, and RLS, reducing custom backend effort.
- A web/PWA product is easier to share outside WeChat and easier to pair with an admin dashboard.
- Serverless functions provide a safe place for secrets, moderation calls, and recommendation logic.

### Costs and Risks

- It is no longer a pure WeChat mini-program first architecture.
- Campus adoption through WeChat may require a later mini-program wrapper or separate client.
- Supabase RLS policies must be designed carefully; bad policies can leak or block data.
- Vercel functions have runtime and bundle constraints; long-running scraping or batch jobs should not live there.
- Client-side Supabase usage must never include service-role secrets.

## Guardrails

- All secret keys live in Vercel environment variables.
- Supabase service-role key is backend-only.
- Public tables can be read by anon users only when explicitly safe.
- User-owned data requires RLS and authenticated access.
- UGC writes go to `submissions`; public tables are updated only after moderation.
- Long-running data collection, batch import, and heavy AI jobs should run as scripts or scheduled jobs, not blocking user requests.

## Migration Plan

1. Keep current mini-program prototype intact.
2. Add React/Vite/TypeScript app skeleton.
3. Move mock restaurant data into shared seed JSON with schema version.
4. Implement Supabase schema and RLS migrations.
5. Implement Vercel API functions for restaurant list/detail/favorites/submissions.
6. Port current UI flows to React: home, discovery, detail, favorites, profile.
7. Deploy preview on Vercel.
8. Run small user test before enabling real UGC.

## Reversal Plan

If the Web/PWA stack fails to meet the adoption goal, we keep the React code as admin/web tooling and resume the WeChat mini-program as the primary student-facing client. Supabase can still serve as the backend for both clients.
