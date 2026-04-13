---
type: workflow
slug: customer-personas
status: active
tags:
  - type/workflow
  - domain/strategy
---

# Workflow: Customer Personas

Generates 2 distinct customer personas from the audience data in the brief. Each persona represents a specific ideal customer the brand serves.

---

## Trigger

- "generate personas"
- "create customer personas for [client]"

Called automatically by `workflow_strategy-deck.md`.

---

## Prerequisites

- Brief file with audience section complete
- `01_Core/core_voice-style.md` exists

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file - focus on Section 2 (Your Audience)
2. `02_Frameworks/framework_customer-personas.md`

### Step 2 - Identify 2 distinct segments

Analyse the audience data and identify 2 meaningfully different segments. The two should feel genuinely different, not variations of the same person.

Common useful splits:
- **The Committed / The Beginner** - Experienced vs just starting
- **The Ideal / The Entry-Level** - High-value vs accessible
- **The Pivot / The First-Timer** - Switching vs new
- **The Perfectionist / The Pragmatist** - Needs it right vs needs it done

If the brief only describes one clear segment, ask the user:
> The brief describes [one segment] clearly. Can you tell me about a second type of customer you also want to serve? Or should I focus on one primary persona instead?

### Step 3 - Name each persona

Create memorable descriptor names (not real names). Examples:
- "The Obsessed"
- "The Explorer"
- "The Accidental Founder"
- "The Overwhelmed Creative"
- "The Ready Scaler"

The name should feel like something the persona would recognise themselves as.

### Step 4 - Write 3 paragraphs per persona

Following the framework:

**Paragraph 1:** Who they are and what drives them
- Their current situation
- What motivates them
- What they care about
- What they value

**Paragraph 2:** Where they are in their journey
- Their experience level
- What they've already tried
- What hasn't worked
- Where they're stuck

**Paragraph 3:** What they're looking for in a brand
- The type of relationship they want
- What signals they trust
- What turns them off
- What would make them say yes

Writing rules:
- Use specific language, not marketing terms
- Reference real situations where possible
- Show the internal monologue
- Avoid pity - personas are real people, not victims
- Make them aspirational but relatable

### Step 5 - Write output file

Write to `04_Clients/[client-slug]/strategy/customer-personas.md` (or self mode equivalent):

```
---
type: strategy-output
slug: customer-personas-[client-slug]
status: draft
---

# Customer Personas: [client name]

## Persona 1: [Name]

[Paragraph 1 - who they are and what drives them]

[Paragraph 2 - where they are in their journey]

[Paragraph 3 - what they're looking for in a brand]

## Persona 2: [Name]

[Paragraph 1 - who they are and what drives them]

[Paragraph 2 - where they are in their journey]

[Paragraph 3 - what they're looking for in a brand]

## How to Use These Personas

When writing copy:
- Homepage: speak to [primary persona]
- Sales pages: highlight language from [primary persona]'s third paragraph
- About page: connect your story to the struggles in paragraph two
- Pricing/offers: make sure every tier speaks to one of these personas

When making design decisions:
- Visual tone should resonate with [primary persona]
- Imagery should feel familiar to them, not aspirational in a disconnected way
```

### Step 6 - Present and refine

Show the user:

> Here are the 2 personas. These become the "audience in a box" that all your copy is written for. When in doubt, I'll ask: "would [persona name] recognise themselves here?"
>
> [show personas]
>
> Does one of them need adjusting? Should I swap either for a different segment?

Revise based on feedback.

### Step 7 - Mark complete

Update file status.

---

## STOP

Do not auto-chain unless running the full strategy deck workflow.
