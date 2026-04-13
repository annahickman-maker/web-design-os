---
type: workflow
slug: onboarding-positioning
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Positioning

Captures the user's positioning - who they are, what they do, and who they do it for. This becomes the foundation for all generated content.

---

## Trigger

Automatically called after mode (and paths, if client mode) onboarding. Or user says "run onboarding" / "continue onboarding".

---

## Purpose

Fill in `01_Core/core_positioning.md` with:
- Business name
- What the business does (in plain words)
- Who it serves
- The transformation it provides
- The core positioning statement

---

## Steps

### Step 1 - Explain what we're doing

> We'll start with positioning. This is the foundation for everything else. If your positioning is clear, your copy writes itself. If it's muddy, nothing else works.
>
> I'm going to ask you a few questions. Answer naturally - don't overthink it. We can refine later.

### Step 2 - Ask questions one at a time

Ask each question, wait for the answer, then move to the next. Don't batch them.

**Q1:** What's the name of your business or brand?

**Q2:** In one plain sentence, what do you actually do?
(Not marketing speak. How would you describe it to a friend at a dinner party?)

**Q3:** Who specifically do you do this for? Describe the kind of person or business you want to work with.
(Be as specific as you can. "Small businesses" is too vague. "Yoga studio owners who want to fill their classes without running ads" is useful.)

**Q4:** What transformation do you provide? Where are your customers before they work with you, and where are they after?

**Q5:** What's the biggest thing that makes you different from others doing similar work?

**Q6 (client mode only):** What's your approach to pricing? Are you a fixed-package designer, a day-rate designer, a custom-project designer, or a mix?

### Step 3 - Draft the positioning statement

Based on their answers, draft a positioning statement they can refine:

> Here's how I'd summarise your positioning based on your answers:
>
> "[Business name] helps [specific audience] go from [before state] to [after state] through [their unique approach]. Unlike others who [what competitors do], they [what makes this different]."
>
> Does this feel accurate? Anything you'd change?

Wait for feedback. Refine until they're happy.

### Step 4 - Write core file

Create `01_Core/core_positioning.md`:

```
---
type: core
slug: positioning
status: active
tags:
  - type/core
  - domain/strategy
---

# Positioning

## Business Name
[their answer]

## What They Do
[plain sentence]

## Who They Serve
[specific audience]

## Transformation
Before: [their before state]
After: [their after state]

## Differentiator
[what makes them different]

## Pricing Approach
[client mode only - fixed/day-rate/custom/mix]

## Positioning Statement
[the refined statement]
```

### Step 5 - Update progress and chain

Update `00_System/system_onboarding-progress.md` - mark positioning complete, set current to `onboarding-audience`.

Then say:

> Nice. Positioning saved. Next up: your audience - who they actually are and what makes them tick.

Automatically begin `workflow_onboarding-audience.md`.

---

## STOP

Do not chain beyond the next workflow.
