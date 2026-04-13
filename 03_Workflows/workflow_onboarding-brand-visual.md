---
type: workflow
slug: onboarding-brand-visual
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Workflow: Onboarding - Brand Visual + Template Customization

Captures the designer's visual brand (fonts, colors, logo) and
applies it live across every master template in `06_Templates/`.
The designer ends this workflow with five fully branded master
templates (strategy deck, client portal, proposal, contract,
invoice) that every client deliverable from now on is generated
from.

This is the biggest single step in onboarding and the one that
turns Web Design OS from a generic template pack into a branded
production system for this specific designer.

---

## Trigger

Called automatically as part of the onboarding sequence after the
payments step (client mode only). Can also be re-run on demand
with:

- "update my brand visuals"
- "re-run brand setup"
- "change my fonts"
- "change my brand colors"
- "update my logo"

When re-run on demand, the workflow walks through the full
capture + template rewrite flow from scratch. Never do a partial
rewrite - fonts and colors are set together so templates stay
consistent.

---

## Why this exists

Every deliverable the system generates has to look like it came
from the designer's studio, not from a generic template. That
means fonts, colors, and the logo have to flow into every HTML
document the system produces, and the designer has to see and
approve how each master template looks in their brand before any
client ever receives a file.

The six master templates share a common brand token block so
this workflow only has to capture the brand decisions once, then
write them into each template. A single CSS `:root` variable
block defines everything. No per-template styling, no
duplicated values.

---

## Prerequisites

- `01_Core/core_positioning.md` exists (designer name for the
  cover and footer blocks)
- `01_Core/core_brand-visual.md` exists as a draft scaffold
  (ships with the vault)

---

## Steps

### Step 1 - Explain what's happening

Tell the user:

> Next I need your brand visuals. This is where Web Design OS
> turns from a template pack into your studio's production
> system.
>
> I'll ask you about three things:
>
> 1. Your display font and body font (typography)
> 2. Your brand colors (ink, paper, accent, muted, surface)
> 3. Your logo URL
>
> Once I have those, I'll apply them to all five master
> templates - strategy deck, client portal, proposal, contract,
> invoice - so every deliverable you generate from now on ships
> in your brand automatically. You'll preview each one in a
> browser before we move on.
>
> This takes about 15 minutes. Ready?

### Step 2 - Capture fonts

**Display font** (used for headings, hero text, editorial numerals):

> What display font do you use in your brand?
>
> 1. Name - e.g. "Fraunces", "Playfair Display", "Migra"
> 2. Where is it hosted?
>    - Google Fonts
>    - Adobe Fonts (Typekit)
>    - Self-hosted (you have a .woff2 file)
>    - System font (no embed needed)
> 3. If Google Fonts or Adobe Fonts, paste the embed code (the
>    `<link>` tag or `@import` URL)

Save:
- `display_font_name`
- `display_font_source`
- `display_font_embed` (the `<link>` tag or equivalent)
- `display_font_stack` - e.g. `'Fraunces', Georgia, serif`

**Body font** (paragraphs, labels, UI, captions):

Same three questions for the body font.

Save:
- `body_font_name`
- `body_font_source`
- `body_font_embed`
- `body_font_stack` - e.g. `'Inter', -apple-system, sans-serif`

Validation:

- If the designer only has one font (the display + body are the
  same), capture the same values twice and continue
- If the designer uses more than two fonts, tell them that v1.0
  templates support two font roles and ask them to pick the two
  most important
- Never invent a font embed URL. If the designer doesn't have
  one, walk them through finding it on Google Fonts directly

### Step 3 - Capture colors

Explain the five-token system:

> The templates use five color tokens. I need a hex value for
> each one. If you don't have a specific color for one of them,
> use a neutral from your palette and it'll work fine.
>
> - **Ink** - your primary text and heading color (usually near
>   black or a very dark brand color)
> - **Paper** - your primary background / canvas (usually near
>   white or an off-white from your brand)
> - **Accent** - your primary brand color, used for CTAs and
>   highlights
> - **Muted** - a mid-gray or subtle brand tone for borders,
>   secondary text, and faint backgrounds
> - **Surface** - section backgrounds and card fills (usually a
>   lighter tint of paper or accent)
>
> Paste each as a hex value starting with `#`.

Capture each. Validate:

- Starts with `#`
- Is 3, 4, 6, or 8 hex characters
- Ink and paper must have strong contrast (flag if not - the
  templates assume readable body copy)

