---
type: workflow
slug: dashboard
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Generate Client Dashboard

Reads every client folder in `04_Clients/`, pulls each one's
Pipeline State and Next Actions, and generates:

1. **`04_Clients/dashboard.html`** - the kanban view with 7
   live columns split into two labeled rows:
   - **Leads row** (3 columns): lead, qualified, proposal sent
   - **Projects row** (4 columns): strategy, design, revisions,
     launched
   - Plus a "Needs attention" panel at the top, and a collapsed
     inline archive toggle below both rows

2. **`04_Clients/[client-slug]/workspace.html`** - a
   designer-side detail page generated per client, one file
   per folder. Contains this client's full status, a filtered
   version of the Needs Attention panel (this client's actions
   only), a milestones timeline, links to generated client
   deliverables (proposal, contract, invoice, portal, strategy
   deck), and an internal-only resources grid linking to
   brief.md, client.md, project-state.md, strategy.md,
   copy.md, emails.md, feedback.md, and the deliverables/
   folder. Opened when the designer clicks a card on the main
   dashboard. Reuses the same collapsible `<details>` attention
   group pattern as the main dashboard.

Archived clients are deliberately hidden from the kanban so
long-term client history doesn't crowd out active work. The
archive is a collapsed `<details>` toggle at the bottom of the
dashboard - clicking it expands an inline list of every
archived client without leaving the page. No separate archive
page in v1.

The dashboard is the designer's daily home screen. Running it
takes two seconds. Regenerating it is idempotent - no state is
written, the HTML is overwritten every time.

---

## Trigger

- "show my dashboard"
- "open my dashboard"
- "refresh my dashboard"
- "generate dashboard"
- "what's happening with my clients"
- "what do I need to do today"

---

## Prerequisites

- Client mode enabled (`00_System/system_mode.md`)
- At least one client folder exists in `04_Clients/` (or the
  dashboard will render with empty columns, which is still
  useful)
- `06_Templates/template_dashboard.html` and
  `06_Templates/template_client-workspace.html` both exist
  and have been approved during brand-visual onboarding

If brand-visual onboarding hasn't approved the dashboard
template yet, tell the user:

> Your dashboard template hasn't been approved in your brand
> yet. Run `update my brand visuals` first so the dashboard
> matches the rest of your deliverables.

---

## Pipeline state vocabulary

The dashboard reads the `Pipeline State` field from each
client's `project-state.md`. Allowed values (lowercase, exact):

**Leads row**

- `lead` - new inquiry, not yet qualified
- `qualified` - discovery call booked or complete, ready for
  a proposal
- `proposal sent` - proposal delivered, waiting for client to
  accept, sign contract, and pay deposit

**Projects row**

- `strategy` - contract signed, deposit paid, AI interview +
  strategy work in progress (brand identity, personas,
  competitor analysis, strategy deck)
- `design` - strategy approved, copy written, design in
  progress (design system, homepage, full site)
- `revisions` - designs presented, client feedback rounds in
  progress
- `launched` - site is live, handover sent, but post-launch
  actions still pending (testimonial request, support
  check-in, case study draft). Stays here until everything
  is closed out.

**Archived (collapsed toggle, not in kanban)**

- `archived` - fully closed, no expected activity, stored
  for reference only

If a client's state is missing or doesn't match one of the
seven, fall back to this mapping (legacy values from earlier
project-state templates):

| Old value | New value |
|---|---|
| `Lead` | lead |
| `Discovery` | qualified |
| `Proposal` | proposal sent |
| `Contract` (not signed) | proposal sent |
| `Contract` (signed) | strategy |
| `contract signed` (legacy) | strategy |
| `in progress` (legacy) | strategy |
| `Kickoff` | strategy |
| `Interview` | strategy |
| `Refinement` | strategy |
| `Strategy` | strategy |
| `Copy` | strategy |
| `Design` | design |
| `Revisions` | revisions |
| `Launch` | launched |
| `Launched` | launched |
| `Handover` | launched |
| `delivered` | launched |
| `Delivered` | launched |
| `Complete` | launched |

