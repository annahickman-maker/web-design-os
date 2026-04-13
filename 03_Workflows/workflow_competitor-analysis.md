---
type: workflow
slug: competitor-analysis
status: active
tags:
  - type/workflow
  - domain/strategy
---

# Workflow: Competitor Analysis

Analyses competitors from the brief, with optional live web research, and generates positioning insights.

---

## Trigger

- "run competitor analysis"
- "analyse competitors for [client]"

Called automatically by `workflow_strategy-deck.md`.

---

## Prerequisites

- Brief file with Section 3 (Competitors) complete
- Web access (optional but recommended)

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file - focus on Section 3 (Competitors)
2. `02_Frameworks/framework_competitor-analysis.md`
3. `01_Core/core_positioning.md` (for context)

### Step 2 - Ask about research depth

> The brief lists these competitors: [list names]. I can:
>
> 1. Do a quick analysis based on what the client told me in the brief
> 2. Do a deep analysis by visiting each competitor's website and researching their positioning, messaging, and approach (takes 5-10 minutes)
>
> Which would you prefer?

### Step 3 - If deep research selected

For each competitor:
1. Visit their website (use WebFetch tool)
2. Read their homepage, about page, and services/pricing page
3. Check for any testimonials on their site
4. Look for their unique positioning claims

Extract for each competitor:
- Actual USP from their website
- Services/products and pricing if visible
- Tone and positioning
- Target audience signals
- Visual and brand style

### Step 4 - Analyse each competitor

For each competitor (3 is the standard), fill in:

**USP** - What they're known for. 1-2 sentences from their own positioning.

**Strengths** - Specific things they do well. Not generic - use observations.

**Weaknesses** - Gaps, limitations, or things they're missing. Focus on opportunities not flaws.

**How We're Different** - The strategic opening for this client's brand. This is the most important column.

### Step 5 - Generate positioning synthesis

After analysing all 3 competitors, synthesise:

**USP Statement for the client:**
A one-sentence statement of the client's unique position. Based on the "How We're Different" column across all competitors, distilled into a defensible claim.

**Core Messaging Statement:**
The underlying idea that carries across all the client's brand messaging. Not a tagline - the concept.

### Step 6 - Write output file

Write to `04_Clients/[client-slug]/strategy/competitor-analysis.md`:

```
---
type: strategy-output
slug: competitor-analysis-[client-slug]
status: draft
---

# Competitor Analysis: [client name]

## Competitor 1: [name]

### USP
[1-2 sentences]

### Strengths
[specific strengths]

### Weaknesses
[gaps and limitations]

### How We're Different
[strategic opening]

## Competitor 2: [name]

[same structure]

## Competitor 3: [name]

[same structure]

---

## Positioning Synthesis

### Client's USP
[1-sentence statement]

### Core Messaging
[the underlying idea]

### Brand Values (supporting positioning)
[reference the 5 values from brand identity if already generated]

### Aesthetic Direction
[brief note on how visual style differentiates]
```

### Step 7 - Present findings

Show the user:

> Here's the competitor analysis. The key insight is:
>
> **[summarise the main strategic opportunity in 1-2 sentences]**
>
> [show full analysis]
>
> Does this positioning feel right? Any competitors you want me to dig deeper on or swap out?

Revise as needed.

### Step 8 - Mark complete

Update status.

---

## STOP

Do not auto-chain unless part of the full strategy deck workflow.
