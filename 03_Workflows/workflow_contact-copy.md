---
type: workflow
slug: contact-copy
status: active
tags:
  - type/workflow
  - domain/copy
---

# Workflow: Contact Page Copy

Generates contact page copy that converts interested visitors into qualified leads.

---

## Trigger

- "write contact page copy"
- "generate contact copy for [client]"

---

## Prerequisites

- Brief file complete
- Brand identity generated
- `01_Core/core_cta.md` populated

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file
2. Brand identity
3. `01_Core/core_cta.md`
4. `02_Frameworks/framework_copy-template-services.md` (Contact Page section)
5. `01_Core/core_voice-style.md`

### Step 2 - Generate sections

#### What Happens Next
Brief description of what visitors can expect after contacting.

Example: "We like to start with a chat about you and your business. So fill in the form and we'll set up a call."

Tone: warm, specific, sets expectations. Not corporate "we'll get back to you within 24 hours."

Write:
- Headline
- 2-3 sentence description

#### Contact Information
Pull from the brief or core files:
- Email
- Phone (if provided)
- Address (if local business)
- Office hours (if relevant)
- Social media links

#### Contact Form Fields
Design the contact form to pre-qualify leads. Ask the user:

> What do you need to know from someone contacting you to decide if they're a good fit?

Based on their answer, propose form fields. Typical:
- Name
- Email
- Business name
- Website (if they have one)
- Budget range (dropdown)
- Timeline (dropdown)
- Tell me about your project (textarea)

Write the field labels in the user's voice (not generic).

#### Thank You Message
Copy for what happens after submission. Set expectations:
- When they'll hear back
- What to expect
- Optional next step (e.g. follow on social)

### Step 3 - Voice check

Contact pages are often bland. Keep this warm and specific to the user's voice.

### Step 4 - Write output file

Write to `04_Clients/[client-slug]/copy/contact.md`

```
---
type: copy
slug: contact-[client-slug]
---

# Contact Page Copy

## Hero
[Headline]
[Description]

## Contact Information
- Email: [email]
- [other info]

## Contact Form

### Field Labels
- [field 1 label]
- [field 2 label]
...

## Thank You Message
[content]
```

### Step 5 - Present and refine

### Step 6 - Mark complete

---

## STOP
