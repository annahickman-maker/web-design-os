---
type: workflow
slug: testimonial-request
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Testimonial Request

Generates and sends a testimonial request email at the optimal time post-launch.

---

## Trigger

- "request testimonial from [client]"
- "send testimonial request"
- Automatically called by post-launch sequence reminder

---

## Prerequisites

- Project complete and handed over
- Recommended: 4-6 weeks post-launch (enough time for results)

---

## Steps

### Step 1 - Verify timing

Check `04_Clients/[client-slug]/project-state.md`:
- Launch date should be 4-6 weeks ago minimum
- Post-launch support period should be ending or ended

If too early:
> It's only been [X weeks] since [client] launched. Testimonial requests usually land better around 4-6 weeks out when they've had time to see results.
>
> Do you want to:
> 1. Send it now anyway
> 2. Wait until [suggested date]
> 3. Custom date

### Step 2 - Check for any post-launch issues

Review `04_Clients/[client-slug]/client.md` for any post-launch friction or complaints:

> Quick check - did [client] have any issues after launch? Any complaints or difficult moments?
>
> If yes, I'd recommend addressing those first before asking for a testimonial.

### Step 3 - Generate the testimonial request email

Run `workflow_client-email.md` with the "testimonial-request" template.

The email should:
- Be warm and personal (use voice style)
- Ask how things are going first (shows care)
- Ask specific questions to get usable answers:
  1. What were you struggling with before the project?
  2. Have your business metrics improved (revenue, bookings, inquiries)?
  3. How did the website help you achieve your goals?
  4. How have your feelings about your business changed?
  5. If you were recommending us to a friend, what would you say?
- Make it easy to respond (can reply by email, doesn't need a form)

### Step 4 - Consider alternative formats

Ask the designer:

> Do you want any of these additions?
>
> 1. **Video testimonial option** - Include a link where they can record a quick video
> 2. **Review site redirect** - After they reply, send them to Trustpilot/Google/Clutch to leave a public review
> 3. **Case study proposal** - Ask if they'd be open to being featured as a case study

### Step 5 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** stays at `launched`
- Tick milestone: `[x] Testimonial requested`
- Move the "Request testimonial from [client]" action from
  Next Actions to Done with today's date.
- **Next Actions:** append
  ```
  - [ ] low [testimonials] Follow up with [client] on testimonial | due: [today + 14 days]
  ```

### Step 6 - Schedule follow-up

If no response after 2 weeks, a follow-up is appropriate:

> If they don't reply in 2 weeks, I'll suggest sending a gentle follow-up.

### Step 7 - When the testimonial arrives

Triggered separately when user says "[client] sent a testimonial".

Process the testimonial:
1. Save the raw testimonial to `04_Clients/[client-slug]/testimonial.md`
2. Offer to format it for use:
   - Short quote for homepage
   - Full testimonial for services page
   - Case study draft
3. Append the entry to `01_Core/core_testimonials.md` using
   the format from `workflow_onboarding-testimonials.md` so
   future proposals can pull this testimonial via the
   matching logic.
4. Update `04_Clients/[client-slug]/project-state.md`:
   - Tick milestones:
     - `[x] Testimonial received`
   - Move the "Follow up with [client] on testimonial" action
     from Next Actions to Done with today's date.
   - If all post-launch milestones are now complete (testimonial
     received, check-in done, no more pending actions), advance
     Pipeline State to `archived`. Otherwise leave it at
     `launched`.

### Step 8 - Offer case study generation

> Nice testimonial. Want me to draft a full case study from this? I can use:
>
> - The testimonial content
> - The project details from [client]'s folder
> - Your strategy deck outcomes
> - Before/after positioning shifts
>
> I'll draft it so you can review and publish to your portfolio.

---

## STOP
