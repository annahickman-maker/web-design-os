---
type: workflow
slug: create-proposal
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Create Proposal

Generates a fully populated HTML proposal for a specific client.
Reads the discovery brief, pulls dynamic scope from the designer's
offer, scores the testimonials bank to pick the two most aligned
entries, wires the contract URL, and writes the final HTML into
the client folder ready to share.

---

## Trigger

- "create proposal for [client]"
- "generate proposal"
- "draft the proposal for [client]"

Called automatically by `workflow_discovery-call.md` when the call
goes well and the client is ready for a proposal.

---

## Prerequisites

- Discovery call complete (notes in `04_Clients/[client-slug]/client.md`)
- Brief captured at `04_Clients/[client-slug]/brief.md`
- Client is on the custom path OR productized path (both supported)
- Onboarding is complete (specifically `core_offer.md`,
  `core_testimonials.md`, `core_payments.md`, `core_positioning.md`,
  `core_voice-style.md`)

If any prerequisite is missing, stop and tell the user which file
is missing before continuing.

---

## Steps

### Step 1 - Load sources

Read in this order:

1. `04_Clients/[client-slug]/client.md` (discovery call notes)
2. `04_Clients/[client-slug]/brief.md` (structured brief)
3. `01_Core/core_offer.md` (the designer's packages and scope)
4. `01_Core/core_testimonials.md` (the testimonials bank)
5. `01_Core/core_payments.md` (currency, terms, deposit split)
6. `01_Core/core_positioning.md` (for tone reference)
7. `01_Core/core_voice-style.md` (for voice check)
8. `06_Templates/template_proposal.html` (the master template)

### Step 2 - Extract the client facts

From the brief and client file, pull these into memory:

- `client_name` - full name
- `client_first_name`
- `client_business` - business name
- `client_industry` - short tag (e.g. "wellness coach", "SaaS
  founder", "photographer")
- `project_type` - one of the values from
  `workflow_onboarding-testimonials.md` step 3.4
- `client_goals` - 3 short goals pulled from the discovery call in
  the client's own language (do not rewrite them)
- `agreed_price` - from the call, or ask if not captured
- `agreed_timeline` - from the call, or ask if not captured
- `agreed_start_date` - from the call, or ask if not captured

If any of these are missing:

> Before I draft the proposal, I need a few things confirmed:
>
> 1. Which of your packages are we proposing? [list from core_offer.md]
> 2. What price are we quoting?
> 3. What start date are we aiming for?
> 4. What's the agreed delivery timeline?
> 5. Any custom scope items that came up on the call I should
>    include on top of the package?

Do not invent answers. If the user can't confirm, stop.

### Step 3 - Match the package to a core offer

Read `core_offer.md` and identify the package that best matches
what was discussed. Capture:

- `package_name` - exact name from core_offer.md
- `package_base_scope` - the bullets listed under that package
- `package_timeline` - standard duration
- `package_post_launch_weeks` - post-launch support window

If two packages could fit, ask the user which one before
continuing. Do not guess.

### Step 4 - Generate dynamic scope

The proposal template has four scope blocks: **Strategy**,
**Website**, **Launch**, **Post-launch support**. Populate each one
by combining:

1. The base bullets from `package_base_scope`
2. Anything client-specific from the brief that maps onto the same
   phase (e.g. "they want an FAQ section" goes in Website)
3. Nothing else - no invented scope, no filler bullets

Scope rules:

- Use the client's own language from the brief where possible
- Keep each bullet short (one line, no sub-bullets)
- Never add anything the client didn't ask for
- Never add anything the package doesn't include
- If a client-specific request is outside the package, flag it
  to the designer before writing it in:

  > The brief mentions [request] which isn't in the [package]
  > scope. Do you want to include it in the proposal as-is, add
  > it as a custom line item, or leave it out?

Final deliverable for this step:

- `scope_strategy_items` - list of bullets
- `scope_website_items` - list of bullets
- `scope_launch_items` - list of bullets
- `scope_post_launch_items` - list of bullets

### Step 5 - Score the testimonials bank

Read `core_testimonials.md`. For each entry, score against the
current client using the logic defined in
`workflow_onboarding-testimonials.md`:

- **Exact project_type match:** +3 points
- **Exact industry match:** +3 points
- **Similar project_type** (brand+website matches brand or website
  alone, sales page matches website, consulting matches anything):
  +1 point
- **Similar industry** (e.g. wellness matches coaching, SaaS
  matches tech, ecommerce matches retail): +1 point
- **Has portfolio link:** +1 tiebreak point
- **Has results / metrics:** +1 tiebreak point

Pick the top two scoring entries. Ties broken by portfolio +
results points, then by order in the file (earlier entries win).

Edge cases:

- **Bank has 0 entries:** omit the Client Results section from the
  final HTML entirely. Delete the section block, not just the
  placeholders.
- **Bank has 1 entry:** use it for testimonial 1, delete the
  testimonial 2 block from the HTML.
- **No entries score above 0:** use the two most recent entries in
  the bank (fallback). Tell the user after drafting:

  > None of your testimonials matched this client's project type
  > or industry directly, so I used your two most recent entries.
  > If you want to swap either one for a specific entry, tell me
  > which client name to use instead.

Capture for each pick:

- `testimonial_N_quote`
- `testimonial_N_name`
- `testimonial_N_business`
- `testimonial_N_portfolio`

### Step 6 - Build the investment block

From `core_payments.md` and the agreed price:

- `investment_amount` - formatted with currency symbol from
  core_payments.md (e.g. "£4,500" or "$5,200")
- `payment_installments` - derived from
  `core_payments.md` default split:
  - "50% deposit, 50% on launch" → "2 installments"
  - "40% / 40% / 20%" → "3 installments"
  - "100% upfront" → "Paid in full upfront"
  - "Net 7 / 14 / 30" → "Paid on completion, due [N] days"
  - Custom → describe in one short line

### Step 7 - Resolve the contract URL

The proposal ends with an Accept button that points to
`[CONTRACT_URL]`. This must be set to the path the client's
contract will live at. For v1.0:

- `04_Clients/[client-slug]/deliverables/contract.html`

If the contract file hasn't been generated yet, that's fine - set
the URL anyway. The designer will run `workflow_create-contract.md`
right after the proposal is accepted, and the file will exist by
the time the client clicks Accept.

Save as `contract_url`.

### Step 8 - Assemble the HTML

Read `06_Templates/template_proposal.html` and replace every
placeholder with the captured values:

| Placeholder | Value |
|---|---|
| `[CLIENT_NAME]` | `client_name` |
| `[CLIENT_FIRST_NAME]` | `client_first_name` |
| `[PROJECT_TYPE]` | `project_type` |
| `[DESIGNER_NAME]` | from `core_positioning.md` |
| `[DESIGNER_EMAIL]` | from `core_positioning.md` |
| `[YEAR]` | current year |
| `[DATE]` | today's date, formatted as "10 April 2026" |
| `[PROPOSAL_ID]` | `[client-slug]-proposal-01` |
| `[GOAL_1]`, `[GOAL_2]`, `[GOAL_3]` | from `client_goals` |
| `[PACKAGE_NAME]` | `package_name` |
| `[INVESTMENT_AMOUNT]` | `investment_amount` |
| `[PAYMENT_INSTALLMENTS]` | `payment_installments` |
| `[PAGE_COUNT]` | from brief or package default |
| `[POST_LAUNCH_WEEKS]` | `package_post_launch_weeks` |
| `[TIMELINE_TEXT]` | short paragraph from `agreed_timeline` and `agreed_start_date` |
| `[TESTIMONIAL_1_*]` | top testimonial match |
| `[TESTIMONIAL_2_*]` | second testimonial match |
| `[CONTRACT_URL]` | `contract_url` |
| Scope bullets | generated in step 4 |

Scope bullets: replace the static example `[SCOPE_*_ITEM_*]`
pattern in the template by deleting the existing placeholder
bullets in each scope block and writing in the bullets from
step 4. Keep the same `<li class="scope-block__item">` markup.

### Step 9 - Voice check

Re-read `core_voice-style.md`. Walk through every section of the
drafted proposal and rewrite any line that:

- Sounds corporate, stiff, or sales-y
- Uses generic phrases (best in class, industry leading, elevated)
- Uses words that are smart-sounding but not how the designer
  actually speaks
- Contains an em dash (replace with hyphen - hard rule)

Keep the hero, goals, scope items, and timeline text in the
designer's voice. The testimonials stay exactly as written.

### Step 10 - Write the HTML file

Write the populated HTML to:

```
04_Clients/[client-slug]/deliverables/proposal.html
```

Create the `deliverables/` subfolder if it doesn't exist.

### Step 11 - Present for review

Show the user:

> Proposal drafted for [client_name]. Here's a summary of what I
> built:
>
> - **Package:** [package_name]
> - **Investment:** [investment_amount], [payment_installments]
> - **Timeline:** [short timeline description]
> - **Testimonials pulled:** [testimonial_1_name] ([match score]),
>   [testimonial_2_name] ([match score])
> - **Contract URL:** [contract_url]
>
> Scope bullets generated:
>
> **Strategy:** [list]
> **Website:** [list]
> **Launch:** [list]
> **Post-launch support:** [list]
>
> File saved to `04_Clients/[client-slug]/deliverables/proposal.html`.
>
> Want me to:
>
> 1. Adjust anything (scope, testimonials, timeline, price)
> 2. Open the HTML in a browser to preview it
> 3. Draft the client email to send the proposal over
> 4. Generate the contract next so the Accept button works

### Step 12 - Update client state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** `proposal sent` (lowercase, exact -
  this is the field the dashboard reads)
- **Next Actions:** append
  ```
  - [ ] normal [proposals] Follow up with [client] if no response | due: [today + 7 days]
  ```
- Move the "Draft and send proposal" action from Next Actions
  to Done with today's date.
- Add to deliverables: `proposal.html`
- Record the package name and price
- Record the testimonials used (by client name) so the bank
  doesn't double up on the next proposal for a similar client

### Step 13 - Suggest next action

> Proposal is ready. Next logical step: generate the contract so
> the Accept button has a file to point at when the client clicks
> through. Want me to run `workflow_create-contract.md` now?

---

## Validation

Before presenting to the user, verify:

- Every placeholder in the HTML has been replaced (no `[...]`
  tokens remain except intentional ones in file comments)
- Scope blocks are not empty
- Goals are in the client's own language, not rewritten
- Testimonials exist in the bank (never invented)
- `contract_url` points to a path inside the client folder
- No em dashes anywhere in the final HTML
- Investment amount includes the currency symbol from core_payments

If any check fails, fix before writing the file.

---

## When things go wrong

### The testimonials bank is empty

Tell the user:

> Your testimonials bank is empty, so I've drafted the proposal
> without a Client Results section. As soon as you deliver this
> project and have a quote from the client, run "add a
> testimonial" to start building the bank. Future proposals will
> pull from it automatically.

Proceed without the section.

### The package scope and the client brief disagree

Never silently resolve this. Surface the conflict:

> The brief asks for [X] which isn't in the [package] scope. Do
> you want to include it as a custom line item (and adjust the
> price), swap to a different package, or leave it out of the
> proposal?

Wait for the user's decision.

### The client's industry doesn't match any testimonial

Fall back to the two most recent testimonials in the bank and
tell the user, as per step 5.

### No agreed price on the call

Ask directly:

> I don't see an agreed price in the discovery notes. What should
> I quote on this proposal?

Do not invent a number or pull one from core_offer without
confirmation.

### Em dashes pasted into the brief or testimonials

Replace with hyphens when populating the HTML. Hard rule -
system-wide, no exceptions.

---

## STOP

After writing the file and presenting the summary, stop. Do not
auto-chain into `workflow_create-contract.md` unless the user
explicitly says yes to step 13.
