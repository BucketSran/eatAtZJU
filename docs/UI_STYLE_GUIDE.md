# UI Style Guide for Demo v0.1

## Design Thesis

食在浙大 should use an Apple-inspired product style: calm, precise, tactile, and highly legible. The interface should help a student decide where to eat in 30 seconds, with trustworthy student signals presented through clean hierarchy rather than decorative noise.

This is **Apple-inspired**, not Apple-branded. Do not copy Apple product screenshots, icons, marketing assets, or proprietary visual identity. Use general principles: clarity, depth, restraint, consistency, accessibility, and polished motion.

## Visual Direction

Working title: **ZJU Food, Apple-style Clarity**.

Keywords:

- Clean glass surfaces.
- Spacious cards.
- Soft depth.
- Clear hierarchy.
- Mobile-first product polish.
- Calm confidence.
- Trustworthy student recommendation.

Avoid:

- Generic purple gradient SaaS style.
- Busy campus scrapbook visuals.
- Handwritten/diary decoration.
- Heavy borders and dense tables.
- Dark-mode-first cyber style.
- Fake AI sparkle aesthetics.
- Direct imitation of Apple brand pages or icons.

## Color System

Use CSS variables in the React app.

```css
:root {
  --system-bg: #f5f5f7;
  --surface: rgba(255, 255, 255, 0.82);
  --surface-solid: #ffffff;
  --surface-elevated: rgba(255, 255, 255, 0.92);
  --label-primary: #1d1d1f;
  --label-secondary: #6e6e73;
  --label-tertiary: #8e8e93;
  --separator: rgba(60, 60, 67, 0.14);
  --accent: #007aff;
  --accent-warm: #ff7a1a;
  --success: #34c759;
  --warning: #ff9f0a;
  --danger: #ff3b30;
  --student-green: #2f8f5b;
  --card-shadow: rgba(0, 0, 0, 0.08);
}
```

Usage:

- `system-bg`: page background.
- `surface`: glass cards and navigation surfaces.
- `surface-solid`: important readable content blocks.
- `label-primary`: primary text.
- `label-secondary`: metadata.
- `accent`: primary actions and selected states.
- `accent-warm`: food/recommendation highlights.
- `student-green`: trust/student score.
- `separator`: subtle dividers.

## Typography

Preferred CSS stack:

```css
font-family: -apple-system, BlinkMacSystemFont, "SF Pro Display", "SF Pro Text", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
```

Rules:

- Use strong type hierarchy rather than decorative typography.
- Hero title should be large, compact, and confident.
- Body copy should feel like native iOS text: readable, restrained, never cramped.
- Use tabular numbers for price, rating, distance, and score when possible.
- Keep Chinese copy concise and product-like.

Suggested scale:

- Hero: `48px-64px` desktop, `36px-44px` mobile.
- Section title: `24px-32px`.
- Card title: `18px-22px`.
- Body: `15px-17px`.
- Metadata: `13px-14px`.

## Layout Principles

- Mobile-first, with desktop as a refined responsive layout.
- Use generous whitespace and clear grouping.
- Use a max content width around `1120px` on desktop.
- Use a sticky translucent top navigation on desktop.
- Use bottom tab navigation or floating action group on mobile.
- Keep primary actions thumb-friendly: minimum 44px height.
- Prefer progressive disclosure over dense filter panels.

## Material and Depth

Use Apple-like depth carefully:

- Cards: large radius, subtle shadow, slight translucent background.
- Navigation: blur-backed surface where browser support allows.
- Modals/sheets: bottom sheet on mobile, centered panel on desktop.
- Avoid heavy outlines. Use separator lines sparingly.

Suggested CSS:

```css
.glass-card {
  background: var(--surface);
  border: 1px solid var(--separator);
  border-radius: 28px;
  box-shadow: 0 24px 60px var(--card-shadow);
  backdrop-filter: blur(24px);
}
```

## Component Style

### Hero

- Big statement: “今天吃什么？”
- Subcopy: concise, student-trust oriented.
- Primary action: “随机一餐”.
- Secondary action: “浏览附近”.
- Use one elegant gradient orb or soft background glow, not multiple decorative doodles.

### Restaurant Card

Must show:

- Restaurant name.
- Area.
- Cuisine.
- Average price.
- Rating/student score.
- Tags.
- One-sentence reason.
- Favorite action.

Card style:

- Radius: `24px-30px`.
- Shadow: soft, low contrast.
- Image placeholder: abstract color panel or clean monogram until real authorized photos exist.
- Favorite button: clear text/icon with accessible label.

### Filters

- Use segmented controls and chips.
- Active state uses `accent` or `accent-warm` with clear text contrast.
- Avoid overloading users with too many filters at once.
- On mobile, advanced filters should become a sheet later; v0.1 can keep inline chips.

### Detail Page

- Large hero area with restaurant identity, not a busy banner.
- Quick stats grid: rating, price, walk time, check-ins.
- “为什么推荐” block should read like a concise system insight.
- Dishes and comments use grouped list styling.

### Empty States

Tone should be calm and helpful:

- “收藏夹还没有餐厅。”
- “换个标签试试，或让系统随机推荐一餐。”

Avoid overly jokey copy in Apple-style UI.

## Motion

Use restrained, purposeful motion:

- Page transition: fade + slight scale or upward movement.
- Cards: subtle opacity/translate reveal.
- Random meal result: one clean spring-like reveal.
- Button press: scale to `0.98` or background tint.
- Respect `prefers-reduced-motion`.

Avoid:

- Excessive bouncing.
- Confetti.
- Long animation chains.
- Generic animated gradients.

## Accessibility

- Text contrast must pass readable standards on glass surfaces.
- Interactive elements need visible focus states.
- Do not rely on color alone for active filters.
- Buttons must have text labels or accessible labels.
- Respect `prefers-reduced-motion`.
- Layout must work at mobile widths around `375px`.

## Demo Screens to Build First

1. Home.
2. Discover list.
3. Restaurant detail.
4. Favorites.
5. Profile/preferences.

## Design Review Checklist

- Does it feel like a polished Apple-style product rather than a template?
- Can a student decide where to eat within 30 seconds?
- Are trust signals visible without visual clutter?
- Does mobile feel first-class?
- Is the UI still useful without real food photos?
- Are demo limitations honestly represented?
- Are motion, blur, and depth subtle rather than showy?
