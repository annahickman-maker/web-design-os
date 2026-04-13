---
type: framework
slug: strategy-deck-visual-design
status: active
tags:
  - type/framework
  - domain/workflow
aliases:
  - Strategy Deck Visual Design
  - Strategy Deck Design System
---

# Brand Strategy Deck - Visual Design System

A detailed visual specification of the Brand Strategy Deck design, for when Claude needs to regenerate this as an HTML document. This captures the aesthetic so it can be recreated in code.

---

## Format
- Landscape orientation, roughly 1040 x 700 aspect ratio per page
- Print-ready PDF feel
- Premium editorial / brand book aesthetic

---

## Layout Principles

### Grid system
- Strict column grids visible on content pages (2-column, 3-column, or 4-column layouts)
- Thin black hairline dividers between sections and columns
- Generous white space - never cramped
- Content sits within clear borders or gutters

### Page anatomy
- Vertical "CLIENT NAME HERE" text on the far left edge of every page (rotated 90°, small caps, tiny font)
- Thin vertical line running down the left margin separating the client name from content
- No page numbers visible
- No headers/footers on content pages (just the left edge client name)

### Section dividers
- Full-bleed photography
- Serif section title in bottom-left corner (white text on dark image)
- Examples: "Identity", "Audience", "Marketing", "Website", "Creative Direction"

### Content pages
- Large rotated serif title on the left (vertical, running up the page) - e.g. "Brand Mission", "Values", "Tone of voice", "Awareness", "Sitemap", "Journey"
- Content to the right of the vertical title
- Or: horizontal serif title at the top-left for simpler pages

---

## Typography

### Primary serif (headings and titles)
- Elegant, high-contrast serif (similar to Playfair Display, GT Super, or Canela)
- Used for: section titles, page titles, large quotes
- Weight: Regular
- Style: Sometimes italic for emphasis
- Very large sizes for hero moments (60-100px+ equivalent)

### Secondary sans-serif (body copy and labels)
- Clean geometric or neutral sans-serif (similar to Inter, Helvetica Neue, or GT America)
- Used for: body copy, labels, annotations, captions
- Weight: Regular and Bold
- All uppercase for labels (e.g. "WHAT", "HOW", "WHY", "DESIRE", "VILLAIN")
- Sentence case for descriptions and body text

### Type hierarchy
- Hero/section titles: Large serif, display size
- Page titles: Medium serif, rotated or horizontal
- Labels: Small uppercase sans-serif, tight letter-spacing
- Body copy: Regular sans-serif, comfortable line-height (~1.5)
- Captions and annotations: Small sans-serif, often italic

---

## Colour Palette

