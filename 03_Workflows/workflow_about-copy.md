---
type: workflow
slug: about-copy
status: active
tags:
  - type/workflow
  - domain/copy
---

# Workflow: About Page Copy

Generates full About page copy using the user's story and brand identity.

---

## Trigger

- "write about page copy"
- "generate about copy for [client]"

---

## Prerequisites

- Brief file complete
- Brand story script generated
- Brand identity generated
- `01_Core/core_my-story.md` exists (for self mode) or client story in brief
- `01_Core/core_voice-style.md` exists

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file
2. `04_Clients/[client-slug]/strategy/brand-story-script.md`
3. `04_Clients/[client-slug]/strategy/brand-identity.md`
4. Client story from brief (or user's `01_Core/core_my-story.md` for self mode)
5. `02_Frameworks/framework_website-sections.md`
6. `02_Frameworks/framework_copy-template-services.md` (About page section)
7. `01_Core/core_voice-style.md`

### Step 2 - Reminder: About is not about you

The About page is not about the user - it's about how they help their audience get what they want. This page must demonstrate why the audience can trust them.

### Step 3 - Generate each section

#### Intro
Relatable micro-story about a common struggle shared with the audience. Links back to how this qualifies them to help.

Pull from:
- Before/starting state from their story
- The "shared struggle with audience" element
- The turning point

Write as a 2-3 paragraph opening that feels personal and specific, not corporate.

#### Your Story
Why they started, their mission to improve customers' lives. Key milestones showing:
- Struggles overcome
- Experiences that qualify them to help
- Interesting details that build connection

Write 3-5 paragraphs. Can include specific numbers or moments.

#### Values (optional but recommended)
Pull the 5 brand values from brand identity. Present each with its 1-sentence explanation.

#### What this means for you (the reader)
Translate the story into customer benefits:
- Because of this story, [benefit to customer]
- Because of this experience, [benefit to customer]

3-4 bullet points.

#### Final CTA
Desirable outcome + primary CTA.

### Step 4 - Voice check

Run voice check as in other copy workflows. About pages especially need to sound personal - drop any corporate tone.

### Step 5 - Write output file

Write to `04_Clients/[client-slug]/copy/about.md`:

```
---
type: copy
slug: about-[client-slug]
status: draft
---

# About Page Copy: [client name]

## Hero

**Headline:** [relatable headline or statement]

**Subheadline:** [1-sentence setup for the story]

## Intro

[2-3 paragraph opening]

## Your Story

[3-5 paragraphs of the journey]

## Values

### [Value 1]
[1-sentence explanation]

### [Value 2]
[same]

[etc]

## What This Means For You

- [Benefit 1]
- [Benefit 2]
- [Benefit 3]
- [Benefit 4]

## Final CTA

**Headline:** [outcome]

[supporting copy]

**CTA:** [button text]
```

### Step 6 - Present and refine

Show the user. Ask if anything feels off.

### Step 7 - Mark complete

Update status.

---

## STOP

Wait for user direction on next step.
