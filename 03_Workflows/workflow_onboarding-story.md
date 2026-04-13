---
type: workflow
slug: onboarding-story
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Your Story

Captures the user's personal story - the journey that brought them to do this work. This powers about pages, personal brand content, and builds the empathy foundation for all copy.

---

## Trigger

Called after `workflow_onboarding-audience.md` completes.

---

## Purpose

Fill in `01_Core/core_my-story.md` with:
- Where they started
- Turning point or catalyst
- Journey and key milestones
- What they learned that shapes their work now
- The shared struggle with their audience

---

## Steps

### Step 1 - Explain

> Now let's capture your story. This isn't about vanity - it's about connection. Your audience needs to know why you do what you do and what qualifies you to help them.
>
> The best about pages and origin stories share struggles the audience can relate to. Then they show the transformation. Then they link that transformation to how you can help others do the same.
>
> I'll ask a few questions to pull out the key parts of your story.

### Step 2 - Ask questions one at a time

**Q1:** Where were you before you started doing this work? What was your situation, career, or business like?

**Q2:** What was the turning point? What happened that made you decide to do this?

**Q3:** What was hard or confusing in the beginning? What mistakes did you make? What did you try that didn't work?

**Q4:** When did things start clicking? What changed? What did you figure out?

**Q5:** Where are you now? What does your work look like today?

**Q6:** What's the biggest lesson or insight you took from that journey that shapes how you work with your audience now?

**Q7:** What part of your story do you think your audience would most relate to? Which struggle of theirs mirrors yours?

### Step 3 - Draft story summary

> Here's your origin story in the structure I'll use for your about page and content:
>
> **Before:** [your starting state]
>
> **Turning point:** [what changed]
>
> **Struggle:** [what was hard]
>
> **Breakthrough:** [what clicked]
>
> **Now:** [where you are]
>
> **The lesson:** [what you learned]
>
> **Shared with your audience:** [the connection point]
>
> Does this feel accurate? Anything to adjust?

Refine until they're happy.

### Step 4 - Write core file

Create `01_Core/core_my-story.md`:

```
---
type: core
slug: my-story
status: active
tags:
  - type/core
  - domain/strategy
---

# My Story

## Before
[starting state]

## Turning Point
[catalyst]

## Struggle
[what was hard]

## Breakthrough
[what clicked]

## Now
[current state]

## Core Lesson
[what they learned]

## Shared Struggle With Audience
[connection point]

## Full Story Narrative
[draft paragraphs of the full story in their voice]
```

### Step 5 - Update progress and chain

Update progress. Next: `onboarding-voice`.

> Nice. Story saved. Now one of the most important pieces: your voice. This is how I'll learn to sound like you when I generate copy and emails.

Automatically begin `workflow_onboarding-voice.md`.

---

## STOP

Do not chain beyond the next workflow.
