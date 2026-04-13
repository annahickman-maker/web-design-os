---
type: workflow
slug: services-copy
status: active
tags:
  - type/workflow
  - domain/copy
---

# Workflow: Services Page Copy

Generates services/offers page copy showing what's on offer and helping visitors choose the right option.

---

## Trigger

- "write services page copy"
- "generate services copy for [client]"

---

## Prerequisites

- Brief file complete
- Brand identity generated
- Customer personas generated
- `01_Core/core_offer.md` populated (for self mode) or offers in brief

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file
2. `04_Clients/[client-slug]/strategy/brand-story-script.md`
3. `04_Clients/[client-slug]/strategy/brand-identity.md`
4. `04_Clients/[client-slug]/strategy/customer-personas.md`
5. `01_Core/core_offer.md` (self mode) or offers from brief (client mode)
6. `02_Frameworks/framework_website-sections.md`
7. `02_Frameworks/framework_copy-template-services.md`
8. `01_Core/core_voice-style.md`

### Step 2 - Generate each section

#### Hero
Benefit-driven headline about the transformation services offer. One hero statement.

Write:
- Headline
- Subheadline
- Primary CTA

#### Services Breakdown
Visual breakdown of each offer. For each offer:
- Offer name
- Who it's for
- 2-3 sentence description focused on transformation
- 3-5 key inclusions (benefits not features - use "so you can")
- Investment (or price range)
- CTA

Order strategically:
- Middle position is most clicked - put key offer there
- 3 offers is optimal (5 max)

#### Show the Transformation
Two columns:
- **"This is for anyone who..."** - 3-5 relatable struggles from personas
- **"Now imagine if you could..."** - 3-5 successful outcomes

Use exact language from personas.

#### Testimonials
If the client has testimonials specific to services, pull them. Otherwise note placeholder.

#### What's Included
Detailed breakdown of each offer. Use bullet points, bold key benefits. Focus on benefits not features.

Template: [feature] so you can [outcome]

#### Trust the Process
Step-by-step from first interaction to result. Keep simple:
- 3-5 steps max
- Short descriptions
- Demonstrate transformation from start to finish
- CTA at the end

#### Final CTA
Outcome + CTA.

### Step 3 - Voice check

Run voice check. Services copy can get salesy - keep it grounded and in the user's voice.

### Step 4 - Write output file

Write to `04_Clients/[client-slug]/copy/services.md`

Format following the structure above, clearly labelled by section.

### Step 5 - Present and refine

### Step 6 - Mark complete

---

## STOP

Wait for user direction.
