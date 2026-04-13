---
type: workflow
slug: generate-portal
status: active
tags:
  - type/workflow
  - domain/client-management
aliases:
  - Generate Client Portal
---

# Workflow: Generate Client Portal

Generates or regenerates a client portal HTML file from the master template and the client's current project data. The portal is a single-page status view the client bookmarks - it shows milestones, next actions, and deliverable links.

---

## Trigger

User says any of:
- "generate portal for [client]"
- "update [client]'s portal"
- "regenerate the portal"
- "refresh the client portal"

Also called automatically by other workflows when project state changes significantly (e.g. after strategy deck delivery, after contract signing).

---

## Prerequisites

- Client folder must exist at `04_Clients/[client-slug]/`
- `client.md` must have Name and Project Type filled in
- `project-state.md` must exist with a valid Pipeline State
- `01_Core/core_positioning.md` must exist (for designer name + email)
- `01_Core/core_brand-visual.md` status must be `active`
- `00_System/system_brand-visual-review.md` must list
  `template_client-portal.html` as approved

If any prerequisite is missing, tell the user what's needed and stop.

---

## Steps

### Step 1 - Load sources

Read all of:

1. `06_Templates/template_client-portal.html` (master template)
2. `04_Clients/[client-slug]/client.md` (client details)
3. `04_Clients/[client-slug]/project-state.md` (pipeline state, actions, dates, deliverables)
4. `01_Core/core_positioning.md` (designer name, email)
5. `01_Core/core_booking.md` (booking URL)

### Step 2 - Map pipeline state to milestones

Read the Pipeline State field from `project-state.md`. Map it to the 6 portal milestones using this table:

| Pipeline State   | Milestone 1 (Confirmed) | Milestone 2 (Brief) | Milestone 3 (Strategy) | Milestone 4 (Copy) | Milestone 5 (Design) | Milestone 6 (Launch) |
|-----------------|------------------------|---------------------|----------------------|--------------------|--------------------|---------------------|
| lead            | current                | pending             | pending              | pending            | pending            | pending             |
| qualified       | current                | pending             | pending              | pending            | pending            | pending             |
| proposal sent   | current                | pending             | pending              | pending            | pending            | pending             |
| strategy        | done                   | done                | current              | pending            | pending            | pending             |
| design          | done                   | done                | done                 | done               | current            | pending             |
| revisions       | done                   | done                | done                 | done               | current            | pending             |
| launched        | done                   | done                | done                 | done               | done               | done                |
| archived        | done                   | done                | done                 | done               | done               | done                |

For each milestone:
- **done** - add class `milestone--done`, set status text to `Complete`
- **current** - add class `milestone--current`, set status text to `In progress`
- **pending** - no extra class, set status text to `Pending`

Also check project-state.md Milestones section for finer detail:
- If Pipeline State is `strategy` but "AI interview complete" is not yet ticked, milestone 2 (Brief) should be `current` instead of `done`, and milestone 3 stays `pending`
- If Pipeline State is `strategy` and "Strategy presented" is ticked, milestone 3 stays `current` but status text changes to `Review`
- If Pipeline State is `design` and "Copy approved by client" is not ticked, milestone 4 should be `current` instead of `done`

These overrides make the portal more accurate than a simple pipeline-state lookup.

### Step 3 - Map current status display text

Convert the Pipeline State to client-friendly display text for `[CURRENT_STATUS]`:

- lead -> "Getting started"
- qualified -> "Getting started"
- proposal sent -> "Proposal sent"
- strategy -> "Strategy in progress"
- design -> "Design in progress"
- revisions -> "Revisions in progress"
- launched -> "Launched"
- archived -> "Project complete"

### Step 4 - Build action items

Read the Next Actions section from `project-state.md`. Filter for actions that are relevant to the client (not internal designer tasks).

**Client-relevant categories:** `calls`, `revisions`, `testimonials`

**Always client-relevant actions (regardless of category):**
- Anything that says "book", "schedule", "review", "approve", "feedback", "send content", "fill in"

**Never client-facing actions:**
- "Draft proposal", "Generate strategy deck", "Set up design system", or any purely designer-side task

