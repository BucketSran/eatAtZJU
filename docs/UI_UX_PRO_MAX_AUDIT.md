# UI/UX Pro Max Audit

## Skill Source

- Installed skill: `ui-ux-pro-max`
- Source: `https://github.com/nextlevelbuilder/ui-ux-pro-max-skill`
- Local path: `~/.codex/skills/ui-ux-pro-max`

## Applied Principles

- Mobile primary navigation should stay within five core destinations. Secondary creation actions should be a separate floating action.
- Touch targets must be at least `44px` with clear active, hover, and focus feedback.
- Mobile map interactions should keep zoom controls visible and avoid forcing users to pinch the whole page.
- Filter and map UI should prioritize progressive disclosure over long visible tag walls.
- Decorative visual treatment should not hide product hierarchy: first decide, then refine.

## Current UI Decisions

- Bottom navigation keeps `首页 / 发现 / 榜单 / 收藏 / 我的`.
- `贡献` is treated as a creation action and moved to a mobile floating pill.
- The food map keeps explicit zoom and reset controls, plus a bottom selected-restaurant card.
- Map markers use short-name capsules for single restaurants, while dense areas stay clustered as `N 家`; tapping a marker exposes details and navigation.
- Map marker meaning is now split: abbreviation identifies the restaurant, while marker color communicates recommendation strength. Numeric score stays in the selected detail card to avoid cluttering the map.
- Home keeps both decision modes but separates intent: “随机一餐” for system-pick discovery, “饭局骰子” for already-known candidate choices.
- The footer stays small and utility-like, so it does not compete with decision content.

## Follow-up Checks

- Verify on 375px, 430px, 768px, and desktop widths.
- Check that map zoom controls affect map scale, not page scale.
- Revisit contribution form density after the reduced taxonomy fully stabilizes.