Save:
- `color_ink`
- `color_paper`
- `color_accent`
- `color_muted`
- `color_surface`

If the designer only has 2 or 3 colors, suggest reasonable fills
from their existing palette:

> Your brand has 3 colors. For muted I'll use a 40% mix of your
> ink over paper, and for surface I'll use a 5% tint of paper.
> Sound good, or do you want to pick specific hex values?

### Step 4 - Capture logo

> What's your logo URL? This needs to be a stable public URL
> that every client HTML document can reference. Good options:
>
> - Your own website (e.g. `https://yourstudio.com/logo.svg`)
> - GitHub Pages
> - Cloudinary or any CDN
> - Imgur (not ideal long-term)
>
> SVG is preferred if you have it. PNG with a transparent
> background works too.

Validate it looks like a URL. Save `logo_url`.

> What width should the logo render at in document headers?
> Default is 160px. Most logos work fine at 120-180px.

Save `logo_width` as an integer.

Optional:

> Do you have a dark version of your logo for light-on-dark
> backgrounds? Paste the URL, or skip.

Save `logo_dark_url` or leave blank.

### Step 5 - Write core_brand-visual.md

Populate `01_Core/core_brand-visual.md` with everything captured
so far. Use the scaffold that already exists in the vault and
fill every field. Update the status from `draft` to `active`.

### Step 6 - Rewrite brand token blocks in each template

For each of the six master templates, replace two blocks:

**Block 1: Font embed (between `BRAND_FONTS_START` and
`BRAND_FONTS_END` comments)**

Replace the existing `<link>` tag(s) with the designer's
`display_font_embed` and `body_font_embed`. If they're both
hosted on the same service, combine into a single tag where
possible. Leave the HTML comment markers intact.

**Block 2: Brand tokens (inside the `:root` block labeled
BRAND TOKENS)**

Replace:

```css
--brand-serif: '[old display font]', [old fallback];
--brand-sans: '[old body font]', [old fallback];
--brand-ink: [old hex];
--brand-paper: [old hex];
--brand-paper-pure: [old hex or #FFFFFF];
--brand-accent: [old hex];
```

With:

```css
--brand-serif: [display_font_stack];
--brand-sans: [body_font_stack];
--brand-ink: [color_ink];
--brand-paper: [color_paper];
--brand-paper-pure: [color_paper or #FFFFFF - whichever is lighter];
--brand-accent: [color_accent];
```

Important rules:

- Only touch lines inside the BRAND TOKENS block - leave the
  rest of the CSS untouched
- Preserve existing variables that aren't brand tokens (like
  `--brand-name` which is populated per-client by
  workflow_create-proposal.md etc)
- If the template uses `--brand-muted` or `--brand-surface`,
  update those too. If not, add them to the `:root` block.

Apply to all six templates:

1. `06_Templates/template_strategy-deck.html`
2. `06_Templates/template_client-portal.html`
3. `06_Templates/template_proposal.html`
4. `06_Templates/template_contract.html`
5. `06_Templates/template_invoice.html`
6. `06_Templates/template_dashboard.html`

### Step 7 - Walk through each template in the browser

For each template in the same order as step 6:

**1. Save a preview copy**

Generate a filled preview of the template using placeholder
client data ("Acme Studio", "Sample Project", realistic dates,
example scope, example testimonials). Write it to:

```
00_System/previews/[template-name]-preview.html
```

Do not use the designer's real clients - this is a pure visual
preview.

**2. Tell the designer**

> Here's your [template name] in your brand. Open this file in
> a browser to preview it:
>
> `00_System/previews/[template-name]-preview.html`
>
> Look at:
>
> - Do the fonts render correctly (any fallbacks showing)?
> - Do the colors read well (contrast on body copy)?
> - Does the logo size and position feel right?
> - Does anything look off you want to adjust?

**3. Wait for feedback**

Ask explicitly:

> Approve this template as-is, or tell me what to change?

**4. Handle changes**

If the designer asks for changes, handle them inline:

- **Font doesn't render:** check the embed URL and re-apply
- **Color contrast is off:** prompt for a different hex
- **Logo is too big / small:** update `logo_width` and rewrite
- **Accent color looks wrong in context:** prompt for a
  different hex, rewrite all templates for consistency

Any change to a brand token must be applied to **all five**
templates, not just the one being previewed. Keep the master
templates in sync.

