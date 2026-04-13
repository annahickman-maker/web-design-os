---
type: workflow
slug: sitemap
status: active
tags:
  - type/workflow
  - domain/design
---

# Workflow: Sitemap

Generates the website sitemap - pages, navigation, section breakdowns, and footer structure.

---

## Trigger

- "generate sitemap"
- "create sitemap for [client]"

Called automatically by `workflow_strategy-deck.md`.

---

## Prerequisites

- Brief file complete (especially project goals and required features)
- Brand strategy started (identity and personas helpful)

---

## Steps

### Step 1 - Load sources

Read:
1. Brief file - especially Section 6 (This Project)
2. `02_Frameworks/framework_sitemap.md`
3. `02_Frameworks/framework_customer-journey.md`
4. Brand identity (if generated)

### Step 2 - Identify required pages

Based on the brief, determine which pages are needed. Default inventory:

**Essential (almost always needed):**
- Homepage
- About
- Contact

**Commonly needed:**
- Services / Products
- Portfolio / Case Studies (for service businesses)

**Offer-specific:**
- Sales pages (one per high-ticket offer)
- Pricing page

**Content-related:**
- Blog / Resources
- Podcast / Videos

**Legal (required):**
- Privacy Policy
- Terms & Conditions
- Accessibility Statement

**eCommerce-specific:**
- Shop / Collections
- Product pages (template)
- FAQs
- Shipping & Returns

Ask the user to confirm:

> Based on the brief, here's what I think the sitemap needs:
>
> **Main pages:**
> - Homepage
> - [page]
> - [page]
>
> **Supporting pages:**
> - [page]
>
> **Legal:**
> - Privacy Policy, Terms, Accessibility
>
> Anything missing? Anything you don't need?

### Step 3 - Design the navigation

Based on the confirmed pages, design the main navigation:

**Navigation principles:**
- 3-5 menu links max
- Plus the main CTA button
- Remove anything that doesn't answer a pre-conversion question

Suggest the navigation structure:

> Proposed navigation:
>
> **Menu:** [Page 1] | [Page 2] | [Page 3] | [Page 4]
> **CTA:** [button text → destination]
>
> What do you think?

### Step 4 - For each page, design the sections

For every page in the sitemap, use the framework to design its sections.

**Homepage (typical):**
1. Hero - value proposition + CTA
2. Logo list / authority
3. Problem solving / building connection
4. Offers / services overview
5. About (short)
6. Case studies / testimonials
7. Lead magnet
8. Final CTA

**About (typical):**
1. Hero intro - relatable micro-story
2. Your story - milestones
3. Values/mission
4. Call to action

**Services (typical):**
1. Hero - benefit-driven headline
2. Services breakdown
3. Transformation (before/after)
4. Testimonials
5. What's included
6. Trust the process
7. CTA

Adapt each to the client's specific needs.

### Step 5 - Design the footer

Following the framework, footer should include:

**Contact section:**
- Email, phone, address (if applicable)
- Social media links
- Contact form link

**Legal section:**
- Privacy Policy
- Terms & Conditions
- Accessibility Statement

**Quick Links:**
- Secondary pages
- FAQs
- Copyright notice

### Step 6 - Write output file

Write to `04_Clients/[client-slug]/strategy/sitemap.md`:

```
---
type: strategy-output
slug: sitemap-[client-slug]
status: draft
---

# Sitemap: [client name]

## Navigation

### Main Menu
- [link 1]
- [link 2]
- [link 3]
- [link 4]

### Primary CTA
[button text] → [destination]

---

## Pages

### Homepage
Purpose: [1 sentence]

Sections:
1. **[Section name]** - [purpose]
2. **[Section name]** - [purpose]
3. **[Section name]** - [purpose]
...

### About
[same structure]

### [Other pages]
[same structure]

---

## Footer

### Contact
- Email
- Social links
- Contact form link

### Legal
- Privacy Policy
- Terms & Conditions
- Accessibility Statement

### Quick Links
- [links]
- Copyright notice
```

### Step 7 - Present and refine

> Here's the sitemap. Every page has a clear purpose and the sections are built to serve the customer journey.
>
> [show sitemap]
>
> Want to adjust any sections? Reorder? Add or remove pages?

### Step 8 - Mark complete

Update status. The sitemap now becomes the reference for all the copy workflows.

---

## STOP

Do not auto-chain unless part of the full strategy deck workflow.
