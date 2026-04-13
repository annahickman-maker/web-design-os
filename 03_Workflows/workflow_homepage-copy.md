---
type: workflow
slug: homepage-copy
status: active
tags:
  - type/workflow
  - domain/copy
---

# Workflow: Homepage Copy

Generates full homepage copy, section by section, using the brand strategy and voice.

---

## Trigger

- "write homepage copy"
- "generate homepage copy for [client]"
- "homepage copy"

---

## Prerequisites

- Brief file complete
- Brand story script generated
- Brand identity generated
- Customer personas generated
- Sitemap generated (to know which sections to include)
- `01_Core/core_voice-style.md` exists

---

## Steps

### Step 1 - Load all sources

Read:
1. `04_Clients/[client-slug]/brief.md`
2. `04_Clients/[client-slug]/strategy/brand-story-script.md`
3. `04_Clients/[client-slug]/strategy/brand-identity.md`
4. `04_Clients/[client-slug]/strategy/customer-personas.md`
5. `04_Clients/[client-slug]/strategy/sitemap.md`
6. `02_Frameworks/framework_website-sections.md` (the cheatsheet)
7. `02_Frameworks/framework_copy-template-services.md` (structural reference)
8. `01_Core/core_voice-style.md` (voice)

### Step 2 - Confirm scope

Check the sitemap for the homepage sections. Show the user:

> I'll write the full homepage copy section by section. Based on your sitemap, the homepage has:
>
> 1. [section 1]
> 2. [section 2]
> 3. ...
>
> I'll generate each section using the brand story, personas, and your voice. Sound good?

### Step 3 - Generate each section

For each section in the sitemap, use the website sections framework to structure it. Pull content from the brand story script and brand identity.

#### Hero Section
Must tell the visitor (at a glance):
- What is it?
- Who is it for?
- Why do I need this?
- What action do you want me to take?

Write:
- **Headline** (benefit-driven, max 10 words)
- **Subheadline** (1-2 sentences explaining the value)
- **Primary CTA text**

Use copy prompts from the framework:
- "Get [desirable outcome/emotion] without [pain point]"
- "[Adjective] [service] to help you [get results / feel emotion]"

#### Authority Section
Write a short intro line that sets up the authority, plus:
- Logo list of brands worked with or publications featured in
- Or a single powerful testimonial with attribution
- Or a specific stat/number

#### Problem Solving / Building Connection
Pull directly from the brand story script:
- Character's situation
- Internal problem (how they feel)
- Connect with "have you been there" language

Write 3-5 bullet points of specific struggles the audience faces. Use their exact language from personas.

#### Offers Section
For each offer in `01_Core/core_offer.md`:
- Offer name
- 1-sentence description focused on benefit
- Who it's perfect for
- CTA

Order by importance. Middle position is most clicked - put the key offer there.

#### About Section
Short version - 2-3 sentences.
- Establish authority (use the Authority element from brand story script)
- Build connection (use the Empathy element)
- Tease the longer story on the About page

#### Case Studies / Testimonials
Only include if the client has real testimonials in the brief. If they don't:
- Leave a placeholder
- Note in the output: "Client to provide 2-3 testimonials before publish"

Never invent testimonials.

#### Lead Magnet (if applicable)
If the user has a freebie in `01_Core/core_cta.md`:
- Benefit-driven headline
- 1-sentence description of what they get
- CTA to download

#### Final CTA
- Desirable outcome headline (bigger than the offer - emotional)
- 1 sentence supporting copy
- Primary CTA button

### Step 4 - Voice check

Read the generated copy and check:
- Does every section sound like the user's voice?
- Are their signature phrases present where appropriate?
- Are any "avoid" words present? (Remove.)
- Is the tone aligned with their spectrum positions?
- Are em dashes present? (Remove - use - instead.)

Revise anything that drifts from their voice.

### Step 5 - Write output file

Write to `04_Clients/[client-slug]/copy/homepage.md`:

```
---
type: copy
slug: homepage-[client-slug]
status: draft
---

# Homepage Copy: [client name]

## Hero

**Headline:** [headline]

**Subheadline:** [subheadline]

**Primary CTA:** [button text]

## Authority

[intro line]

[logo list / testimonial / stat]

## Problem Solving / Connection

[opening line]

- [struggle 1]
- [struggle 2]
- [struggle 3]

[closing line]

## Offers

### [Offer 1 name]
[1-sentence description]
[Who it's for]
[CTA]

### [Offer 2 name]
[same structure]

### [Offer 3 name]
[same structure]

## About (short)

[2-3 sentences]

[CTA to full About page]

## Testimonials / Case Studies

[If real testimonials exist:]
[formatted testimonials]

[If placeholder needed:]
> PLACEHOLDER: 2-3 testimonials needed from client before publish

## Lead Magnet

**Headline:** [headline]

[1-sentence description]

**CTA:** [button text]

## Final CTA

**Headline:** [desirable outcome]

[supporting copy]

**CTA:** [button text]
```

### Step 6 - Present

> Homepage copy generated and saved. Here's the full output:
>
> [show the copy]
>
> Want me to revise any section? Or should I move on to the About page?

### Step 7 - Mark complete

Update status.

---

## STOP

Do not auto-chain to other copy workflows unless the user asks.
