---
type: workflow
slug: create-contract
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Create Contract

Generates a custom contract from the proposal data.

---

## Trigger

- "create contract for [client]"
- "generate contract"

---

## Prerequisites

- Proposal accepted by client (or about to be)
- Client mode

---

## Disclaimer

Remind the user:

> IMPORTANT: This generates a contract template based on your inputs. It is NOT legal advice. Every business is different. You should have a qualified lawyer review your contract template before using it with clients. The creator of Web Design OS is not responsible for any legal issues that arise from using this template.

Proceed only after they acknowledge.

---

## Steps

### Step 1 - Load sources

Read:
1. `04_Clients/[client-slug]/client.md`
2. `04_Clients/[client-slug]/deliverables/proposal.md`
3. `06_Templates/template_contract.md`
4. `01_Core/core_offer.md` (for default terms if using a package)

### Step 2 - Gather contract details

Ask the user to confirm:

> Contract details to confirm:
>
> 1. **Your business name** (Service Provider)
> 2. **Date** (today's date for the contract)
> 3. **Total cost** (from the proposal)
> 4. **Payment schedule** (e.g. 50% deposit, 50% on launch)
> 5. **Project timeline** (start and end dates)
> 6. **Website launch date** (target)
> 7. **Services included** - confirm what's in scope
> 8. **Revisions included** (typically 2 rounds)
> 9. **Post-launch support period** (typically 30 days)
> 10. **Anything custom** to add or remove from the template

### Step 3 - Generate the contract

Fill in the template with all the details. Include:

- Header with date, business name, client name, total
- Service & Deliverables section
- Payment and Due Dates
- Description of Services
- Client Expectations (response times, meeting attendance)
- Revisions policy
- Cancellation terms
- Confidentiality
- Copyright ownership
- Acceptance of Terms
- Signature blocks

### Step 4 - Flag review items

After generation, flag anything that might need extra attention:

> Contract drafted. A few things to double-check before sending:
>
> - [ ] Payment schedule matches what we discussed
> - [ ] Timeline is achievable
> - [ ] All scope items are included (not missing anything)
> - [ ] The legal disclaimers are appropriate for your jurisdiction
>
> I recommend having your lawyer review this if it's a new contract template.

### Step 5 - Write the contract

Write to `04_Clients/[client-slug]/deliverables/contract.md` (and optionally `contract.html` for portal display).

### Step 6 - Next step

> Contract ready. Next steps:
>
> 1. Have it reviewed (legally and for accuracy)
> 2. Set up for e-signature (DocuSign, Dubsado, HelloSign, etc.)
> 3. Add the link to the client portal
> 4. Send the client portal email
>
> Want me to help with any of those?

### Step 7 - Update client state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** stays at `proposal sent` (the client
  still hasn't signed - don't advance the state yet)
- **Deliverables:** add `contract.html`

Do NOT add any Next Actions to the dashboard. The signing
flow is automated - once the client signs via Formsubmit,
the next step (project kickoff) becomes the designer's
job and `workflow_project-kickoff.md` handles the state
transition. Writing an "Await signature" action here would
clutter the dashboard with a passive wait that needs no
designer intervention.

---

## STOP
