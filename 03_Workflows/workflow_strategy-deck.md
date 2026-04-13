---
type: workflow
slug: strategy-deck
status: active
tags:
  - type/workflow
  - domain/strategy
---

# Workflow: Generate Strategy Deck

The master strategy workflow. Runs all the individual strategy workflows in sequence, then generates the final HTML strategy deck combining everything.

---

## Trigger

- "generate strategy deck"
- "run full strategy for [client]"
- "build the strategy deck"

---

## Prerequisites

- Brief file complete
- On custom path: refinement meeting must be complete
- Core files exist (`01_Core/`)
- `01_Core/core_brand-visual.md` status is `active` (the master
  template has the designer's brand tokens baked in)
- `00_System/system_brand-visual-review.md` lists
  `template_strategy-deck.html` as approved. If not, tell the
  user:

  > Your strategy deck master template hasn't been approved in
  > your brand yet. Run `workflow_onboarding-brand-visual.md`
  > first, or say "update my brand visuals" and we'll walk
  > through template approval before generating any client
  > decks.

  Stop until this is resolved. Generated decks must always ship
  in the designer's brand - never in the default editorial
  palette.

---

## Pre-check

Before running, verify:

### For custom path:
Check `04_Clients/[client-slug]/brief.md` for the Strategy Refinement Meeting Notes section.

If NOT present:
> This is a custom-path project. The strategy refinement meeting should happen before I auto-generate the full strategy deck. This is where the human strategic nuance gets added.
>
> Should I:
> 1. Run `workflow_strategy-refinement-meeting.md` first
> 2. Skip the refinement (not recommended for custom work)
> 3. Wait while you schedule the meeting with the client

If they skip, note it in the project state.

### For productized/self mode:
Proceed directly.

---

## Steps

### Step 1 - Confirm scope

> Ready to generate the full strategy deck. This will run:
>
> 1. Brand story script
> 2. Brand identity (Golden Circle, mission, values, tone)
> 3. Customer personas
> 4. Competitor analysis (with optional web research)
> 5. Creative direction
> 6. Sitemap
> 7. Final HTML strategy deck combining everything
>
> Takes 5-15 minutes depending on research depth. Ready?

### Step 2 - Run each strategy workflow in sequence

For each workflow, call it and wait for completion before moving to the next:

1. `workflow_brand-story-script.md`
2. `workflow_brand-identity.md`
3. `workflow_customer-personas.md`
4. `workflow_competitor-analysis.md`
5. `workflow_creative-direction.md`
6. `workflow_sitemap.md`

During each, if running as part of the full workflow, auto-approve draft output so we don't stop for review at each step. Save outputs to the client strategy folder.

After all 6 complete, do a full review pass:

> All 6 strategy components generated. Want to:
>
> 1. Review them one by one before assembling the HTML deck
> 2. Go straight to assembling the HTML deck now

### Step 3 - Assemble the HTML strategy deck

Read the approved master template:
`06_Templates/template_strategy-deck.html`

This template already has the designer's fonts, colors, and
logo baked into the brand token block from
`workflow_onboarding-brand-visual.md`. Never overwrite or
re-style the brand tokens in this step. Only the per-client
content placeholders get populated.

Read all 6 strategy output files from
`04_Clients/[client-slug]/strategy/`

Read the visual design system:
`02_Frameworks/framework_strategy-deck-design.md`

Read the page-by-page structure:
`02_Frameworks/framework_strategy-deck-structure.md`

Generate the final HTML file by:

1. Loading the approved master template
2. Injecting client name in cover and footer
   (`[CLIENT_NAME]` placeholder)
3. Populating each section with content from the strategy
   outputs (see placeholder map below)
4. Preserving the BRAND TOKENS block and BRAND_FONTS block
   exactly as they are in the master template
5. Adding placeholder image references for moodboard (designer
   adds actual images later, or generates via the Visual
   Direction Engine)
6. Removing or populating the `[DESIGNER_NAME]` cover signature
   from `core_positioning.md`

#### Transformation page (Page 14)

The template has 4 struggle/transformation rows with
placeholders `[STRUGGLE_1]` through `[STRUGGLE_4]` and
`[TRANSFORMATION_1]` through `[TRANSFORMATION_4]`.

Extract these from the brand story script output:

- **Struggles** come from sections 1 (A Character), 2
  (External Problem), 3 (Internal Problem), and 5 (Villain).
  Distil each into one short sentence describing the before
  state.
- **Transformations** come from section 6 (Positive Outcomes).
  Pick the 4 strongest outcomes and write each as one short
  sentence describing the after state.

Each cell should be 1-2 sentences max. These are visual
summary cards, not full paragraphs.

#### Sitemap page (Page 19)

The template defaults to a 4-page x 3-section grid
(`[PAGE_1_NAME]` through `[PAGE_4_NAME]`, `[SECTION_1_NAME]`
through `[SECTION_12_DESC]`).

If the sitemap output has a different structure:

- **Fewer than 4 pages:** remove the unused `<div>` blocks
  from the HTML
- **More than 4 pages:** duplicate a page block and increment
  the placeholder numbers
- **Fewer or more than 3 sections per page:** add or remove
  `.sitemap-section` divs within the page block

Always validate the sitemap workflow output against the
template structure before injecting.

Save to `04_Clients/[client-slug]/deliverables/strategy-deck.html`

### Step 3a - Offer optional per-client refinement pass

After assembly, ask the designer:

> The deck is assembled using your approved master template.
> Want an optional per-client refinement pass?
>
> 1. **No thanks** - keep the master template brand as-is and
>    move on
> 2. **Accent color tweak for this client** - shift the accent
>    color just for this one deck (useful if the client's own
>    brand is being referenced)
> 3. **Per-section polish** - walk through each section and
>    fine-tune copy, layout, or imagery
> 4. **Both** - do the accent tweak AND the per-section polish

If the designer picks option 2 or 4:

- Ask for the new accent hex value
- Update ONLY this client's generated HTML file (not the master
  template)
