---
type: workflow
slug: handover
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Handover

Offboards a completed project. Generates handover documentation, delivers final files, schedules post-launch sequence.

---

## Trigger

- "handover [client]"
- "offboard [client]"
- "[client] is ready for handover"

---

## Prerequisites

- Website design approved
- Final payment received
- Launch checklist complete

---

## Steps

### Step 1 - Verify completion

Check `04_Clients/[client-slug]/project-state.md`:

- [ ] Final payment received
- [ ] Launch checklist complete
- [ ] Client approved final design
- [ ] All deliverables signed off

If anything is outstanding, flag it:

> Before we handover, these items are still open:
> - [outstanding item]
>
> Resolve these first or confirm you want to proceed anyway.

### Step 2 - Confirm hosting decision

Ask:

> How is the site being hosted?
>
> 1. **Transferred to client's account** - they own and manage it
> 2. **Hosted on your account** - you maintain it (monthly retainer)
>
> Which is it for this client?

### Step 3 - Generate handover documentation

Based on the hosting choice, write to `04_Clients/[client-slug]/deliverables/handover-docs.md`:

```
# Handover Documentation: [client name]

## Website URL
[final URL]

## Platform
[Framer / other]

## Access
[client's account details or hosting info]

## How to Update Content
[basic instructions for editing]

## How to Add Blog Posts
[if applicable]

## How to Update Images
[basic instructions]

## Analytics Access
[how to view analytics]

## Support
You have 30 days of post-launch support included. If you need anything, reply to any of my emails and I'll help.

## Files Included
- Brand strategy PDF: [link]
- Final logo files: [link]
- Brand assets: [link]
- Website backup: [link]

## Recommended Training Videos
- [how to edit content]
- [how to publish changes]
- [how to add images]

## Post-Launch Actions
- [actions they should take in the first week]
- [SEO steps if applicable]
- [marketing recommendations]
```

### Step 4 - Generate handover Loom script

Write a short script (1-2 minutes) for the designer to record as their handover video:

```
# Handover Video Script: [client name]

Hi [client name],

Congrats on your new website being live. This is a quick walkthrough of everything you need.

[Show the website]

Your website is live at [URL]. It's fully responsive and optimised.

[Show the admin/editing interface]

Here's where you edit your content. [Quick demo]

[Show the client portal]

In your client portal, you'll find:
- Your brand strategy PDF
- All your final files
- Training videos for updating your site
- Your contract and invoices
- Post-launch support details

If you need anything during your 30 days of post-launch support, just reply to any of my emails and I'll help you out.

I've also got some follow-up emails coming your way:
- A support check-in in a few weeks
- A testimonial request once you've had time to see results

Thank you so much for trusting me with your project. It's been a pleasure working with you and I'm excited to see what you do with this.

[Outro]
```

### Step 5 - Generate the handover email

Run `workflow_client-email.md` with the "handover" template. Include:
- Final payment thank you
- Link to handover docs
- Link to Loom video (once recorded)
- 30-day support info
- Congratulations

### Step 6 - Schedule post-launch sequence

Set up reminders or calendar entries for:

- **Support check-in email** - 5 days before support period ends (so day 25 if 30-day support)
- **Testimonial request** - 4-6 weeks after launch
- **Website launch congratulations** - when client officially launches (if different from handover)

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** stays at `launched` until testimonial
  received and support window expires, then the client moves
  to `archived`. Don't advance it now.
- Tick milestone: `[x] Handover sent`
- Move the "Send handover to [client]" action from Next
  Actions to Done with today's date.
- **Next Actions:** append
  ```
  - [ ] normal [testimonials] Request testimonial from [client] | due: [today + 14 days]
  - [ ] low [calls] Schedule 30-day check-in call with [client] | due: [today + 25 days]
  ```

### Step 7 - Update client status

Update `04_Clients/[client-slug]/client.md`:
- Status: completed
- Completion date: today
- Final project value: [amount]

### Step 8 - Celebrate and suggest next action

> Handover complete. [client name] is officially off-boarded.
>
> Post-launch sequence scheduled:
> - Support check-in on [date]
> - Testimonial request on [date]
>
> **What's next:**
>
> - Ask for referrals now while they're happy
> - Add this project to your portfolio
> - If you had any friction or wins on this project, log them for future improvements
>
> Anything else before we wrap this up?

---

## STOP
