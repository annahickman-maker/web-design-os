---
type: workflow
slug: onboarding-audience
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Audience

Captures a deep understanding of who the user's audience is - their situation, struggles, desires, and language.

---

## Trigger

Called after `workflow_onboarding-positioning.md` completes.

---

## Purpose

Fill in `01_Core/core_audience.md` with:
- Current state of the audience
- Desired state of the audience
- Core struggles and misbeliefs
- How they describe their own situation
- Where they hang out / how they're found

---

## Steps

### Step 1 - Explain

> Now let's get specific about your audience. The more specific you are, the better everything I generate for you will be.
>
> I'll ask a few questions about the people you serve. Answer from your real experience - what you've actually heard clients say, not marketing assumptions.

### Step 2 - Ask questions one at a time

**Q1:** Describe one specific person (real or composite) who represents your ideal customer or client. What do they do, how old are they roughly, what's their situation?

**Q2:** What are they struggling with right now? What do they complain about? What do they wish they could fix?

**Q3:** What have they already tried that hasn't worked? What's their experience been so far?

**Q4:** What do they actually want at the deepest level? (Not what they'd write on a form - what's the real desire underneath?)

**Q5:** What do they believe is true that might be wrong or limiting them? What mindset or assumption is keeping them stuck?

**Q6:** How do they talk about their own situation? What specific phrases or words do they use? (If you can quote actual things people have said to you, that's gold.)

**Q7:** Where do they hang out online? What do they read, watch, follow?

**Q8:** What would success look like for them in 6-12 months?

### Step 3 - Draft audience summary

> Based on your answers, here's how I'd describe your audience:
>
> [2-3 paragraph summary covering who they are, what they're struggling with, what they want, and the core misbelief keeping them stuck]
>
> Does this feel accurate? Anything you'd add or change?

Refine until they're happy.

### Step 4 - Write core file

Create `01_Core/core_audience.md`:

```
---
type: core
slug: audience
status: active
tags:
  - type/core
  - domain/strategy
---

# Audience

## Who They Are
[specific description]

## Current State
[their situation, struggles, what they complain about]

## What They've Tried
[what hasn't worked]

## Desired State
[what they actually want]

## Core Misbeliefs
[limiting beliefs keeping them stuck]

## Their Language
[direct quotes, phrases they use]

## Where They Hang Out
[platforms, content they consume]

## Success Looks Like
[6-12 month outcome]

## Audience Summary
[refined paragraphs]
```

### Step 5 - Update progress and chain

Update progress file, set current to `onboarding-story`.

> Great. Audience saved. Next: your story - how you got here and why you do this work.

Automatically begin `workflow_onboarding-story.md`.

---

## STOP

Do not chain beyond the next workflow.
