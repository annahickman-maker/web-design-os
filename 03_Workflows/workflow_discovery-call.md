---
type: workflow
slug: discovery-call
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Discovery Call

Prepares the designer for a discovery call and processes the notes afterwards.

---

## Trigger

- "run discovery call"
- "prep for discovery call with [client]"
- "process discovery call notes"

---

## Prerequisites

- Client exists in `04_Clients/`
- Call-prep file exists (created by `workflow_new-lead.md`)

---

## Steps

### Part A: Before the call

### Step 1 - Load context

Read:
1. `04_Clients/[client-slug]/client.md`
2. `04_Clients/[client-slug]/call-prep.md` (if exists)
3. `01_Core/core_positioning.md`
4. `01_Core/core_offer.md`

### Step 2 - Remind designer of the script

Say:

> Here's your prep for the discovery call with [client name]:
>
> [show the call-prep content]
>
> The discovery call script covers:
>
> **Your Business section:**
> - Tell me what your business looks like now and where you hope to take it
> - Why now for this project?
> - What's your biggest selling service/product?
> - How do you plan to scale?
> - What would success look like?
> - What's the biggest hurdle?
>
> **Your Website section:**
> - What's the #1 purpose of your website?
> - How do you feel about your current brand?
> - Any additional features needed?
> - How are you marketing the business?
>
> **Your Project section:**
> - What's your deadline?
> - What's your budget?
>
> **The Pitch:**
> Based on your answers, this package seems like a really good fit for [their goals]. As it says on my website, this service is [price]. My next available start date is [date] - are you ready to book it in?
>
> When you're done with the call, come back and say "process discovery call notes" and I'll handle the rest.

### Part B: After the call

### Step 3 - Capture the notes

Ask the user:

> How did the call go? You can either:
>
> 1. Paste the transcript if you recorded it
> 2. Share your written notes
> 3. Answer a few questions and I'll reconstruct what happened
>
> Which works?

### Step 4 - Extract key data

From whatever they provide, extract:

- **Budget agreed** (or range)
- **Start date** (or timeline)
- **Their goals** (specific to project)
- **Package chosen** (if discussed)
- **Any objections raised**
- **Any scope items discussed**
- **Their key priorities**
- **Anything they were excited about**
- **Anything they were hesitant about**

### Step 5 - Call outcome decision

Ask:

> Based on the call, how do you want to proceed?
>
> 1. **Good fit - create proposal** - I'll generate a proposal with the discussed scope and send the client portal email
> 2. **Not a fit** - I'll generate a polite decline email
> 3. **Needs more thought** - I'll log the notes and you'll decide later

### Step 6 - Take action

**If good fit:**
Update client status to "call-done". Trigger `workflow_create-proposal.md` to generate the proposal from the call data.

**If not a fit:**
Update client status to "declined-after-call". Run `workflow_client-email.md` with "not-a-fit-after-call" template.

**If needs more thought:**
Save notes and pause. Remind the user to follow up within 48 hours.

### Step 6a - Update project-state.md

Update `04_Clients/[client-slug]/project-state.md`:

**If good fit:**
- Pipeline State: `qualified`
- Next Actions: append
  ```
  - [ ] high [proposals] Draft and send proposal | due: [today + 2 days]
  ```
- Move the "Book discovery call" action from Next Actions to Done
  with today's date.

**If not a fit:**
- Pipeline State: `archived`
- Clear any pending Next Actions (nothing more to do with this
  lead).

**If needs more thought:**
- Pipeline State stays at `lead`
- Next Actions: append
  ```
  - [ ] high [admin] Follow up with [client name] on call outcome | due: [today + 2 days]
  ```
- Move the "Book discovery call" action to Done with today's date.

### Step 7 - Write call notes to client file

Update `04_Clients/[client-slug]/client.md` with:

```
## Discovery Call - [date]

### Call Summary
[what was discussed]

### Budget Agreed
[amount]

### Start Date
[date]

### Package Chosen
[package]

### Key Goals
[list]

### Concerns/Objections
[list]

### Outcome
[good-fit | not-a-fit | pending]

### Next Action
[what's happening next]
```

---

## STOP

After the notes are saved and the next workflow is triggered (if any), wait for user direction.
