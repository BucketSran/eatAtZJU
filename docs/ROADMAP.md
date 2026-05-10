# Roadmap

This roadmap groups work into milestones so feature requests do not arrive as isolated patches.

## M0: Demo Foundation

Status: mostly complete.

Goal: A web demo that explains the product and can be deployed safely.

Done:

- React/Vite web shell.
- Vercel deployment.
- Supabase-backed restaurant APIs with seed fallback.
- Basic restaurant discovery, detail, favorites, profile, contribution, admin queue.
- CI/check script and deployment runbooks.

Remaining:

- Keep documentation and feature registry current.
- Add browser-driven smoke tests when Browser Use/mcp-chrome is stable.

## M1: Recommendation Quality

Status: active.

Goal: Recommendations should feel useful for ZJU students, not generic restaurant search.

Scope:

- Expand verified restaurant coverage for Zijin'gang, Yuquan, and Xixi.
- Add explicit fields: `primary_category`, `is_canteen`, `business_status`, `service_modes`, `meal_periods`.
- Tune ranking formula with student/public blended score.
- Improve empty states for sparse filters.
- Add analytics-free feedback affordances: useful/not useful, wrong info, closed store.

Quality gates:

- No fake student scores/comments.
- Discover, random pick, and leaderboards sort by documented score.
- Public-source summaries clearly disclose source type.

## M2: User Identity And Trust

Status: active.

Goal: One user can use web and WeChat without split identities.

Scope:

- Email OTP login.
- Campus email verification.
- Avatar/display name/default campus/preferences.
- Account link code for future WeChat binding.
- Conflict UI when web profile and WeChat profile differ.

Quality gates:

- No service-role key in browser.
- Profile updates are patch-based.
- Avatar size and storage policies enforced.

## M3: UGC And Review Operations

Status: planned.

Goal: Students can contribute data safely, and admins can approve/reject with rollback.

Scope:

- Contribution form with structured tags.
- Image upload and moderation.
- Admin queue with audit logs.
- Materialization from approved submissions into public tables.
- Rollback/export strategy.

Quality gates:

- UGC never becomes public without approval or explicit low-risk auto-approval rule.
- Admin actions are audited.
- Data pollution can be reverted.

## M4: WeChat Mini-Program Parity

Status: planned.

Goal: Mini-program shares the same database and core product semantics as web.

Scope:

- Reuse taxonomy, scoring, and API contracts.
- WeChat login binds to `app_user`.
- Mini-program pages for home/discover/detail/favorites/profile/contribute.
- Mainland access plan for APIs.

Quality gates:

- One account maps to one web identity and one WeChat identity.
- No duplicate database truth.
- Mini-program works without relying on Vercel-only browser assumptions.

## M5: Beta Launch

Status: future.

Goal: A small student beta with feedback and operational safety.

Scope:

- Privacy policy and data handling copy.
- Feedback/report issue link.
- Basic observability.
- Backup and rollback drills.
- Known-issues board.

Quality gates:

- Core paths pass smoke tests.
- High-risk data has rollback.
- Product copy does not overclaim student trust before UGC exists.
