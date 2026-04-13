---
type: workflow
slug: build-website
status: active
tags:
  - type/workflow
  - domain/design
aliases:
  - Build Website
  - Assemble Website
  - Generate Website
---

# Build Website

**Purpose:** Assemble a complete website from strategy outputs, written copy, and creative direction. Supports two output paths: HTML files deployed via GitHub, or Framer via MCP. Reads `01_Core/core_hosting.md` to determine which path.

**Prerequisites (all must exist before running):**
- `01_Core/core_hosting.md` (hosting method configured)
- Client folder with:
  - `brief.md` (completed AI interview)
  - `strategy.md` (generated strategy)
  - `copy.md` (all page copy written)
- Strategy outputs in the client folder:
  - Brand identity (values, mission, golden circle)
  - Creative direction (photography style, colour palette, typography choices)
  - Sitemap (which pages, which sections per page)
  - Customer personas (for tone calibration)

**Mode:** Both self and client mode.

---

## Step 1: Verify prerequisites

Read:
1. `01_Core/core_hosting.md` - get hosting method
2. The client folder (ask which client if not specified)
3. Verify `brief.md`, `strategy.md`, `copy.md` all exist
4. Verify brand identity, creative direction, and sitemap outputs exist in `strategy.md`

If anything is missing, tell the designer exactly what's needed and which workflow generates it. Do not proceed with gaps.

Say:

> "I've got everything I need to build [client name]'s website:
>
> - **Sitemap:** [list pages from sitemap]
> - **Copy:** [list which pages have written copy]
> - **Brand:** [font pairing, colour palette summary]
> - **Creative direction:** [photography style, mood]
> - **Hosting:** [HTML via Netlify/Vercel/GitHub Pages | Framer]
>
> Ready to build?"

Wait for confirmation.

---

## Step 2: Extract the brand tokens

From the client's strategy outputs, extract:

**Typography:**
- Display/heading font (serif or sans, specific family + weights)
- Body font (family + weights)
- If the creative direction doesn't specify exact fonts, recommend a pairing based on the brand mood using the editorial-typography skill

