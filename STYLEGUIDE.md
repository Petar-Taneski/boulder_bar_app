# Meridiano – Design Context Mastersheet

Purpose: A single, model-agnostic reference for visual/UX decisions to keep the redesign consistent across components.

Key update policy

- Only update this file when the user says: "Hey man, please update the context mastersheet".
- Otherwise, treat this file as the source of truth for design decisions to date.

Brand essence

- Elegant, handcrafted, modern. Inspired by Marseille and the Mediterranean.
- Aesthetic: sleek minimalism, transparency, depth, precision (watchmaking).

Color

- Primary (brand): #3375db
- Neutrals: use theme color schemes; ensure strong contrast on glass.
- Borders: avoid heavy borders; if needed, use subtle 1px at ~22% opacity.

Typography

- Headings: Fraunces, weight 500 (refined, contemporary serif)
- Body/UI: Plus Jakarta Sans, weight 400 (clean, readable)
- Heading letter-spacing: tight (~0.02em); Body line-height: slightly airy

Hero (carousel)

- Layout: full-width image with an edge-to-edge bottom glass bar (no outer rounding).
- Glass bar: frosted gradient, subtle glass-edge; light shimmer on hover.
- Text: unified H1 for headings; optional subtext under heading; consistent scale on all slides.
- Controls: arrows + dots only; centered above the bar; no pause/play.
- Dots: white at 90% opacity; active dot scales +20%; equal spacing to arrows left/right.
- Z-index: controls below header; bar anchored to bottom.

Motion & depth

- Soft, restrained reveals (200–600ms). Favor subtle highlights over heavy shadows.
- Keep interactions calm; avoid flashy transitions.

UI composition

- Prefer full-bleed sections and integrated, semi-transparent containers.
- Merge adjacent elements into single, purposeful bars/strips where possible.
- Maintain strong legibility on glass surfaces (contrast-aware).

UX primitives to retain

- Simple product display (limited copy per view).
- Lateral cart (drawer pattern).
- Top bar showing remaining amount to free shipping.

Implementation anchors (as of now)

- Fonts loaded in: `layout/theme.liquid` (Fraunces + Plus Jakarta Sans)
- Global font tokens: `assets/base.css` (CSS variables for headings/body)
- Hero overlay/bar + controls: `assets/component-slideshow.css`
- Carousel heading consistency: `sections/slideshow.liquid` (force H1)
- Header compact + glass options: `sections/header.liquid` + `assets/base.css`
- Header link behavior: text-only hover/active scale + glow; no underlines
- Menu simplification: "Watch parts" shows first 5 items + "View all"
- Hover-open behaviors (desktop): header menus and localization dropdowns
- Dropdown styling (glass): `assets/base.css`, `assets/component-localization-form.css`
- Search overlay and predictive results: glass treatment in `assets/component-search.css` + `assets/component-predictive-search.css`; images match glass

Open questions to refine later

- Heading weight mapping per level (e.g., H1 600, H2–H5 500).
- Adaptive glass density/tint for very bright hero images.
- CTA emphasis on glass (solid vs outline vs glass pill) per context.
- Localization dropdown item set (flags vs text-only) and densities.
- Predictive search content layout at narrow widths (image size, grid gaps).

How to use this file

- When adding/updating components, align with the principles above.
- If a decision conflicts with this mastersheet, request an update with the keyphrase above.
