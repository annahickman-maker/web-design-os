---
type: workflow
slug: creative-direction
status: active
tags:
  - type/workflow
  - domain/design
---

# Workflow: Creative Direction

Generates the creative direction brief - mood, color palette suggestions, typography recommendations, and photography style guidance.

---

## Trigger

- "generate creative direction"
- "create creative direction for [client]"

Called automatically by `workflow_strategy-deck.md`.

---

## Prerequisites

- Brief file complete (especially brand preferences section)
- Brand identity generated (recommended)
- Competitor analysis (optional but helpful)

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file - focus on brand preferences
2. `04_Clients/[client-slug]/strategy/brand-identity.md` (if exists)
3. `04_Clients/[client-slug]/strategy/competitor-analysis.md` (if exists)
4. `02_Frameworks/framework_creative-direction.md`

### Step 2 - Generate mood description

Based on the brand identity and the adjectives the client gave, write 3-4 sentences describing the visual mood of the brand.

Example: "Premium brand book meets editorial magazine. Considered and expensive, minimalist but warm because of photography, authoritative but approachable. Timeless rather than trendy."

### Step 3 - Suggest color palette

Based on the brand adjectives, values, and any color preferences mentioned:

**Primary:** 1 signature color with hex code and description
**Secondary:** 2-3 supporting colors with hex codes
**Neutrals:** 2-3 background/text colors
**Dark mode variants:** Inverse palette for dark mode

Rules:
- 3-5 meaningful colors max
- Ensure accessibility (WCAG AA contrast)
- Align with mood and values
- Avoid generic palettes unless brand is generic

Present as suggestions, not final choices:

> These are starting points. The designer should curate the final palette - this is where designer taste matters most.

### Step 4 - Suggest typography

Based on the mood and tone of voice:

**Display/Heading font:**
- 2-3 suggestions from Google Fonts (free and accessible)
- Each with a short description of the feel

**Body font:**
- 2-3 suggestions, highly legible
- Each with a short description

Pairing rules:
- Max 2 families
- Display font has character, body font is clean
- Serif display + sans body is classic
- Sans display + serif body is editorial
- All-sans is modern

### Step 5 - Suggest photography style

Based on the mood:
- **Subject matter**: people, products, environments, abstract
- **Style**: editorial, lifestyle, documentary, commercial
- **Treatment**: color grading, lighting, composition
- **Examples**: reference brands or photographers with similar style

### Step 6 - Moodboard guidance

This is where human curation takes over. Give the designer specific guidance for building the moodboard:

> Based on the direction, curate 8-12 moodboard images that feel like:
> - [mood descriptor 1]
> - [mood descriptor 2]
> - [mood descriptor 3]
>
> Good sources:
> - [Pinterest search suggestions]
> - [Brand references]
> - [Photography style references]
>
> What to avoid:
> - [any visual tropes that would betray the brand]

### Step 7 - Write output file

Write to `04_Clients/[client-slug]/strategy/creative-direction.md`:

```
---
type: strategy-output
slug: creative-direction-[client-slug]
status: draft
---

# Creative Direction: [client name]

## Visual Mood
[3-4 sentences]

## Color Palette Suggestions

### Primary
[color] - [description]
Hex: [code]

### Secondary
[colors with hex codes]

### Neutrals
[colors with hex codes]

### Dark Mode Variants
[colors with hex codes]

## Typography Suggestions

### Display Font Options
1. [font name] - [description]
2. [font name] - [description]
3. [font name] - [description]

### Body Font Options
1. [font name] - [description]
2. [font name] - [description]
3. [font name] - [description]

### Recommended Pairing
[font name] for headings + [font name] for body

## Photography Style

### Subject Matter
[guidance]

### Style
[description]

### Treatment
[color, lighting, composition notes]

### Reference Brands/Photographers
[list]

## Moodboard Curation Guidance

Build a moodboard that feels like:
- [mood 1]
- [mood 2]
- [mood 3]

Good sources:
- [Pinterest search terms]
- [Reference brands]

Avoid:
- [visual tropes that would betray the brand]

## Designer Notes
(Fill this in after curating the moodboard)

### Final Palette Chosen
[TBD]

### Final Typography Chosen
[TBD]

### Moodboard Link
[TBD]
```

### Step 8 - Present and discuss

> Here's the creative direction. These are AI starting points - the designer's taste takes over from here.
>
> [show direction]
>
> Which parts do you want to keep? Which do you want to explore differently? What would you add?

### Step 9 - Mark complete

Update status. The file will be added to throughout the design phase as the designer curates the actual moodboard and makes final choices.

---

## STOP

Do not auto-chain unless part of the full strategy deck workflow.
