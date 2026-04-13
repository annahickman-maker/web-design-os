---
type: workflow
slug: onboarding-booking
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Workflow: Onboarding - Booking Link

Captures the designer's single booking page URL and saves it to
`01_Core/core_booking.md`. This is the one URL the whole system uses
anywhere a client needs to book a meeting - strategy calls, copy
reviews, design presentations, launch calls, discovery calls, all of
it. One link, set once, used everywhere.

---

## Trigger

Called automatically as part of the onboarding sequence after the
brand visual setup. Can also be re-run on demand with:
- "update my booking link"
- "change my booking page"
- "re-run onboarding booking"

---

## Why one link

Most designers run their scheduling in one tool (Calendly, Cal.com,
Google appointment slots, TidyCal, SavvyCal). That tool already
handles availability, timezones, reminders, rescheduling, cancellation,
and calendar sync. The Web Design OS job is NOT to replicate any of
that. The system just needs to know where to send clients when they
need to book.

Keeping it to one URL means:

- Zero infrastructure, zero maintenance, zero recurring cost from us
- Reminders and rescheduling are handled by the booking platform
- No webhook integration, no iframe embeds, no per-meeting configs
- Works with any scheduling tool the designer already uses
- Changing tools later just means updating one file

---

## Steps

### Step 1 - Explain what's needed

Tell the user:

> Next I need your booking link. This is the single page where
> clients can book any meeting with you - strategy calls, reviews,
> presentations, launch calls, all of them. Most designers already
> have this set up in Calendly, Cal.com, Google appointment slots,
> or something similar. If you don't have one yet, set up a page
> now with all your available time slots for client meetings, then
> come back and paste the link here.
>
> You only need one link. The system uses it anywhere a client
> needs to book with you.

### Step 2 - Ask for the URL

> Paste your booking page URL below.

Validate the response:
- Must be a URL (starts with http:// or https://)
- Must not be empty
- If they paste something that doesn't look like a URL, ask again

### Step 3 - Ask which tool they use

> Which tool is this?
>
> 1. Cal.com
> 2. Calendly
> 3. Google appointment slots
> 4. TidyCal
> 5. SavvyCal
> 6. Something else

Save the tool name. This is just metadata - the URL is what the
system actually uses.

### Step 4 - Optional notes

> Any notes about your availability I should remember? For example:
>
> - Timezone preferences
> - Days you don't take calls
> - Minimum notice for bookings
> - Buffer between calls
>
> Skip this if there's nothing special.

Save whatever they give, or leave blank.

### Step 5 - Write the core file

Write to `01_Core/core_booking.md`:

```
---
type: core
slug: booking
status: active
tags:
  - type/core
  - domain/scheduling
---

# Booking

The single booking link used across every Web Design OS output
that asks a client to book a meeting.

## URL

[the URL the user pasted]

## Tool

[tool name from step 3]

## Notes

[any notes from step 4, or "None"]

## Usage

Every workflow and template that creates a "book a meeting" CTA
should read this file and use the URL above as the link target.
Referenced as `[BOOKING_URL]` in templates (client portal, emails,
proposal next steps, contract follow-ups).

Reminders, rescheduling, cancellation, calendar sync, and timezone
handling are all managed by [tool name]. The Web Design OS system
does not track individual meetings - it just links to the booking
page.
```

### Step 6 - Confirm

Show the user:

> Booking link saved. I'll use this everywhere a client needs to
> book something with you - action buttons in their portal, email
> reminders, proposal follow-ups, all of it.
>
> If you ever change tools or switch to a new booking page, just
> say "update my booking link" and I'll walk you through it again.

### Step 7 - Mark complete

Update status to `active`.

---

## Validation

Before marking complete, verify:

- `01_Core/core_booking.md` exists
- It has a URL line that looks like a valid URL
- The file has proper frontmatter

---

## When things go wrong

### User doesn't have a booking page yet

Tell them:

> No problem. Before continuing, take a few minutes to set up a
> booking page in whichever tool you prefer. If you're not sure
> which to pick, Cal.com is free and has the most flexible setup.
> Add your available time slots for client meetings, then come
> back and say "continue onboarding booking".

Save progress to `00_System/system_onboarding-progress.md`.

### User wants to use multiple booking pages for different meeting types

Explain the philosophy:

> One link is cleaner. Most booking tools let you have multiple
> meeting types on a single page (discovery call, strategy meeting,
> design review), so clients land on one page and pick what they
> need. If your tool supports that, use the main page URL. If it
> doesn't, pick the link for general calls and we can extend the
> system later if it becomes a real need.

Do not create multiple [BOOKING_URL] variants in v1.0.

---

## STOP

After saving the core file and confirming with the user, stop and
let them continue the onboarding sequence. Do not auto-chain into
other workflows unless the onboarding workflow is calling this
step as part of a larger sequence.
