---
type: workflow
slug: sales-page-copy
status: active
tags:
  - type/workflow
  - domain/copy
---

# Workflow: Sales Page Copy

Generates long-form sales page copy for promoting a specific high-ticket offer.

---

## Trigger

- "write sales page copy"
- "generate sales page for [offer name]"

---

## Prerequisites

- Brief file complete
- Brand strategy complete (story, identity, personas)
- Specific offer to write for (from `01_Core/core_offer.md` or brief)

---

## Steps

### Step 1 - Identify the offer

Ask the user which specific offer this sales page is for. Load that offer's details.

### Step 2 - Load sources

Read:
1. Brief file
2. All strategy outputs
3. Offer details
4. `02_Frameworks/framework_copy-template-services.md` (Long Form Sales Page section)
5. `01_Core/core_voice-style.md`

### Step 3 - Generate each section

#### Hero
Benefit-driven headline. One statement about the transformation this service offers.

Copy prompts:
- "Become a [aspirational identity] without [pain point]"
- "It's time to [achieve this outcome]"
- "Are you ready to start [achieving this outcome]"

Write:
- Headline
- Subheadline
- Primary CTA

#### Does This Sound Familiar?
3-5 common problems or relatable situations. Specific is better. Use exact language from personas.

Format as bullet points with specific, relatable statements.

#### Introduce Your Offer
Short description focused on what it helps the customer achieve. Not features.

Write 3-4 sentences introducing the offer by name.

#### Now Imagine If You Could
3-5 successful outcomes that this offer helps the audience achieve. Specific and inspirational. Have the reader thinking "yes, that's exactly what I want."

Format as bullet points.

#### Trust the Process
Step-by-step guide from start to finish. Simple:
- 3 steps (or 5 max)
- Short descriptions
- Show the path clearly
- CTA at the end

#### What's Included
Detailed breakdown. Bullet points, bold key benefits. Focus on benefits not features using "so you can" framing.

This is where you go deep - don't be afraid of length on a sales page, but keep each bullet tight.

#### Testimonials
Pull real testimonials specific to this offer. Never invent.

#### About Me (shortened)
3-4 sentences about the designer/creator, focused on their authority to deliver this transformation.

#### Are You Ready?
Packages or payment plans with CTA. If the offer has multiple tiers:
- Present each tier clearly
- Use sales psychology: middle tier usually has a "most popular" badge
- Clear pricing
- Strong CTA per tier

#### Case Studies
If real case studies exist for this offer, include 1-2 with:
- Client name
- Their situation before
- What they did together
- Specific results
- Short quote

Only real case studies. Never invent.

#### FAQs
5-8 common questions about this specific offer. Questions should address:
- Who it's for / not for
- What's included clarifications
- Timeline
- Payment options
- Refund policy
- What happens after purchase
- Results questions ("how long does it take")

#### Final CTA
Strong, desirable outcome headline plus the primary CTA again.

### Step 4 - Voice check

Sales pages get salesy fast. Run the voice check aggressively:
- Remove any hype language the user's voice style would avoid
- Make sure empathy is present
- Keep it grounded

### Step 5 - Write output file

Write to `04_Clients/[client-slug]/copy/sales-page-[offer-slug].md`

### Step 6 - Present and refine

Sales pages often need multiple passes. Be ready to regenerate sections based on feedback.

### Step 7 - Mark complete

---

## STOP

Wait for user direction on the next page.