### Base
- Pure white background (#FFFFFF) for all content pages
- Deep black (#000000) for body text and hairlines
- Warm earthy tones in photography (the example uses outdoor nature shots with orange, olive, sand, and deep blue tones)

### Principle
- No decorative colour. All colour comes from photography.
- Pure black and white typography lets the photography do the heavy lifting
- This makes it easy to customise per client - swap the photos and the deck adapts to any brand

---

## Photography

### Style
- Editorial, cinematic, high-quality
- Natural light, earthy tones
- Movement and motion (the example has runners, blurred action shots)
- Wide landscape compositions and intimate portraits
- People shown in authentic moments, not posed corporate

### Usage
- Full-bleed section dividers
- Grid-based moodboards (4-6 images per page)
- Editorial callouts alongside content (half-page photo, half-page text)
- Portrait crops for personas
- Rarely used as backgrounds for text (typography stays on white)

### Placement rules
- Photography fills entire quadrants or columns cleanly
- Images align to the grid - no floating or overlapping
- When text overlays image, the image is darkened or has natural dark areas (bottom-left for titles)

---

## Component Library

### Text box (used for Brand Story Script, Competitor Analysis, Transformation)
- Thin black border (1px hairline)
- Label at top in small uppercase sans-serif
- Body copy in regular sans-serif
- White background
- Generous internal padding

### Spectrum slider (Tone of Voice)
- Horizontal line
- Left label and right label in small uppercase sans
- Small black square marker positioned along the line
- Multiple stacked for different dimensions

### Quadrant grid (How We Set Ourselves Apart, Awareness)
- 2x2 layout
- Each quadrant: uppercase label, then body copy
- Thin dividers between quadrants
- Sometimes paired with full-bleed image in one quadrant

### Table (Competitor Analysis)
- Hairline borders
- Small uppercase column headers
- Left column: competitor name (vertical text or small)
- Cells: sentence case body copy
- White backgrounds

### Sitemap diagram
- Tree structure with connecting lines
- Boxes for pages/sections
- Annotations beside boxes explaining purpose
- Hierarchy shown through indentation and lines

### Moodboard grid
- Image grid (typically 3-4 columns)
- Consistent gutters
- Mixed image sizes (some images span 2 columns)
- Small sans-serif captions below or beside images: "Highlight key design feature on mood board"

### Struggle → Transformation pairs
- Two boxes side by side
- Connected by a thin line
- Left box labeled "STRUGGLE" with body copy
- Right box labeled "TRANSFORMATION" with body copy
- Stacked vertically (4 pairs per page typically)
- Image fills the right side of the page behind the transformation column

---

## Page-Specific Layouts

### Cover page
- Full-bleed photo background
- Client logo/brand name top right (small, uppercase, light)
- Title bottom left: "[CLIENT NAME]" (small uppercase sans) followed by "Brand Strategy" (large serif)
- White text on darker image area

### Contents page
- Full-bleed image on left 1/3 of page
- "Contents" large serif heading top-right of content area
- Section list below in 2-column grid
- Each section: uppercase label, then short description in sans-serif

### Brand Mission
- Minimal page
- Large vertical "Brand Mission" title on left
- Mission statement centered in the right 2/3 of page
- Thin horizontal hairline dividing the statement from a short explanation below

### Brand Identity (Golden Circle)
- Top half: large aspirational photo with overlay quote in white serif
- Bottom half: 3 columns (WHAT, HOW, WHY) with uppercase labels and sans-serif descriptions

### Values
- Vertical "Values" title on far left
- Center column: photography
- Right column: list of 5 values, each on its own line, large serif
- Bottom right: small explanation in sans-serif

### Tone of Voice
- Vertical "Tone of voice" title on left
- Right side: 7 spectrum sliders stacked vertically
- Each slider: left label, line with dot marker, right label

### Personas
- Page split into quadrants or thirds
- Portrait images (natural lighting, cinematic)
- Persona name in large serif
- 2-3 paragraphs describing the persona
- 1 persona per page typically (so 2 pages for 2 personas)

### Sitemap
- Vertical "Sitemap" title on far left
- Main tree diagram at top: homepage → menu links + CTA
- Below: columns for each page with section breakdowns
- Annotations explain purpose of each element
- Footer section at bottom of page 2

---

## The Overall Aesthetic

If I had to describe it in one phrase: **"Premium brand book meets editorial magazine."**

It feels:
- Considered
- Expensive
- Minimalist but warm (because of the photography)
- Authoritative but approachable
- Timeless rather than trendy

It deliberately avoids:
- Bright colours or gradients
- Rounded corners or playful illustrations
- Heavy drop shadows or 3D effects
- Stock iconography
- Dense information without breathing room
- "Startup deck" tropes (no pitch deck feel)

---

## Implementation in Web Design OS

When Claude generates this as HTML:

### Tech approach
- Single HTML file with embedded CSS (no framework needed)
- System fonts can work initially (Georgia/serif for headings, system-ui for body)
- For production, use web fonts (Google Fonts: Playfair Display + Inter works well)
- Print-ready CSS so the output can be exported as PDF if needed

### Customisation layer
- Designer can swap the photography set per client (point to different image URLs)
- Designer can override the colour palette if a client needs brand colours added
- All content populates from the client data file (JSON or markdown)

### Generation flow
1. Client completes AI interview
2. Claude runs through the brand story and identity prompts
3. Claude generates a JSON data file for the client
4. Claude renders the HTML strategy deck from a template, injecting the data
5. Designer reviews, refines copy with Claude, adjusts any moodboard images
6. Designer hosts the HTML (Netlify/Vercel) or exports to PDF for client delivery

### What stays manual
- Moodboard image curation (designer picks the visual references)
- Website inspiration references (designer picks the example sites)
- Design style mockups (designer creates in Framer and screenshots them in)

Everything else is auto-generated.