**Colours:**
- Primary brand colour
- Secondary/accent colour (if specified)
- Generate the full token set from these:
  - `--ink`: near-black derived from brand palette (or default #0A0A0A)
  - `--paper`: off-white derived from brand palette (warm or cool based on brand mood)
  - `--surface`: pure white or slight tint
  - `--accent`: the primary brand colour
  - `--ink-soft`, `--ink-mute`, `--ink-faint`: grey scale derived from ink
  - `--rule`: border colour derived from paper
  - `--on-dark`, `--on-dark-soft`, `--on-dark-mute`, `--on-dark-faint`: inverted text colours for dark sections

Use the color-theory-practical skill for palette generation. Verify WCAG AA contrast for all text/background combinations.

**Logo:**
- Logo image URL or file path (from creative direction or brand identity)
- Logo width recommendation

Save extracted tokens to `04_Clients/[client-slug]/brand-tokens.md` for reference.

---

## Step 3: Map sections to pages

Read the sitemap output. For each page, determine which section building blocks are needed and map them to the written copy.

**Standard section building blocks available:**
1. Navigation
2. Hero
3. Authority / social proof
4. Problem ("does this sound familiar")
5. Offer introduction
6. Transformation (before/after)
7. How it works / process
8. What's included
9. Testimonials
10. Case studies
11. About / founder story
12. Offers grid
13. Pricing
14. FAQs
15. Who is this for
16. Final CTA
17. Contact form
18. Newsletter / lead magnet
19. Portfolio / work examples
20. Values
21. Team
22. Footer
23. Social media menu

For each page, list:
- Page name and URL path
- Sections in order (top to bottom)
- Which copy content maps to each section

Present the section map to the designer:

> "Here's how I'll structure each page:
>
> **Homepage (/):**
> 1. Navigation
> 2. Hero - [headline from copy]
> 3. Authority
> 4. Problem - [pain points from copy]
> ...
>
> **About (/about):**
> 1. Navigation
> ...
>
> Does this structure look right? Any sections to add, remove, or reorder?"

Wait for confirmation. Adjust if needed.

---

## Step 4: Fork by hosting method

Read `core_hosting.md` for `hosting_method`.

If `html` -> go to Step 5A
If `framer` -> go to Step 5B

---

## Step 5A: Build HTML site

### 5A.1: Create the project structure

Create the site folder at `04_Clients/[client-slug]/site/`:

```
site/
  index.html
  about.html
  contact.html
  policy.html
  404.html
  [additional pages per sitemap].html
  css/
    tokens.css
    sections.css
    responsive.css
  js/
    main.js
  assets/
    images/
```

### 5A.2: Generate tokens.css

Write `css/tokens.css` with the client's brand tokens:

```css
:root {
    /* Typography */
    --serif: '[Client serif font]', Georgia, serif;
    --sans: '[Client sans font]', -apple-system, sans-serif;

    /* Colours */
    --ink: [extracted ink];
    --ink-soft: [derived];
    --ink-mute: [derived];
    --ink-faint: [derived];
    --paper: [extracted paper];
    --surface: [derived];
    --accent: [primary brand colour];
    --rule: [derived border colour];

    /* On Dark - for text on --ink backgrounds */
    --on-dark: [derived];
    --on-dark-soft: [derived];
    --on-dark-mute: [derived];
    --on-dark-faint: [derived];

    /* Type Scale - Perfect Fourth */
    --text-xs: 11px;
    --text-sm: 13px;
    --text-base: 15px;
    --text-md: 17px;
    --text-lg: 22px;
    --text-xl: 28px;
    --text-2xl: 40px;
    --text-3xl: 56px;
    --text-4xl: 80px;
    --text-5xl: 120px;

    /* Spacing Scale */
    --space-1: 4px;
    --space-2: 8px;
    --space-3: 16px;
    --space-4: 24px;
    --space-5: 32px;
    --space-6: 48px;
    --space-7: 64px;
    --space-8: 96px;
    --space-9: 128px;
    --space-10: 192px;

    /* Layout */
    --max-w: 1200px;
    --side-pad: clamp(20px, 5vw, 80px);
    --section-pad: clamp(80px, 10vw, 128px);
}
```

### 5A.3: Generate sections.css

Write `css/sections.css` with all the section styles used by this site. Only include styles for sections that appear in the sitemap - don't ship unused CSS.

Use the editorial-typography and layout-systems skills for every style decision. Follow the patterns from the framer-design skill (same spacing scale, same type hierarchy, same editorial patterns) adapted to pure CSS.

### 5A.4: Generate responsive.css

Write `css/responsive.css` with tablet (max-width: 810px) and mobile (max-width: 480px) breakpoints. Key responsive adjustments:
- Navigation collapses to hamburger on mobile
- Two-column layouts stack to single column
- Display text sizes reduce (use clamp or media queries)
- Grid columns reduce (3-col -> 2-col -> 1-col)
- Section padding reduces
- Image aspect ratios may shift

### 5A.5: Generate main.js

Write `js/main.js` with minimal JavaScript:
- Mobile navigation toggle
- FAQ accordion (open/close)
- Smooth scroll for anchor links
- Optional: scroll-triggered section reveals (subtle fade-in)

No frameworks. No build tools. Vanilla JS only.

### 5A.6: Generate each HTML page

For each page in the sitemap, generate the HTML file:

1. Standard `<head>` with meta tags, Open Graph, favicon link, CSS includes, Google Fonts link
2. Navigation (consistent across all pages, highlight current page)
3. Sections in order per the section map from Step 3
4. Footer (consistent across all pages)
5. JS include at bottom

**Copy mapping:** For each section, pull the matching content from `copy.md`. Map directly:
- Hero section -> hero copy (headline, subheadline, CTA)
- Problem section -> problem copy (pain points)
- Offers section -> offers copy (offer names, descriptions, CTAs)
- About section -> about copy (story, qualifications)
- etc.

**Image slots:** Use placeholder elements with descriptive alt text and a subtle background. The designer or client adds real images later. Format:
```html
<div class="img-placeholder" data-slot="hero-image" style="aspect-ratio: 16/7;">
  <span>Hero image - landscape, [creative direction mood]</span>
</div>
```

**SEO:** Set page title, meta description, and OG tags for each page based on the copy content and the seo-aio-optimisation skill.

### 5A.7: Validate

After generating all files:
- Check all internal links point to correct pages
- Check all CSS class references exist in sections.css
- Check all image slot data attributes are descriptive
- Run the design-critique skill checklist mentally: hierarchy, spacing, typography, colour
- Verify no em dashes anywhere

Present to the designer:

> "The site is built. Here's what I generated:
>
> **Pages:** [list each page and section count]
> **Files:** [total file count]
> **Brand:** [font pairing] + [colour palette summary]
>
> The files are at `04_Clients/[client-slug]/site/`. You can preview by opening `index.html` in a browser.
>
> Ready to deploy, or do you want to review first?"

Wait for response. If they want to review, wait for feedback and adjust. If ready to deploy, proceed to Step 6.

---

## Step 5B: Build in Framer

### 5B.1: Connect to Framer

Tell the designer:

> "I need to connect to the Framer project for this client. Either:
> 1. Create a new blank Framer project and connect the MCP connector to it
> 2. Or tell me which existing project to use
>
> Let me know when the connector is ready."

Wait for confirmation.

### 5B.2: Set up the design system

Using the Framer MCP:

1. Create colour styles from the extracted brand tokens:
   - /Ink, /Ink Soft, /Ink Mute, /Ink Faint
   - /Paper, /Surface, /Rule, /Accent
   - /On Dark, /On Dark Soft, /On Dark Mute, /On Dark Faint

2. Create text styles using the client's font pairing:
   - Display XL, Display LG, Display MD
   - Heading, Heading SM
   - Subheading, Eyebrow
   - Body LG, Body, Body SM, Caption
   - Button, Button Outline, Nav Link, Quote
   - Light variants of all the above for dark sections

3. Search for and confirm the client's fonts are available in Framer's font library.

### 5B.3: Build each page

For each page in the sitemap:

1. Create the page in Framer (createPage with web type and the URL path)
2. Set up the Desktop breakpoint (1440px width, fit-content height, Paper background, vertical stack, gap 0)
3. Insert sections in order using updateXmlForNode
4. Fill all copy from copy.md
5. Set all text styles
6. Clear all auto-white backgrounds (the critical Framer MCP pitfall)
7. Verify dark sections use Light text style variants

Follow ALL patterns from the framer-design skill. Especially:
- Every child frame on a dark section needs `backgroundColor="rgba(0,0,0,0)"`
- Every text node on a dark section needs a Light text style variant
- Use the 1px-gap trick for card grids
- Spacing scale must be consistent
- Page root must have `gap="0px"`

### 5B.4: Validate

After building all pages:
- Check navigation links point to correct pages
- Check dark sections have correct text styles
- Check no auto-white backgrounds remain
- Verify responsive breakpoints (if built)

Present to the designer:

> "The site is built in Framer. Here's what I assembled:
>
> **Pages:** [list each page and section count]
> **Design system:** [font pairing] + [colour count] colour styles + [text style count] text styles
>
> Open the Framer project to preview. Let me know if you want any adjustments."

Wait for response. If they want changes, make them. The Framer path doesn't need a separate deploy step - the designer publishes from Framer when ready.

---

## Step 6: Deploy (HTML path only)

Read `core_hosting.md` for GitHub username and hosting platform.

### 6.1: Create GitHub repository

```bash
# Create the repo
cd 04_Clients/[client-slug]/site
git init
git add .
git commit -m "Initial site build for [client name]"

# Create remote repo (requires GitHub CLI)
gh repo create [github-username]/[client-slug]-site --private --source=. --push
```

If the designer hasn't set up GitHub CLI (`gh`), walk them through:
```bash
# Install
brew install gh

# Authenticate
gh auth login
```

### 6.2: Connect hosting platform

**Netlify:**
```bash
# Install Netlify CLI if needed
npm install -g netlify-cli

# Login (one-time)
netlify login

# Create site and link to repo
netlify init
# Select: Create & configure a new site
# Set publish directory: .
# No build command needed (static site)
```

Or tell the designer:
> "Go to app.netlify.com, click 'Add new site' -> 'Import an existing project', select the GitHub repo I just created, and set the publish directory to `/`. Netlify will auto-deploy on every push."

**Vercel:**
```bash
npm install -g vercel
vercel login
vercel --prod
```

**GitHub Pages:**
> "Go to the repo settings on GitHub, scroll to Pages, set source to 'Deploy from a branch', select 'main' branch and '/ (root)' folder. The site will be live at [username].github.io/[client-slug]-site within a few minutes."

### 6.3: Save deployment details

Write `04_Clients/[client-slug]/site.md`:

```
---
type: client
slug: site
status: active
tags:
  - type/client
  - domain/website
---

# Website Deployment

site_url: [live URL]
repo_url: https://github.com/[username]/[client-slug]-site
hosting_platform: [netlify | vercel | github-pages]
custom_domain: [if configured, otherwise blank]
last_deployed: [today's date]
build_method: html

## Update Instructions

To update this site, say: "update [client name] website - [describe changes]"

Claude will edit the files, commit to GitHub, and the site auto-deploys.
```

### 6.4: Confirm

Say:

> "The site is live at [URL].
>
> - **Repository:** [repo URL]
> - **Hosting:** [platform]
> - **Auto-deploy:** Every push to the main branch goes live automatically
>
> To make changes later, just say 'update [client name] website' and tell me what to change. I'll edit the code and push - the site updates automatically.
>
> Want to set up a custom domain, or is this good for now?"

---

## Step 7: Record in project state

Update `04_Clients/[client-slug]/project-state.md`:
- Advance Pipeline State to `design` if not already there
- Tick the "website built" milestone
- Add next action: "Review website with [client name]" [calls]

---

## STOP

Do not proceed to additional workflows. Wait for the designer.
