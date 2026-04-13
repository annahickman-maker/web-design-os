---
type: workflow
slug: new-lead
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: New Lead

Adds a new lead to the clients folder, qualifies them, and triggers the appropriate response.

---

## Trigger

- "new lead"
- "add lead"
- "I got a new inquiry"

---

## Prerequisites

- Client mode
- Onboarding complete

---

## Steps

### Step 1 - Capture lead information

Ask the user:

> Tell me about the new lead. You can paste the inquiry form, forward the email, or just give me the details. I'll extract what I need.

Capture:
- Name
- Business name
- Email
- Website (if any)
- Project type / needs
- Budget range (if provided)
- Timeline (if provided)
- How they heard about you
- Any specific things they mentioned

### Step 2 - Create the client folder

Generate a slug from the business name (kebab-case, lowercase).

Copy `04_Clients/_template/` to `04_Clients/[client-slug]/`.

Populate `04_Clients/[client-slug]/client.md`:

```
---
type: client
slug: [client-slug]
status: lead
tags:
  - type/client
---

# [Business name]

## Contact
- Name: [name]
- Email: [email]
- Business: [business name]
- Website: [url]

## Source
How they found you: [source]

## Initial Inquiry
[paste of what they sent]

## Project Type
[what they want]

## Budget (stated)
[range if given]

## Timeline
[if given]

## Status
Lead - awaiting qualification
```

### Step 3 - Qualify the lead

Review the inquiry against the user's positioning and offer:

Read:
- `01_Core/core_positioning.md`
- `01_Core/core_offer.md`

Score the lead on:

**Fit signals (good):**
- Budget matches or exceeds offer pricing
- Timeline is reasonable
- Project type aligns with services offered
- Audience matches ideal customer
- Specific, clear needs

**Red flags:**
- Budget significantly below offer pricing
- Unrealistic timeline (too fast)
- Out of scope project type
- Vague or spammy inquiry
- Demands or entitled tone

Give the lead a fit rating: Good Fit / Potential Fit / Not a Fit

### Step 4 - Recommend response

Based on the rating:

**Good Fit:**
> This looks like a strong lead. Recommended action: send the Discovery Call Invite email and book them in.
>
> Want me to generate the email? I'll personalise it based on what they said in their inquiry.

**Potential Fit:**
> This could work but has some questions. Issues I noticed:
> - [issue 1]
> - [issue 2]
>
> Options:
> 1. Send Discovery Call Invite and clarify on the call
> 2. Ask clarifying questions via email first
> 3. Decline politely
>
> What do you want to do?

**Not a Fit:**
> This doesn't look like a good fit because:
> - [reason 1]
> - [reason 2]
>
> Recommended action: send the Not a Good Fit email with an optional referral.
>
> Want me to draft it?

### Step 5 - Generate the chosen email

If Discovery Call Invite, run `workflow_client-email.md` with the "discovery-invite" template.

If Not a Good Fit, run `workflow_client-email.md` with the "not-a-fit" template.

### Step 6 - Update client status

Update `04_Clients/[client-slug]/client.md`:
- Status: based on action (call-booked | declined | waiting-for-response)

### Step 6a - Initialize project-state.md

Update `04_Clients/[client-slug]/project-state.md` (copied from
`_template` in Step 2). Set:

```
## Pipeline State

lead

## Path

[productized | custom - from client.md, or ask if unclear]

## Next Actions

- [ ] high [calls] Book discovery call | due: [date + 3 days]
- [ ] normal [admin] Review inquiry and prep questions | due: -
```

If the inquiry was declined (Not a Fit), set Pipeline State to
`archived` instead and skip the Next Actions entirely. The lead
is closed.

### Step 7 - Create prep brief if discovery call booked

If the designer is going to have a discovery call, generate a prep brief:

Write to `04_Clients/[client-slug]/call-prep.md`:

```
# Discovery Call Prep: [client name]

## Client Context
[1-paragraph summary]

## Their Goals
[what they want]

## Their Budget
[stated or inferred]

## Recommended Package
[based on their needs and the designer's offers]

## Potential Objections
[what they might push back on]

## Questions to Ask
[from discovery call script, customised to their situation]

## Red Flags to Watch For
[any warning signs]
```

This brief sits waiting for when the designer has the call. They read it before the call starts.

### Step 8 - Suggest next step

> Lead created, qualified, and [action taken]. Next steps:
>
> - The discovery call is booked for [date]. I've created a prep brief you can read 15 mins before the call.
> - Or: the email has been drafted - want to review and send?
>
> Anything else for this lead right now?

---

## STOP
