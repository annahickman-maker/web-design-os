---
type: workflow
slug: project-kickoff
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Project Kickoff

Runs when a client has signed the contract and paid the deposit (custom path) or purchased (productized path). Sets up everything needed to start the project.

---

## Trigger

- "kick off project"
- "[client] signed the contract"
- "[client] paid the deposit"

---

## Prerequisites

- Client exists
- Contract signed + deposit paid (custom) OR purchase received (productized)

---

## Steps

### Step 1 - Confirm kickoff

Ask:

> Ready to kick off [client name]'s project. I'll set up:
>
> 1. Update client status to active
> 2. Schedule the strategy meeting (or refinement meeting for custom)
> 3. Send the project confirmed email
> 4. Create deliverables folder structure
> 5. Prepare the AI interview
>
> Anything special about this project I should know before I start?

### Step 2 - Update client status

Update `04_Clients/[client-slug]/client.md`:
- Status: active
- Kickoff date: today

### Step 3 - Update project state

Update `04_Clients/[client-slug]/project-state.md` (the file
already exists from `workflow_new-lead.md`). Set:

- **Pipeline State:** `strategy`
- **Kickoff Date:** today
- **Path:** productized | custom (from client.md)
- Tick the Pre-project milestones as complete:
  - `[x] Lead qualified`
  - `[x] Discovery call complete`
  - `[x] Proposal sent`
  - `[x] Contract signed`
  - `[x] Deposit paid`
- **Next Actions:** replace existing actions with:
  ```
  - [ ] high [strategy] Run AI interview with [client] | due: [today + 3 days]
  - [ ] normal [calls] Schedule strategy meeting with [client] | due: [today + 7 days]
  ```
- Move any existing pre-project actions ("Follow up on proposal",
  "Book discovery call") to the Done section with today's date.

### Step 4 - Generate the project confirmed email

Run `workflow_client-email.md` with the "project-confirmed" template. The email should:

- Welcome them to the project
- Confirm the kickoff
- Explain the next steps
- Set expectations for the AI interview
- Give a clear call to action (schedule a time, complete the interview, etc.)

### Step 5 - Prepare interview delivery

Ask the user how they want to run the AI interview:

> How do you want to run the AI interview with [client]?
>
> 1. **Schedule a call** - you run the interview live with them
> 2. **Send them the questions** - they answer asynchronously
> 3. **Client interview app** (v1.1+) - they use their unique link

### Step 6 - Trigger next workflow

Based on choice, either:
- Set up a calendar reminder for the live interview
- Run `workflow_ai-interview.md` in "send questions" mode
- Wait for the client to complete their side

### Step 7 - Confirm kickoff complete

> Kickoff complete. Here's where we are:
>
> - Client status: active
> - Deposit: received
> - Project confirmed email: sent
> - Next action: [based on choice above]
>
> When you're ready for the next step, say "start [client] interview" or the project state is ready for you.

---

## STOP
