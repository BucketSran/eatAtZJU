# UI Style Guide for Demo v0.1

## Design Thesis

食在浙大 should feel like a warm campus food field guide, not a generic SaaS dashboard. The interface should make students feel: “I can decide where to eat in 30 seconds, and the recommendation feels like it came from classmates.”

## Visual Direction

Working title: **Campus Food Field Notes**.

Keywords:

- Campus bulletin board.
- Food diary.
- Warm map card.
- Handwritten recommendation energy, but still clean and trustworthy.
- Zhejiang campus afternoon light.

Avoid:

- Generic purple gradient SaaS style.
- Empty white dashboard cards everywhere.
- Overly corporate admin UI.
- Dark-mode-first cyber style.
- Fake AI sparkle aesthetics.

## Color System

Use CSS variables in the React app.

```css
:root {
  --paper: #fff7e8;
  --paper-deep: #f4e2c5;
  --ink: #2f261d;
  --muted: #7b6652;
  --tomato: #b84f31;
  --chili: #d95f35;
  --sesame: #e2a14d;
  --tea: #5f8a62;
  --lake: #5f86a8;
  --line: rgba(47, 38, 29, 0.12);
  --shadow: rgba(91, 61, 38, 0.16);
}
```

Usage:

- `paper` / `paper-deep`: app background and card base.
- `ink`: main text.
- `muted`: secondary text.
- `tomato` / `chili`: primary actions and spicy/highlight states.
- `sesame`: warm badges, price, recommendation score.
- `tea`: trust, student score, verified tags.
- `lake`: map/discovery accents.

## Typography

Preferred CSS stack:

```css
font-family: "LXGW WenKai", "Noto Serif SC", "Source Han Serif SC", "PingFang SC", serif;
```

If external font loading is added later, prefer:

- Chinese display/body: LXGW WenKai or Noto Serif SC.
- Latin labels: Fraunces, Young Serif, or a similar expressive serif.

Rules:

- Hero title should be large and expressive.
- Body copy must remain readable on mobile.
- Numeric scores and prices can use a stronger, tabular style.

## Layout Principles

- Mobile-first, desktop as a centered wide phone/card layout.
- Max content width around `1120px` on desktop.
- Use layered cards, not flat tables.
- Key actions should be thumb-friendly: minimum 44px height.
- Bottom navigation is acceptable for demo, but web desktop should also have top navigation.

## Component Style

### Hero

- Big statement: “今天吃点什么？”
- Supporting line explains student-sourced recommendation.
- Primary action: random meal.
- Secondary action: browse nearby.
- Add warm background blobs or paper texture via CSS gradients.

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

- Rounded corners: `24px` to `32px`.
- Soft shadow.
- Colored square/label replacing real image until upload pipeline exists.

### Filters

- Chip-based filters.
- Active chip uses tomato/chili background.
- Price filters use sesame accent.
- Avoid advanced filter drawers in v0.1.

### Detail Page

- Large colored header based on restaurant theme.
- Quick stats grid: rating, price, walk time, check-ins.
- “Why students recommend it” block.
- Dishes list.
- Short comments.

### Empty States

Tone should be helpful and slightly playful, for example:

- “收藏夹还饿着。”
- “换个标签试试，饭勺还在找。”

## Motion

Use small, purposeful motion only:

- Page entry fade + slight upward movement.
- Restaurant cards stagger in by 40ms.
- Random meal result uses a short reveal.
- Respect `prefers-reduced-motion`.

## Accessibility

- Text contrast must be readable on warm backgrounds.
- Interactive elements need visible focus states.
- Do not rely on color alone for active filters.
- Buttons must have text labels, not icon-only controls.

## Demo Screens to Build First

1. Home.
2. Discover list.
3. Restaurant detail.
4. Favorites.
5. Profile/preferences.

## Design Review Checklist

- Does this feel campus-specific rather than generic?
- Can a student decide where to eat within 30 seconds?
- Are trust signals visible?
- Does mobile feel first-class?
- Is the UI still useful without real food photos?
- Are demo limitations honestly represented?