If the value is something else entirely, flag it to the user
after generation:

> [client-slug] has pipeline state "[value]" which isn't one
> of the seven canonical states. I've placed them in
> [best guess] for now - open their project-state.md and set
> the Pipeline State field to one of: lead, qualified,
> proposal sent, strategy, design, revisions, launched,
> archived.

---

## Steps

### Step 1 - Load the template

Read `06_Templates/template_dashboard.html` into memory. This
already has the designer's brand tokens (fonts, colors, logo)
baked in from `workflow_onboarding-brand-visual.md` - do not
touch the BRAND_FONTS or BRAND TOKENS blocks.

### Step 2 - Scan the clients folder

List every subdirectory in `04_Clients/` except `_template`.
Each one is a client.

For each client directory:

1. Read `client.md` to get:
   - `client_name` - full name
   - `client_business` - business name
   - `project_type` - the project type tag
   - `path` - productized or custom

2. Read `project-state.md` to get:
   - `pipeline_state` - from the Pipeline State section
   - `next_actions` - parsed from the Next Actions section
   - `milestones_done` and `milestones_total` - counted from
     every `- [ ]` and `- [x]` in the Milestones subsections
   - `kickoff_date` - optional

3. If any required field is missing, still include the client
   in the dashboard but mark the missing field as `[unknown]`
   in the card and note it in the post-generation report.

### Step 3 - Parse next actions

For each client, the Next Actions section looks like:

```
- [ ] urgent [revisions] Address round 2 feedback | due: 2026-04-11
- [ ] high [proposals] Follow up on proposal | due: 2026-04-15
- [ ] normal [calls] Schedule strategy call | due: -
```

Parse each line into an object:

- `client_slug`
- `client_name` (for the chip label)
- `priority` - one of `urgent`, `high`, `normal`, `low`
- `category` - one of `calls`, `proposals`, `strategy`,
  `copy`, `design`, `revisions`, `launch`, `testimonials`,
  `admin`
- `text` - the action description
- `due_date` - YYYY-MM-DD or null

Category vocabulary (used to group the Needs Attention panel
for batch-doing work across projects):

- **calls** - discovery calls, strategy meetings, design
  reviews, launch calls, check-in calls
- **proposals** - drafting, sending, following up on proposals
- **strategy** - brand work, AI interview prep, strategy
  deck polish, refinement meetings, competitor research
- **copy** - writing homepage, about, services, sales, contact,
  ecommerce copy
- **design** - page designs, design systems, image sourcing,
  visual direction work
- **revisions** - addressing client feedback on designs or copy
- **launch** - pre-launch checks, go-live work, handover
- **testimonials** - chasing, drafting testimonial requests
- **admin** - invoicing, chasing payments, general coordination
  that doesn't fit another category

If a line doesn't parse (missing priority, missing category,
wrong format), still include it with priority `normal` and
category `admin`, then flag the mismatch in the post-generation
report.

If the category is something outside the nine canonical values,
place it in `admin` and flag it.

**Automated tasks are never on the dashboard.** The hard rule
in `project-state.md` is that automated tasks (Formsubmit
email relay, Stripe webhooks, workflow regeneration, scheduled
reminders that run without human intervention) must not be
written to Next Actions at all. The dashboard is only for work
that needs the designer's attention. If you see a line that
looks like an automated system event ("auto-send confirmation",
"system sent reminder", etc.), skip it and flag it for
cleanup - it shouldn't be in Next Actions in the first place.

### Step 4 - Compute per-client derived fields

For each client:

1. **Progress percent** (strategy, design, revisions,
   launched only - every client in the Projects row):
   `milestones_done / milestones_total` as an integer 0-100.
2. **Top next action** - the highest-priority unchecked item
   from their Next Actions list. Priority order:
   urgent > high > normal > low. Ties broken by earliest
   due date.
3. **Card type** - one of:
   - `minimal` - name, business, path tag (for lead,
     qualified)
   - `proposal` - minimal + days-since-sent tag (for
     proposal sent)
   - `project` - minimal + progress bar + top next action
     (for strategy, design, revisions, launched)