For each client-relevant action (max 2):
- `[ACTION_N_TITLE]` - rewrite the action text in client-friendly language (e.g. "Address round 2 feedback" becomes "Review the latest design updates")
- `[ACTION_N_DESCRIPTION]` - one sentence explaining what the client needs to do
- `[ACTION_N_LINK]` - use `[BOOKING_URL]` from `core_booking.md` for any meeting/call action, or link to the relevant deliverable for review actions
- `[ACTION_N_BUTTON]` - short CTA label (e.g. "Book meeting", "Review designs", "Send feedback")

If only one action exists, remove the second `.action` block from the HTML.

If no client actions exist, replace the actions section content with:

```html
<p class="lead">Nothing needed from you right now. We'll be in touch when the next step is ready.</p>
```

### Step 5 - Map deliverable statuses

For each of the 6 deliverables, check `project-state.md` "Deliverables Ready" section and the client's `deliverables/` folder:

| Deliverable      | Link placeholder         | File to check                        |
|-----------------|-------------------------|--------------------------------------|
| Proposal         | [PROPOSAL_LINK]          | deliverables/proposal.html           |
| Contract         | [CONTRACT_LINK]          | deliverables/contract.html           |
| Invoice          | [INVOICE_LINK]           | deliverables/invoice.html            |
| Strategy Deck    | [STRATEGY_DECK_LINK]     | deliverables/strategy-deck.html      |
| Website Copy     | [WEBSITE_COPY_LINK]      | deliverables/website-copy.html       |
| Design Preview   | [DESIGN_PREVIEW_LINK]    | deliverables/design-preview.html     |

For each:
- If the file exists and the deliverable is ticked in Deliverables Ready: link to the file, status = `Complete`
- If the file exists but not ticked: link to the file, status = `Sent`
- If the file doesn't exist: link = `#`, status = `Pending`

Special cases:
- Contract status should be `Signed [DATE]` if the contract milestone is done (check Milestones > Contract signed)
- Invoice status should show `Paid` if Pipeline State is past `strategy` (deposit was required to proceed)

### Step 6 - Map project dates

Read the Key Dates section from `project-state.md` and map:

- `[DATE_CONFIRMED]` <- Key Dates > Kickoff (format as "DD MMM" e.g. "15 Apr")
- `[DATE_BRIEF]` <- Key Dates > Interview deadline
- `[DATE_STRATEGY_MEETING]` <- Key Dates > Strategy meeting
- `[DATE_COPY_REVIEW]` <- Key Dates > Copy feedback deadline
- `[DATE_DESIGN_PRESENTATION]` <- Key Dates > Design review 1
- `[DATE_LAUNCH]` <- Key Dates > Launch target

If a date is blank, use "-" as the value.

### Step 7 - Populate identity placeholders

- `[CLIENT_NAME]` <- client.md Name field
- `[CLIENT_FIRST_NAME]` <- first name from above
- `[PROJECT_TYPE]` <- client.md Project Type field
- `[DESIGNER_NAME]` <- core_positioning.md Name field
- `[DESIGNER_FIRST_NAME]` <- first name from above
- `[DESIGNER_EMAIL]` <- core_positioning.md Email field
- `[YEAR]` <- current year

### Step 8 - Handle welcome video

If the designer has provided a Loom URL for this client (check client.md or ask):
- Replace the `.welcome-video` contents with an iframe embed:
  ```html
  <iframe src="[LOOM_EMBED_URL]" allowfullscreen></iframe>
  ```
- Convert share URL to embed URL (replace `loom.com/share/` with `loom.com/embed/`)

If no video URL exists:
- Remove the entire welcome video `<section>` block

### Step 9 - Assemble and write

1. Load the master template
2. Replace all placeholders with the mapped values
3. Preserve the BRAND TOKENS and BRAND_FONTS blocks exactly as they are in the master template (these were set during onboarding)
4. Write to `04_Clients/[client-slug]/deliverables/portal.html`

### Step 10 - Present to user

> Portal generated for [client name].
> File: `04_Clients/[client-slug]/deliverables/portal.html`
>
> Open it in a browser to preview. Current state:
> - Pipeline: [state]
> - Active milestone: [milestone name]
> - Client actions: [count] items
> - Deliverables linked: [count] of 6
>
> Want me to adjust anything, or is this ready to send?

---

## Regeneration

This workflow is designed to be run multiple times per client. Each run overwrites the previous portal HTML with current data. Run it whenever:

- Pipeline state changes
- A new deliverable is generated
- Key dates are updated
- The designer wants to refresh the client's view

---

## STOP

After generating the portal and presenting to the user, stop. Do not auto-chain into email workflows or other client management workflows.
