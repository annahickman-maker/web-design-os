---
type: workflow
slug: client-email
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Draft Client Email

Generates any client email from the template library, personalised to the designer's voice and the specific client context.

---

## Trigger

- "draft email for [client]"
- "send [template name] email to [client]"
- "write [client] an email about [topic]"

Also called internally by other workflows (new-lead, discovery-call, project-kickoff, etc.)

---

## Prerequisites

- Client exists in `04_Clients/`
- `01_Core/core_voice-style.md` exists
- Email templates exist in `06_Templates/emails/`

---

## Steps

### Step 1 - Identify the email type

If called by another workflow, the template is already specified.

If called directly by the user, ask:

> What kind of email do you want to send?
>
> Common templates:
> 1. **Discovery call invite** - respond to a new lead
> 2. **Not a good fit** - politely decline a lead
> 3. **Client portal** - send proposal, contract, invoice
> 4. **Proposal follow-up** - nudge after 48 hours
> 5. **Project confirmed** - welcome them after deposit
> 6. **Questionnaire reminder** - reminder to fill in the brief
> 7. **Delivering designs** - present designs for feedback
> 8. **Feedback follow-up** - check in after sending designs
> 9. **Website content** - deliver draft copy for review
> 10. **Final presentation** - deliver final designs
> 11. **Project on hold** - unresponsive client
> 12. **Project terminated** - ending a difficult project
> 13. **Handover** - offboarding after launch
> 14. **Website launch** - congratulations after going live
> 15. **Support check-in** - reminder that support ends soon
> 16. **Testimonial request** - ask for testimonial post-launch
> 17. **Referral request** - ask for referrals from happy clients
> 18. **Custom** - tell me what you want to say
>
> Which one? Or describe something different.

### Step 2 - Load the template

Read the matching template from `06_Templates/emails/email_[name].md`.

If no matching template exists (e.g. custom), skip this step.

### Step 3 - Load context

Read:
1. `04_Clients/[client-slug]/client.md` (client details)
2. `04_Clients/[client-slug]/project-state.md` (current phase, recent activity)
3. `01_Core/core_voice-style.md` (designer's voice)
4. Any other relevant files (brief, strategy, etc.)

### Step 4 - Personalise the template

Take the template and personalise it:

- Replace all placeholders with real client data
- Adjust tone to match the designer's voice style
- Reference specific things from the client's project (shows attention)
- Remove any language that doesn't sound like the designer
- Add specific details relevant to this client's situation

**Important:** Never send generic template text verbatim. The template is a starting point, not a final email.

### Step 5 - Generate subject line

Write a subject line that:
- Is short (under 50 characters)
- Sounds personal (not "marketing")
- Makes it clear what the email is about
- Uses the client's name or project name if appropriate

### Step 6 - Voice check

Run the email through the voice check:
- Does it sound like the designer, not a template?
- Are any "avoid" words present? (Remove.)
- Any em dashes? (Replace with hyphens.)
- Any emojis the designer wouldn't use? (Remove.)
- Is the tone right for the relationship stage?

### Step 7 - Present the email

Show the designer:

> Here's your email draft:
>
> **Subject:** [subject line]
>
> [email body]
>
> Want to:
> 1. Send as is (copy to clipboard for you)
> 2. Make changes
> 3. Regenerate with a different angle

### Step 8 - Log the email

If the user confirms they're sending it, log to `04_Clients/[client-slug]/emails.md`:

```
## [date] - [subject]

### Template used
[template name]

### Content
[full email]

### Notes
[any context about this send]
```

### Step 9 - Update project state if needed

Some emails trigger status changes:
- "project-confirmed" → update phase to "awaiting interview"
- "delivering-designs" → update phase to "awaiting feedback"
- "handover" → update phase to "completed"

Apply the appropriate update.

---

## STOP

Wait for confirmation that the email has been sent before moving on.
