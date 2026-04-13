---
type: workflow
slug: productized-intake
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Productized Intake

For productized-path clients: runs when a client has purchased a fixed-price package. Skips discovery call and proposal, goes straight to project setup and AI interview.

---

## Trigger

- "productized intake"
- "new productized client"
- "client just purchased [package]"

---

## Prerequisites

- Client mode
- Path includes productized

---

## Steps

### Step 1 - Capture purchase info

Ask the user:

> Tell me about the new client. You can paste the purchase notification, forward the email, or give me the details.

Capture:
- Name
- Business name
- Email
- Package purchased
- Amount paid
- Any notes they included at checkout

### Step 2 - Create client folder

Generate slug. Copy `04_Clients/_template/` to `04_Clients/[client-slug]/`.

Populate `client.md`:

```
---
type: client
slug: [client-slug]
status: active
path: productized
---

# [Business name]

## Contact
[info]

## Package
[package name]

## Amount Paid
[amount]

## Path
Productized (direct purchase)

## Status
Active - awaiting AI interview
```

### Step 3 - Confirm skipped steps

> Since this is a productized client, I'm skipping:
> - Discovery call
> - Proposal creation
> - Contract (use the standard package contract)
>
> Going straight to:
> 1. Send welcome email with interview link
> 2. Run AI interview with client
> 3. Generate strategy
> 4. Designer reviews
> 5. Present to client
>
> Sound right?

### Step 4 - Generate welcome email

Run `workflow_client-email.md` with "productized-welcome" template (or closest variant).

The email should:
- Welcome them to the project
- Confirm their package
- Set expectations for timeline
- Link to the AI interview (or tell them what to expect)
- Set the tone for the project

### Step 5 - Decide interview delivery

Ask:

> How do you want to run the AI interview with them?
>
> 1. **You run it now** - if they're on a call or available, I'll walk you through asking them the questions
> 2. **Send them the questions** - I'll format the interview as a document they can answer in their own time
> 3. **Wait for v1.1** - when the standalone Client Interview Web App is ready, they can do this themselves via a unique link

### Step 6 - Run or prepare the interview

Based on choice, either:
- Trigger `workflow_ai-interview.md` for designer-led intake
- Generate the questions document for async completion

### Step 7 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** `strategy`
- **Path:** productized
- **Kickoff Date:** today
- Tick Pre-project milestones:
  - `[x] Lead qualified`
  - `[x] Contract signed` (productized treats purchase as signing)
  - `[x] Deposit paid` (productized is typically paid upfront)
- **Next Actions:** replace existing with:
  ```
  - [ ] high [strategy] Run AI interview with [client] | due: [today + 3 days]
  - [ ] normal [admin] Welcome email confirmation | due: [today + 1 day]
  ```

### Step 8 - Confirm next step

> Client set up, welcome email sent, interview [in progress / scheduled].
>
> Once the interview is done, come back and say "generate strategy for [client]" and I'll auto-generate the full strategy deck. Since this is productized, no refinement meeting is needed - AI-first strategy is the approach.

---

## STOP