### Step 5 - Sort and group

Group clients by pipeline state into seven kanban columns
split across two rows plus one archive bucket:

**Leads row:** lead, qualified, proposal sent
**Projects row:** strategy, design, revisions, launched
**Archive bucket:** archived

Archived clients do NOT render in either kanban row. They go
into the inline archive toggle below the board - a native
`<details>` element collapsed by default, which expands to show
a simple list of rows on click. No separate page.

Within each column, sort by:

1. Has an urgent or high priority action? (urgent first, then
   high)
2. Due date (earliest first)
3. Kickoff date descending (most recent first)
4. Client name alphabetical (final tiebreak)

### Step 6 - Build the Needs Attention groups

Collect every unchecked action from every **non-archived**
client. Archived clients are excluded from the attention panel
entirely - if a project is archived it shouldn't be asking for
attention anymore.

Group the actions by `category`. Each group becomes one
section in the Needs Attention panel, so the designer can
batch similar work across multiple clients ("let's do all
revisions today", "knock out the proposal follow-ups in one
sitting").

For each group, compute a `max_priority` - the highest
priority of any action in it. Priority order:
`urgent` > `high` > `normal` > `low`.

Sort groups by:

1. `max_priority` descending (urgent groups first)
2. Earliest due date in the group (earliest first, null
   dates last)
3. Group size descending (more items first)
4. Category name alphabetical (final tiebreak)

Within each group, sort actions by:

1. Priority (urgent > high > normal > low)
2. Due date (earliest first, null last)
3. Client name alphabetical Sort by:

1. Priority (urgent > high > normal > low)
2. Due date (earliest first, null due dates last within each
   priority)
3. Client name alphabetical

For each action, compute a `due_label`:

- If due date is null: `-`
- If due date is today: `Today`
- If due date is tomorrow: `Tomorrow`
- If due date is in the past: `Overdue by [N] days` and set
  the `data-overdue="true"` attribute
- If due date is within 7 days: `In [N] days`
- Otherwise: `[Month Day]` (e.g. "Apr 22")

Cap the panel at 20 items. If there are more than 20, show the
top 20 by the sort above and append a final row:

> `+ [N] more in client files`

### Step 7 - Populate the template

Walk through every placeholder and comment-block marker in
`template_dashboard.html` and replace:

**Top-level placeholders:**

| Placeholder | Value |
|---|---|
| `[DESIGNER_NAME]` | from `core_positioning.md` |
| `[DATE]` | today, formatted "10 April 2026" |
| `[TOTAL_ACTIVE_COUNT]` | count of clients in lead, qualified, proposal sent, or contract signed |
| `[ATTENTION_COUNT]` | total unchecked actions across all clients |
| `[LEAD_COUNT]`, `[QUALIFIED_COUNT]`, `[PROPOSAL_SENT_COUNT]` | Leads row counts |
| `[STRATEGY_COUNT]`, `[DESIGN_COUNT]`, `[REVISIONS_COUNT]`, `[LAUNCHED_COUNT]` | Projects row counts |
| `[ARCHIVED_COUNT]` | total archived clients (appears in the collapsed archive toggle, not in any column) |

**Needs Attention groups:**

Replace everything between the `ATTENTION_GROUPS_START` and
`ATTENTION_GROUPS_END` comment markers.

If there are zero items across all clients, keep the empty
state:

```html
<div class="attention__empty">Nothing urgent. Good place to be.</div>
```

Otherwise, render one `.attention__group` per category that
has at least one item. Skip categories with zero items
entirely - do not render empty groups.

Each group is a native `<details>` element, collapsed by
default. The designer sees just the 6-or-so category headings
and clicks to expand whichever one they want to batch.

```html
<details class="attention__group" data-max-priority="[priority]">
    <summary class="attention__group-header">
        <span class="attention__group-chevron">›</span>
        <span class="attention__group-name">[Category Title]</span>
        <span class="attention__group-count">[N]</span>
        <span class="attention__group-preview" data-overdue="[true|false]">[top preview label]</span>
    </summary>
    <div class="attention__group-items">
        <div class="attention__item" data-priority="[priority]">
            <span class="attention__priority"></span>
            <span class="attention__text">[action text]</span>
            <a class="attention__client" href="../[client-slug]/">[client name]</a>
            <span class="attention__due" data-overdue="[true|false]">[due label]</span>
        </div>
        ... more items ...
    </div>
</details>
```

**Top preview label:** the `attention__group-preview` field
shows the due label of the highest-priority, earliest-due
item in the group. Examples: "Overdue by 2 days", "Today",
"Tomorrow", "In 3 days", "Apr 20". Set `data-overdue="true"`
if that top item is past due, so the label renders in the
urgent red. This keeps the collapsed row informative - the
designer knows which group is most time-sensitive without
opening anything.

Render the category name with sentence case (e.g. "Proposals",
"Calls", "Revisions"), not lowercase. Never render a group
expanded by default - the scan-first UX depends on everything
being collapsed.

Cap the total panel at 20 items. Count only rendered items.
If more than 20 items exist across all groups, trim items from
the LOWEST priority group first, then the next lowest, until
the total is under 20. Append a final row after the last
group:

```html
<div class="attention__overflow">+ [N] more in client files</div>
```

**Column cards:**

For each of the seven kanban columns (no archived column),
replace everything between its `CARDS_START` and `CARDS_END`
comment markers.

If the column has zero clients, keep the default empty state
(e.g. `<div class="column__empty">No leads</div>`).

If the column has cards, render one `<a class="card">` block
per client using the reference markup at the bottom of the
template file. Apply these variants by column:

- **Lead, qualified** - minimal card: name, business, path
  tag, next action (only if present)
- **Proposal sent** - minimal card + a `card__tag` showing
  "sent [N] days ago" (derived from the action date, kickoff
  date, or "sent recently" if not computable)
- **Strategy, design, revisions, launched** - full project
  card: name, business, path tag, project type tag, progress
  bar (`card__progress` block showing overall milestone
  completion as a percentage across the whole project, not
  just the current phase), next action

The card's `href` points to `[client-slug]/workspace.html` so
clicking opens the per-client workspace page generated in
step 8a (not the raw client folder).

**Archive rows (below the kanban):**

Replace everything between the `ARCHIVE_ROWS_START` and
`ARCHIVE_ROWS_END` comment markers inside the
`<details class="archive">` element.

If there are zero archived clients, keep the empty state.

Otherwise render one `<a class="archive__row">` per archived
client, sorted by the archived date (most recent first). Each
row has: client name, business name, project type, archived
date (short format e.g. "Mar 2026"), right arrow. The row's
`href` points to `[client-slug]/workspace.html` so clicking
an archived client opens their workspace page the same way
an active client does.

### Step 8 - Write the main dashboard file

Write the populated main kanban HTML to:

```
04_Clients/dashboard.html
```

This is a well-known location. Not in a per-client folder -
the dashboard lives at the top of the clients directory so
every client folder is a subdirectory of it. Card links point
to each client's workspace page at `[client-slug]/workspace.html`
(relative path, resolves correctly because dashboard.html lives
in the same parent directory).

### Step 8a - Generate per-client workspace files

For every non-archived client, load
`06_Templates/template_client-workspace.html` and populate a
per-client workspace page. Write each one to:

```
04_Clients/[client-slug]/workspace.html
```

Populate the following placeholders for each client:

| Placeholder | Source |
|---|---|
| `[CLIENT_NAME]` | `client.md` |
| `[CLIENT_BUSINESS]` | `client.md` |
| `[CLIENT_INDUSTRY]` | `client.md` |
| `[PROJECT_TYPE]` | `client.md` |
| `[PATH]` | `client.md` (productized / custom) |
| `[PIPELINE_STATE_UPPER]` | `project-state.md` Pipeline State, uppercased |
| `[KICKOFF_DATE]` | `project-state.md` |
| `[MILESTONES_DONE]`, `[MILESTONES_TOTAL]` | Milestones section count |
| `[PROGRESS_PERCENT]` | integer 0-100 |
| `[ATTENTION_COUNT]` | count of this client's unchecked Next Actions |
| `[CURRENT_PHASE]` | a short free-text description of where the project is (e.g. "Design round 1") |
| `[DESIGNER_NAME]` | `core_positioning.md` |
| `[DATE]` | today |

**CLIENT_ATTENTION_GROUPS_START/END:**
Render the same category-grouped `<details>` structure as the
main dashboard, but filtered to only this client's actions.
Same rules: one group per non-empty category, collapsed by
default, top preview label, sorted by max priority.

**MILESTONES_START/END:**
Render one `.milestone` row per item in the Milestones section
of `project-state.md`. Status mapping:

- Item is `[x]` → `data-status="complete"`
- Item is the first unchecked item in the current phase →
  `data-status="active"`
- Every other unchecked item → `data-status="pending"`

If total milestones > 12, collapse completed ones older than
the 3 most recent completes to keep the list scannable. Show:
the 3 most recent completes + all active + all pending.

**DELIVERABLES_START/END:**
Check for the existence of each file in the client's
`deliverables/` folder. Only render rows for files that
actually exist. Order: proposal → contract → invoice → portal
→ strategy-deck. Status is `ready` for every existing file
unless `project-state.md` flags it as `sent` (then use `Sent`).

**RESOURCES_START/END:**
Fixed 8-tile grid. For each resource, check if the file
exists. Existing files get a live link with the normal style.
Missing files get `class="resource resource--disabled"` and
no href (visually grayed out so the designer knows what's
possible but not yet created).

Resource list:

1. `brief.md` - "Brief" / "Discovery + AI interview notes" (icon: 📄 or "B")
2. `client.md` - "Client info" / "Basic details" (icon: "i")
3. `project-state.md` - "Project state" / "Pipeline, milestones, actions" (icon: "◎")
4. `strategy.md` - "Strategy notes" / "Strategy + refinement" (icon: "S")
5. `copy.md` - "Copy document" / "All page copy" (icon: "¶")
6. `emails.md` - "Email log" / "Every message sent" (icon: "✉")
7. `feedback.md` - "Feedback log" / "Client feedback rounds" (icon: "💬" or "F")
8. `deliverables/` - "Deliverables folder" / "All generated files" (icon: "▢")

Keep icon text to a single ASCII character or glyph - do not
use emojis in the final HTML output (follow the no-emoji rule
for generated content).

**Archived clients get a workspace file too** - same template,
same sections, but with a muted header state and every file
typically shown as complete. Don't skip them just because they
don't render on the main dashboard.

### Step 8b - Render internal resources to HTML

For every non-archived client, render each existing markdown
file in the client folder to a companion HTML file using
`06_Templates/template_resource-page.html`. This is what makes
the Internal Resources tiles on the workspace page clickable
in a browser - without this step, clicking a `brief.md` tile
just downloads the raw markdown.

**Files to render (only if they exist in the client folder):**

| Source | Output | Kind label | Title label |
|---|---|---|---|
| `brief.md` | `brief.html` | `BRIEF` | Brief |
| `client.md` | `client.html` | `CLIENT INFO` | Client information |
| `project-state.md` | `project-state.html` | `PROJECT STATE` | Project state |
| `strategy.md` | `strategy.html` | `STRATEGY` | Strategy notes |
| `copy.md` | `copy.html` | `COPY` | Copy document |
| `emails.md` | `emails.html` | `EMAIL LOG` | Email log |
| `feedback.md` | `feedback.html` | `FEEDBACK` | Feedback log |

**For each source file:**

1. Read the raw markdown content
2. Strip the YAML frontmatter block at the top (everything
   between the first and second `---` lines)
3. Convert the remaining markdown to HTML using standard
   rules:
   - `# H1` → `<h1>`
   - `## H2` → `<h2>`
   - `### H3` → `<h3>`
   - `#### H4` → `<h4>`
   - `**bold**` → `<strong>`
   - `*italic*` → `<em>`
   - `` `code` `` → `<code>`
   - triple-backtick blocks → `<pre><code>`
   - `[text](url)` → `<a>`
   - `- item` → `<ul><li>`
   - `1. item` → `<ol><li>`
   - `- [ ]` / `- [x]` → checkbox input (unchecked/checked)
   - `> quote` → `<blockquote>`
   - `---` on its own line → `<hr>`
   - `| table |` rows → `<table>`
4. Load `06_Templates/template_resource-page.html`
5. Populate placeholders:
   - `[CLIENT_NAME]` - from client.md
   - `[RESOURCE_TITLE]` - title label from table above
   - `[RESOURCE_KIND]` - kind label from table above
   - `[SOURCE_FILE_PATH]` - relative filename (e.g. `brief.md`)
   - `[LAST_MODIFIED]` - file mtime, formatted "10 Apr 2026"
   - `[DESIGNER_NAME]` - from `core_positioning.md`
   - `[DATE]` - today
6. Replace the content between `RESOURCE_BODY_START` and
   `RESOURCE_BODY_END` comment markers with the converted HTML
7. Write the file to the same folder as the source (e.g.
   `04_Clients/[client-slug]/brief.html`)

**Do not render `workspace.html` (it's generated in step 8a)
or any file in `deliverables/` (those are client-facing HTML
already).**

**Archived clients:** skip this step entirely for archived
clients - their markdown files are frozen state, no point
re-rendering on every dashboard refresh.

### Step 9 - Open in the browser

Tell the user:

> Dashboard generated. Open it at:
>
> `04_Clients/dashboard.html`
>
> [N] active clients, [M] items in Needs Attention.
>
> - [X] urgent, [Y] high priority
> - [Z] overdue

If any client had a parsing issue or an unknown pipeline
state, list them here too:

> Heads up - I couldn't fully parse these clients. You may
> want to check them:
>
> - [client-slug]: [issue]

### Step 10 - Do NOT update any state

This workflow is read-only. It never writes to any
project-state.md, never modifies any client file, and never
changes the master template. The only file it writes is
`04_Clients/dashboard.html` which gets overwritten on every
run.

---

## Validation

Before writing the file, verify:

- Every column has either cards or an empty state (no empty
  `column__cards` containers)
- Attention panel has either items or the empty state
- Every placeholder has been replaced (no `[TOKEN]` strings
  remain, except inside comments which are fine)
- Client chip links all point to relative paths that start
  with `../`
- BRAND_FONTS and BRAND TOKENS blocks are unchanged from the
  master template
- No em dashes anywhere in the final HTML (hard rule)

---

## When things go wrong

### No clients exist yet

Generate the dashboard anyway - all six columns show their
empty states and the attention panel shows "Nothing urgent.
Good place to be." This is useful to a new designer as proof
the system is working before they've added any clients.

### A client has no project-state.md

Skip that client and flag it:

> [client-slug] has no project-state.md. Skipped. Run
> `new lead` on this client or create the file manually.

### A client's Pipeline State value is blank

Default to `lead` and flag it:

> [client-slug] has no Pipeline State set. Placed in Lead
> column. Update their project-state.md to set the field.

### A client has 20+ pending actions

Include all of them in the client's own next-action display
(only the top one shows on the card) but in the global
Needs Attention panel only the single top action from that
client counts toward the 20-item cap. This stops one chaotic
client from drowning out every other client's actions.

### Em dashes in any of the fields

Replace with hyphens when populating the HTML. Hard rule -
system-wide, no exceptions.

### The template file is missing

Tell the user:

> The dashboard template is missing at
> `06_Templates/template_dashboard.html`. Run `update system`
> to pull the latest templates from GitHub.

---

## STOP

After writing `04_Clients/dashboard.html` and printing the
summary, stop. Do not auto-chain into other workflows. The
designer opens the file in a browser themselves.