**5. Mark approved**

Once approved, log it to `00_System/system_brand-visual-review.md`:

```
- [template name]: approved [date]
```

Move to the next template.

### Step 8 - Final sanity check

After all six templates are approved:

1. Re-read `01_Core/core_brand-visual.md` and confirm every
   field is populated and matches what's in the templates
2. Confirm `00_System/system_brand-visual-review.md` has all
   five templates listed as approved
3. Delete the preview files in `00_System/previews/` - they were
   only for this walkthrough

### Step 9 - Confirm and close

Tell the user:

> Brand visuals are live across every template. Here's what
> changed:
>
> - **Display font:** [display_font_name]
> - **Body font:** [body_font_name]
> - **Ink:** [color_ink]
> - **Paper:** [color_paper]
> - **Accent:** [color_accent]
> - **Muted:** [color_muted]
> - **Surface:** [color_surface]
> - **Logo:** [logo_url] at [logo_width]px
>
> Every deliverable you generate from now on - proposals,
> contracts, invoices, client portals, strategy decks - will
> ship in your brand automatically. If you ever rebrand or
> tweak a color, say "update my brand visuals" and we'll walk
> through it again.

### Step 10 - Mark complete

Update `01_Core/core_brand-visual.md` status to `active` if not
already done in step 5.

---

## Validation

Before marking complete, verify:

- `01_Core/core_brand-visual.md` has all required fields
  populated and status is `active`
- All six master templates have the new brand tokens inside
  their BRAND TOKENS CSS block
- All six master templates have the new font embed inside the
  `BRAND_FONTS_START`/`BRAND_FONTS_END` markers
- `00_System/system_brand-visual-review.md` lists all five as
  approved
- No preview files left behind in `00_System/previews/`
- Hex values all start with `#`
- Em dashes are absent from every field (hard rule)

---

## When things go wrong

### Designer doesn't have their fonts figured out yet

Tell them:

> No problem. Brand typography is one of the biggest visual
> decisions, so it's worth getting right. Two quick suggestions:
>
> 1. If your own brand is still evolving, use the editorial
>    defaults for now (Fraunces for display, Inter for body).
>    You can re-run this workflow any time with "update my
>    brand visuals" once your brand is settled.
> 2. If you want to decide now, browse fonts.google.com and
>    look at editorial-style brands in your niche for cues.
>
> Which do you want to do?

### Designer's logo isn't hosted anywhere yet

Walk them through the simplest path:

> The easiest free option is to upload it to your own website
> in an `/assets/` folder, or use Cloudinary (free tier is
> plenty). Once it's hosted, paste the URL here. If you want to
> skip the logo for now, I can leave a text wordmark in the
> templates using your studio name from core_positioning.md
> and you can swap it in later.

### A template preview looks broken

Diagnose before rewriting:

- Font not loading? Check the embed URL by opening it directly
  in a browser
- Colors render wrong? Check that the hex value was saved as
  written (no extra whitespace, correct character count)
- Logo missing? Test the URL in a browser - it must load as a
  direct image, not a landing page
- Something else broken? Read the template's CSS around the
  area and compare to the unbroken editorial default

Never "fix" by rewriting the template body - only the brand
token block should have changed. If the body looks wrong, the
brand token values are wrong, not the markup.

### Designer asks to customize beyond brand tokens

For v1.0, the only approved customizations are the values in the
brand token block. Anything else (spacing, layout, typography
scale, section order) is out of scope for this workflow.

Tell them:

> v1.0 keeps template layouts fixed so every deliverable you
> generate is consistent with the editorial master design. The
> only per-designer customization is the brand token block -
> fonts, colors, and logo. If you want a fully custom layout
> for a specific client, that's a manual edit on the generated
> HTML file after the workflow runs, not a master template
> change.

### Designer wants to turn the accent color off

Some editorial brands don't use an accent color at all. If the
designer wants this, set `color_accent` to the same value as
`color_ink` so accent-styled elements render in ink. Mention it
explicitly when confirming:

> I've set accent to match ink, so anything the template paints
> in brand accent (button fills, underlines, highlights) will
> render in your primary ink color. The templates still look
> clean - just all-black editorial instead of black with a
> highlight.

---

## STOP

After approval and the core file is updated, stop and let the
user continue the onboarding sequence. Do not auto-chain into
other workflows unless the onboarding workflow is calling this
step as part of a larger sequence.
