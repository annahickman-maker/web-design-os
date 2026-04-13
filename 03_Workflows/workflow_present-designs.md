---
type: workflow
slug: present-designs
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Present Designs

Delivers design to the client for feedback and processes their response.

---

## Trigger

- "present designs to [client]"
- "send designs to [client]"
- "deliver homepage designs"

---

## Prerequisites

- Designs complete (in Framer or other tool)
- Loom video or equivalent recorded

---

## Steps

### Step 1 - Confirm what's being delivered

Ask:

> What are you delivering to [client] in this round?
>
> 1. Homepage only (first design presentation)
> 2. Full website (second design presentation)
> 3. Revisions (follow-up)
>
> And do you have:
> - [ ] Design link (Framer preview URL)
> - [ ] Loom video walkthrough
> - [ ] Any notes you want to include

### Step 2 - Generate delivery email

Run `workflow_client-email.md` with the "delivering-designs" template. Personalise with:
- Specific mention of what's being delivered
- The design link
- The Loom video link
- Clear feedback instructions
- Deadline for feedback

### Step 3 - Update client portal

If using auto-deployed client portals (v1.2+):
- Update the portal with the new design link
- Update the portal status to "awaiting feedback"
- Regenerate the portal

For v1.0, remind the designer to update their portal manually:
> Don't forget to update the client portal with the latest design link.

### Step 4 - Schedule feedback reminder

Ask:

> When is the feedback deadline? I'll set a reminder to follow up if they don't respond.

Log the reminder in the project state file.

### Step 5 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** advance to `revisions` (even before
  client feedback comes in - the project is now in a
  feedback loop, not fresh design work)
- Tick the milestone: `[x] Homepage presented` (or
  `[x] Full site presented` if this is the website
  presentation, not homepage)
- **Next Actions:** append
  ```
  - [ ] normal [admin] Follow up if no feedback from [client] | due: [feedback deadline]
  ```

---

## Part B: Processing Feedback

Triggered when user says "process [client] feedback" or similar.

### Step 6 - Capture feedback

Ask:

> Share the feedback from the client. You can paste the email, notes from a call, or a summary.

### Step 7 - Categorise the feedback

Identify the feedback type:

**Good feedback:**
They love it. Minor or no changes.

**Bad feedback:**
Significant concerns or major changes requested.

**Vague feedback:**
"I don't love it" without specifics.

**Mixed feedback:**
Some things work, others don't.

### Step 8 - Generate the response email

Run `workflow_client-email.md` with the appropriate feedback follow-up template:

- Good feedback → "good feedback" email
- Bad feedback → "bad feedback" email
- Vague feedback → "vague feedback" email (asks for specifics)
- Mixed feedback → combination approach

### Step 9 - Action items

List specific changes to make based on the feedback:

```
## Revisions Needed

### Changes
1. [change 1]
2. [change 2]
3. [change 3]

### Questions to Clarify
1. [question 1]
2. [question 2]

### Rounds used
This is revision round [1 | 2] of 2 included.
```

Save to `04_Clients/[client-slug]/feedback.md`.

### Step 10 - Track revision rounds

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** stays at `revisions`
- **Revision Rounds Used:** increment the count
- Move the "Follow up if no feedback from [client]" action
  from Next Actions to Done with today's date.
- **Next Actions:** append
  ```
  - [ ] urgent [revisions] Address round [N] feedback for [client] | due: [today + 3 days]
  ```
  (use the exact revision round number from feedback.md)

If the client approved without changes, instead:
- Tick milestones:
  - `[x] Design approved`
  - `[x] Revisions round 1 complete` (or round 2)
- Do NOT add a new revision action. Instead append:
  ```
  - [ ] high [launch] Run launch checklist for [client] | due: [today + 5 days]
  ```

Flag if approaching the revision limit:
> Note: This is revision round 2 of 2. Any further changes after this round may need to be quoted as additional work.

### Step 11 - Next step

> Feedback processed. Next steps:
>
> - Implement the changes listed in `feedback.md`
> - When done, say "present revised designs to [client]" to deliver round 2
> - Or if they approved, say "[client] approved designs" to move to launch phase

---

## STOP
