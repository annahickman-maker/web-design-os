---
type: workflow
slug: ecommerce-copy
status: active
tags:
  - type/workflow
  - domain/copy
---

# Workflow: eCommerce Copy

Generates copy for eCommerce-specific pages: homepage, product pages, collections, FAQs, checkout emails.

---

## Trigger

- "write ecommerce copy"
- "generate ecommerce copy for [client]"
- "write product page copy"

---

## Prerequisites

- Brief file complete (must be an eCommerce project)
- Brand strategy complete
- Product information available

---

## Steps

### Step 1 - Confirm scope

Ask the user what they need:

> eCommerce projects have several copy needs. Which do you want to generate?
>
> 1. Homepage
> 2. Product page template (single example product)
> 3. Collections page
> 4. FAQs
> 5. Checkout email notifications
> 6. All of the above

### Step 2 - Load sources

Read:
1. Brief file
2. Brand strategy outputs
3. `02_Frameworks/framework_copy-template-ecommerce.md`
4. Product details from the brief
5. `01_Core/core_voice-style.md`

### Step 3 - Generate requested sections

#### Homepage
Follow the eCommerce homepage framework:

- **Benefit-driven headline** (aspirational, about how products improve customers' lives)
- **Authority section** (brands featured in, publications, awards)
- **Featured collection** (hero product or bestseller showcase)
- **Establish trust** (why you exist, unique value, empathy)
- **Additional collections** (secondary products)
- **Testimonials** (real only)
- **Blog feature** (top 3 educational posts)
- **Final CTA**

#### Product Page Template
Using one example product:

- **Product title**
- **Price**
- **Product description** (2-3 sentences, benefits + features)
- **Additional information** by category (material, size, ingredients, instructions)
- **Product options** (size, color, material)
- **Optional sections** to include:
  - Reviews
  - Recommended products
  - Ingredients/material guide
  - FAQs

#### Collections Page
- Benefit-driven headline (1 sentence max)
- Collection descriptions

#### FAQs
Organise into categories:
- **Shipping & Returns**
- **Product FAQs**
- **Brand FAQs**

Generate 4-6 questions per category based on the brief and common eCommerce questions.

#### Checkout Email Notifications
Write personalised versions for:
- Order Confirmation
- Customer Account Confirmation
- Shipping Confirmation
- Delivery Confirmation
- Abandoned Cart Notification

Each should sound like the brand, not generic Shopify default.

### Step 4 - Voice check

eCommerce copy often sounds generic. Lean hard into the brand voice, especially for emails and product descriptions.

### Step 5 - Write output file

Write to `04_Clients/[client-slug]/copy/ecommerce-[section].md` or consolidate into one `ecommerce.md` if generating multiple sections.

### Step 6 - Present and refine

### Step 7 - Mark complete

---

## STOP
