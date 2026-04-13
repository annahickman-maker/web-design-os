---
type: workflow
slug: seo-aio-pass
status: active
tags:
  - type/workflow
  - domain/copy
---

# Workflow: SEO / AIO Optimisation Pass

Runs the SEO + AI Overview Optimisation checklist against all generated copy and outputs optimised versions with meta tags, alt text, and structured content suggestions.

---

## Trigger

- "run SEO AIO pass"
- "optimise copy for [client]"
- "SEO check"

---

## Prerequisites

- Copy generated for at least one page
- Brief file complete (for keyword research)

---

## Steps

### Step 1 - Identify target keywords

Ask the user:

> Do you already have target keywords for this site? Or should I suggest some based on the brief?

If they have keywords, load them.

If not, generate suggestions:
1. Read the brief for what the audience is searching for
2. Identify 5-10 primary keyword phrases
3. Identify location-based variants if local business
4. Identify long-tail variations for each page

Present suggestions and confirm.

### Step 2 - Load sources

Read:
1. All existing copy files in `04_Clients/[client-slug]/copy/`
2. `02_Frameworks/framework_seo-aio.md`
3. Brief file

### Step 3 - Run the checklist on each page

For each copy file, go through the SEO + AIO checklist:

#### On-Page SEO
- Meta title (50-60 characters, uses primary keyword)
- Meta description (150-160 characters, includes CTA)
- H1 uses primary keyword
- H2s use secondary keywords
- Primary keyword in first 100 words
- Content structure is scannable
- Internal links to related pages

#### AIO (AI Overview Optimisation)
- Question-based H2s matching real searches
- Direct answers in first 1-2 sentences under each heading
- Definition-style sentences for key terms
- "What, who, how, why" framing
- Lists and numbered steps (AI favours these heavily)
- Authority signals present
- Entity consistency

#### Images
- Alt text for every image mentioned
- Descriptive file names

### Step 4 - Generate meta data for each page

For each page, create:

```
### [Page name]
Meta Title: [50-60 chars]
Meta Description: [150-160 chars]
URL slug: [keyword-rich slug]
H1: [primary keyword in H1]
Primary keyword: [keyword]
Secondary keywords: [list]
```

### Step 5 - Suggest content improvements

For each page, flag:
- Sections that could be restructured for AIO (e.g. convert paragraphs into lists where appropriate)
- Headings that should become questions
- Places where a definition-style sentence could strengthen authority
- Missing internal links

### Step 6 - Generate alt text

For every image referenced in the copy (even placeholders), generate descriptive alt text:
- What the image shows
- Context relevant to the page
- Primary keyword used naturally (not stuffed)

### Step 7 - Write output file

Write to `04_Clients/[client-slug]/copy/seo-aio-optimisation.md`:

```
---
type: seo-optimisation
slug: seo-[client-slug]
---

# SEO + AIO Optimisation: [client name]

## Target Keywords

### Primary Keywords
[list]

### Long-tail Keywords by Page
- Homepage: [keywords]
- About: [keywords]
- Services: [keywords]
...

## Meta Data by Page

### Homepage
[meta data]

### About
[meta data]

[etc]

## Content Improvements

### Homepage
- [improvement 1]
- [improvement 2]

### About
[same]

## Alt Text for All Images

### Homepage
- Hero image: [alt text]
- About section image: [alt text]
...

### About page
[same]

## Structured Data Recommendations
[Schema markup suggestions for the site type]

## Pre-Publish Checklist
See `framework_seo-aio.md` for the full pre-launch checklist.
```

### Step 8 - Present findings

> SEO + AIO pass complete. Here's what I found and generated:
>
> - [summary of key improvements]
> - [meta data ready for all pages]
> - [alt text for all images]
>
> Want to apply these improvements to the copy files directly, or keep them as a separate reference?

### Step 9 - Mark complete

---

## STOP
