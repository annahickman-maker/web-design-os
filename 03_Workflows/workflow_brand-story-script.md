---
type: workflow
slug: brand-story-script
status: active
tags:
  - type/workflow
  - domain/strategy
---

# Workflow: Brand Story Script

Generates a complete Storybrand-style brand story script from the client brief. This is the messaging foundation for everything else.

---

## Trigger

User says any of:
- "generate brand story"
- "generate brand story script"
- "create story script for [client]"

Called automatically as part of `workflow_strategy-deck.md` if running the full strategy generation.

---

## Prerequisites

- Brief file must exist with audience and transformation data
- On custom path: refinement meeting must be complete
- `01_Core/core_voice-style.md` must exist (for voice matching)

---

## Steps

### Step 1 - Load sources

Read:
1. `04_Clients/[client-slug]/brief.md` (or `05_Projects/my-website/brief.md` for self mode)
2. `02_Frameworks/framework_brand-story-script.md` (the methodology)
3. `01_Core/core_voice-style.md` (the user's voice)

### Step 2 - Generate each story component

Following the framework, generate each of these components:

**1. A Character**
Who is the customer? What struggle are they facing right now?
- Pull from the audience section of the brief
- Be specific - quote their language where possible
- 2-4 sentences

**2. External Problem**
The surface level need. What is the customer typing into Google?
- 1-2 sentences
- Use their actual language

**3. Internal Problem**
What feelings are they having because of the external problem?
- 2-3 sentences
- Focus on the emotional weight

**4. Philosophical Problem**
Why is it wrong that customers experience this problem? Usually begins with "You shouldn't have to..."
- 1-2 sentences
- This is the moral/philosophical stance of the brand

**5. Villain**
What's stopping the customer from achieving their transformation? (Time, money, mindset, lack of knowledge)
- 2-3 sentences
- Name the specific thing that's blocking them

**6. Positive Outcomes**
The transformation they'll experience after working with the brand.
- 4-6 bullet points
- Focus on results and emotional states, not features

**7. Plan**
A simple step-by-step process that makes it easy to say YES.
- 3 steps ONLY (if you confuse you lose)
- Each step one short sentence
- Named the steps clearly

**8. Empathy**
How does the brand show it understands the customer's struggles?
- Use the user's own story from `01_Core/core_my-story.md` (self mode) or client's story from brief
- 3-4 sentences that connect personal experience to customer's situation

**9. Authority**
Why should the customer trust this brand to solve their problems?
- Credentials, experience, results, proof points
- 3-4 sentences
- Pull real facts from the brief - NEVER invent credentials

**10. Failure**
What will happen if the customer doesn't solve their problem?
- 2-3 sentences
- Gentle reminder of the cost of inaction

### Step 3 - Voice check

After drafting all 10 components, run a voice check:

1. Does every section sound like the user (not generic copy)?
2. Are specific phrases from `01_Core/core_voice-style.md` used where appropriate?
3. Are any of their "avoid" words present? (Remove them.)
4. Is the tone aligned with their spectrum positions?

Revise anything that doesn't match.

### Step 4 - Write output file

**For client mode:**
Write to `04_Clients/[client-slug]/strategy/brand-story-script.md`

**For self mode:**
Write to `05_Projects/my-website/strategy/brand-story-script.md`

Format:

```
---
type: strategy-output
slug: brand-story-script-[client-slug]
status: draft
tags:
  - type/strategy-output
---

# Brand Story Script: [client name]

## 1. A Character
[content]

## 2. External Problem
[content]

## 3. Internal Problem
[content]

## 4. Philosophical Problem
[content]

## 5. Villain
[content]

## 6. Positive Outcomes
- [outcome 1]
- [outcome 2]
- ...

## 7. Plan
1. [step 1]
2. [step 2]
3. [step 3]

## 8. Empathy
[content]

## 9. Authority
[content]

## 10. Failure
[content]
```

### Step 5 - Present to user

Show the user the complete brand story script and ask:

> Here's the brand story script. This becomes the foundation for homepage copy, about pages, and all messaging.
>
> Want me to adjust anything? Or should we move on to generating the brand identity (values, mission, Golden Circle)?

### Step 6 - Refine based on feedback

If the user wants changes, revise the relevant sections and re-present. Repeat until approved.

### Step 7 - Mark complete

Update the file status from `draft` to `active` and update the project state:

```
Strategy components complete:
- [x] brand-story-script
```

---

## STOP

Do not auto-generate other strategy components unless the user explicitly asks or this is running as part of the full strategy deck workflow.