- Update ONLY the `--brand-accent` token in this file's
  `:root` block
- Leave every other brand token untouched

If the designer picks option 3 or 4:

- Walk through each page group (identity, audience, marketing,
  website, creative) one by one
- At each, show a quick summary of what's in that section and
  ask if any line needs a rewrite
- Apply requested changes inline in the client's file only

Under no circumstances edit `06_Templates/template_strategy-deck.html`
in this step. The master template only changes via
`workflow_onboarding-brand-visual.md`. Per-client tweaks live in
the generated file inside the client folder.

### Step 4 - Preview and present

Tell the user:

> Strategy deck generated. The file is at:
> `04_Clients/[client-slug]/deliverables/strategy-deck.html`
>
> Open it in a browser to preview. The moodboard section has placeholders - the designer needs to curate and add the actual reference images.
>
> What's next?
>
> - `review the strategy deck` - I'll walk through each section with you
> - `start copy generation` - move to the copy engine
> - `refine a specific section` - adjust any section that needs work
> - `regenerate with different direction` - scrap and redo with a different angle

### Step 5 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** stays at `strategy`
- Tick all Strategy section milestones:
  - `[x] Brand story script generated`
  - `[x] Brand identity generated`
  - `[x] Customer personas generated`
  - `[x] Competitor analysis complete`
  - `[x] Creative direction set`
  - `[x] Sitemap designed`
  - `[x] Strategy deck assembled`
- Move the "Generate strategy deck" action from Next Actions
  to Done with today's date.
- **Next Actions:** append
  ```
  - [ ] high [calls] Present strategy deck to [client] | due: [today + 5 days]
  ```
- Add deliverable: `strategy-deck.html`

---

## When things go wrong

### If a component generation fails:
Stop the sequence. Show the error. Let the user decide whether to retry or skip that component.

### If the HTML template is missing:
Tell the user:
> The HTML template is missing. This might mean the product needs an update. Run `update system` to get the latest templates, or I can generate a simple fallback HTML deck.

### If client data is insufficient:
Stop. Show what's missing. Send the user back to run the AI interview or refinement meeting.

---

## STOP

After generating the strategy deck, stop and let the user decide the next step. Do not auto-chain into copy generation.
