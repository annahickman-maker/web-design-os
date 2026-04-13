---
type: workflow
slug: brand-identity
status: active
tags:
  - type/workflow
  - domain/strategy
---

# Workflow: Brand Identity

Generates the complete brand identity components: Golden Circle (What/How/Why), mission statement, values, and tone of voice positioning.

---

## Trigger

User says any of:
- "generate brand identity"
- "create brand identity for [client]"
- "generate mission and values"

Called automatically by `workflow_strategy-deck.md`.

---

## Prerequisites

- Brief file complete
- Brand story script generated (recommended but not required)
- `01_Core/core_voice-style.md` exists

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file
2. Brand story script (if generated)
3. `02_Frameworks/framework_brand-identity.md`
4. `01_Core/core_voice-style.md`

### Step 2 - Generate the Golden Circle

**WHAT** (1-2 sentences)
A short description of the product/service to help [ideal customer] achieve [desired outcome].

**HOW** (1-2 sentences)
A short description of the approach and how it helps the customer achieve the desired outcome.

**WHY** (1-2 sentences)
The mission the brand is working towards - the philosophical belief about how the world should be.

The WHY is the hardest and most important. It should feel bigger than the business itself. Pull from the philosophical problem in the brand story script if generated.

### Step 3 - Generate the Brand Mission Statement

Use this formula:
"[Brand] is (a/an) [adjective/s] business that strives to provide [functional benefit] to [short description of ideal customer]. (I/we) exist to make (him/her/them) feel [desired emotion] when (he/she/they) (is/are) [current emotion or pain point]."

Fill it in from the brief. The mission statement should sound natural when read aloud.

### Step 4 - Generate 5 Brand Values

5 single-word descriptors, each with a 1-sentence explanation.

Rules:
- Must be consistent with the brand's actual character (not aspirational fluff)
- Each value should distinguish the brand from competitors
- Each value should guide decisions (if the value isn't actionable, it's decoration)
- Avoid generic values like "quality" or "innovation" - get specific

Good examples from reference deck:
- Intentional - We make decisions with care and purpose, never by default
- Empowering - We lift up rather than tell down
- Community-Driven - We build with our audience, not at them
- Collaborative - We believe the best work happens with others, not alone
- Innovative - We're willing to try new approaches, even if unproven

### Step 5 - Generate Tone of Voice Positions

For client work, infer positions from the client's brief, brand story, and any existing content they shared. Position them on each spectrum:

- Formal ↔ Friendly
- Mainstream ↔ Edgy
- Serious ↔ Playful
- Realistic ↔ Idealistic
- Exclusive ↔ Accessible
- Careful ↔ Spontaneous
- Traditional ↔ Progressive

Give specific positions (e.g. "7/10 toward Friendly") rather than "middle."

### Step 6 - Write output file

**For client mode:**
Write to `04_Clients/[client-slug]/strategy/brand-identity.md`

**For self mode:**
Write to `05_Projects/my-website/strategy/brand-identity.md`

Format:

```
---
type: strategy-output
slug: brand-identity-[client-slug]
status: draft
---

# Brand Identity: [client name]

## Brand Mission Statement
[full mission statement]

## The Golden Circle

### WHAT
[description]

### HOW
[description]

### WHY
[description]

## Brand Values

### 1. [Value name]
[1-sentence explanation]

### 2. [Value name]
[1-sentence explanation]

### 3. [Value name]
[1-sentence explanation]

### 4. [Value name]
[1-sentence explanation]

### 5. [Value name]
[1-sentence explanation]

## Tone of Voice

- Formal ↔ Friendly: [position]
- Mainstream ↔ Edgy: [position]
- Serious ↔ Playful: [position]
- Realistic ↔ Idealistic: [position]
- Exclusive ↔ Accessible: [position]
- Careful ↔ Spontaneous: [position]
- Traditional ↔ Progressive: [position]

## Tone Summary
[2-3 sentences describing the overall tone in natural language]
```

### Step 7 - Present and refine

Show the user:

> Here's the brand identity I've generated. This defines the core of the brand - every piece of copy and design we create will reflect these.
>
> [show content]
>
> What do you want to adjust? Or should we move on to customer personas?

Revise based on feedback.

### Step 8 - Mark complete

Update file status to `active`.

---

## STOP

Do not auto-chain unless running the full strategy deck workflow.
