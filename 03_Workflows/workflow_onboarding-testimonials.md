---
type: workflow
slug: onboarding-testimonials
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Workflow: Onboarding - Testimonials Bank

Captures the designer's bank of past client testimonials and
results. Saves to `01_Core/core_testimonials.md`. This bank is the
source of truth for every proposal - the proposal workflow reads it
and picks the two most aligned testimonials for each new client
based on project type and client similarity.

---

## Trigger

Called automatically as part of the onboarding sequence (client mode
only). Can also be re-run on demand with:

- "add a testimonial"
- "update my testimonials"
- "run testimonials onboarding"

When re-run on demand, the workflow appends new entries to the
existing bank rather than overwriting it.

---

## Why a testimonials bank

Most designers have a handful of past clients whose feedback and
results they use over and over in proposals, sales pages, and case
studies. Keeping this in one structured file means:

- Proposals automatically show testimonials from the most relevant
  past clients (a wellness coach proposal pulls wellness-adjacent
  testimonials, a SaaS proposal pulls SaaS-adjacent ones)
- No copy/pasting testimonials into each new proposal
- New entries can be added any time with `add a testimonial`
- The same bank feeds sales pages, about pages, and case study
  sections later

---

## Steps

### Step 1 - Explain what's needed

Tell the user:

> Next I need your testimonials bank. This is a structured list of
> feedback and results from past clients that I'll use across every
> proposal, sales page, and case study you generate. Every time you
> create a new proposal, I'll automatically pick the two most
> aligned testimonials based on the new client's project type and
> industry.
>
> For each past client I'll ask for:
>
> 1. Their name
> 2. Their business name
> 3. Their industry / client type
> 4. The kind of project you delivered for them
> 5. The actual testimonial quote
> 6. Any hard results (metrics, outcomes) you can share
> 7. A link to their live site or portfolio (optional)
>
> If you don't have any testimonials yet, skip this step and I'll
> prompt you to add your first one as soon as you deliver a
> project. You can also add more at any time by saying "add a
> testimonial".
>
> How many testimonials do you want to add now? (You can add more
> later)

### Step 2 - Handle the no-testimonials case

If the user says they don't have any testimonials yet:

> No problem. I'll skip the bank for now and your first proposals
> won't include testimonials. As soon as you deliver a project, run
> "add a testimonial" to start building your bank. The first two or
> three testimonials make the biggest difference - prioritise
> getting them after each client handover.

Write an empty bank file to `01_Core/core_testimonials.md`:

```
---
type: core
slug: testimonials
status: active
tags:
  - type/core
  - domain/sales
---

# Testimonials Bank

No testimonials captured yet. Run `add a testimonial` after each
project delivery to build this bank.

## How this is used

Proposals automatically pull the two most aligned entries based on
the new client's project type and client type. Entries are matched
by comparing project_type and client_type fields against the new
client's brief.
```

Then mark the workflow complete.

### Step 3 - Capture each testimonial

For each testimonial the user wants to add, ask these in order:

**1. Client name**
> What's the client's full name?

**2. Business name**
> What's the name of their business?

**3. Industry / client type**
> What industry or client type are they? (e.g. "wellness coach",
> "SaaS founder", "photographer", "local service business")
>
> Keep this as a short tag that describes who they are, not a long
> description. This is what I'll match against for future clients.

**4. Project type**
> What kind of project did you deliver for them?
>
> Options (pick one or type your own):
>
> 1. Custom brand and web design
> 2. Website only
> 3. Brand only
> 4. Sales page
> 5. Productized design
> 6. Consulting / strategy only
> 7. Something else

**5. Testimonial quote**
> Paste their testimonial here. Exact words, as they wrote them.

**6. Results**
> Any hard results from the project? For example: "3x increase in
> inquiries in 2 weeks" or "$50k in sales in the first month" or
> "went from 0 to 500 email subscribers".
>
> Skip if there aren't any specific numbers - the testimonial
> quote on its own is fine.

**7. Portfolio URL**
> Link to their live site or portfolio? (optional)
>
> If their site is live, paste the URL. If not, skip.

### Step 4 - Confirm and save

Show the user what was captured:

> Here's what I've got for [client name]:
>
> - Business: [business]
> - Industry: [industry]
> - Project: [project_type]
> - Quote: "[quote]"
> - Results: [results]
> - Portfolio: [portfolio_url]
>
> Looks right? (yes / edit / skip)

On yes, append the entry to `01_Core/core_testimonials.md` under the
Entries section using this format:

```
## [Client Name]

- **Business:** [business name]
- **Industry:** [industry]
- **Project type:** [project_type]
- **Portfolio:** [portfolio_url or "None"]
- **Results:** [results or "None"]

> [testimonial quote]
```

### Step 5 - Loop

Ask if they want to add another:

> Add another testimonial? (yes / done)

If yes, repeat from Step 3. If done, continue to Step 6.

### Step 6 - Write the bank file

The file should look like:

```
---
type: core
slug: testimonials
status: active
tags:
  - type/core
  - domain/sales
---

# Testimonials Bank

The designer's structured collection of past client testimonials.
Automatically pulled by workflow_create-proposal.md to populate
two matching testimonials per new proposal, based on project type
and client similarity.

## How this is used

- `workflow_create-proposal.md` reads this file and scores each
  entry against the new client brief (project_type + industry)
- The top two matches populate [TESTIMONIAL_1_*] and
  [TESTIMONIAL_2_*] placeholders in the proposal HTML
- Entries can be added any time with `add a testimonial`
- Same bank can be used for sales page and about page testimonials

## Entries

[All the entries captured above, one per section]
```

### Step 7 - Confirm and close

Tell the user:

> Testimonials bank saved. Every proposal I generate from now on
> will automatically pull the two most aligned testimonials for
> each new client based on their industry and project type.
>
> To add more at any time, just say "add a testimonial" and I'll
> walk you through it.

### Step 8 - Mark complete

Update file status to `active`.

---

## Matching logic (for workflow_create-proposal.md reference)

When the proposal workflow reads `core_testimonials.md`, it scores
each entry against the new client:

- **Exact project_type match:** +3 points
- **Exact industry match:** +3 points
- **Similar project_type (brand+website matches brand or website):** +1 point
- **Similar industry (e.g. wellness matches coaching):** +1 point
- **Has portfolio link:** +1 tiebreak point
- **Has results / metrics:** +1 tiebreak point

Pick the two highest scoring entries. If there are fewer than two
entries in the bank, use what's available. If the bank is empty,
omit the Client Results section from the proposal entirely.

---

## When things go wrong

### User wants to edit an existing entry

Tell them to open `01_Core/core_testimonials.md` directly and edit
the entry, or run "update testimonial for [client name]" and walk
them through the fields again.

### User pasted a testimonial with an em dash

Replace the em dash with a hyphen when saving. System-wide rule -
no em dashes, ever.

### Client didn't provide a formal testimonial

Capture whatever they said in an email or on a call. A short
authentic quote beats a long polished one.

---

## STOP

After saving the bank file, stop and let the user continue the
onboarding sequence. Do not auto-chain into other workflows.
