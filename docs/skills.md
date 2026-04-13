---
type: documentation
slug: skills-docs
status: active
---

# Web Design OS Skills

Web Design OS ships with 9 expert-level skills that auto-load when Claude detects a matching task. These skills raise the quality of everything Claude generates in the vault - from typography to image generation to brand voice.

You don't need to invoke these manually. They activate automatically when relevant. This document explains what each skill does, when it activates, and why it's there.

---

## How skills work

Skills live in `.claude/skills/` inside this vault. Each skill is a folder containing a `SKILL.md` file with instructions Claude follows when the skill is active.

**Progressive disclosure:** When you open Claude Code in this vault, only the skill descriptions (~250 characters each) load into context. Full skill content only loads when Claude detects a matching task. This keeps token costs low while making the skills instantly available when needed.

**Auto-loading:** Claude reads your current task and compares it to the skill descriptions. Matching skills load automatically - you never have to remember to use them.

**Project-scoped:** These skills only apply when Claude Code is opened in this vault. They don't affect your other projects or your global Claude Code setup.

---

## The skill set

### 1. editorial-typography

**What it does:** Teaches Claude to use premium editorial typography patterns when generating HTML/CSS. Covers type scales, font pairing, variable font axes (Fraunces specifically), vertical rhythm, display sizes, italic usage for emphasis, and the exact typography tokens used throughout Web Design OS.

**When it activates:** Whenever Claude is generating HTML, CSS, or designing anything where typography is the dominant element - strategy decks, sales pages, landing pages, about pages.

**Why it exists:** Default AI typography is technically correct but visually flat. This skill elevates it to editorial quality - the kind you'd see in a magazine or premium brand book.

### 2. layout-systems

**What it does:** Provides CSS Grid, Flexbox, and editorial layout patterns. Covers 12-column grids, asymmetric layouts, aspect ratio handling, masonry/bento grids, full-bleed section dividers, vertical rhythm, and negative space as a design element.

**When it activates:** When building any multi-section page, image grid, hero layout, or responsive design.

**Why it exists:** Claude's default layouts tend toward basic flexbox with generic spacing. This skill produces editorial-quality layouts that feel considered and intentional.

### 3. color-theory-practical

**What it does:** Practical colour theory for brand design. Covers colour psychology by industry, WCAG accessibility, HSL palette generation, warm vs cool neutrals, dark mode from light mode, and how to avoid generic startup palettes.

**When it activates:** When creating colour palettes, reviewing colour choices, generating creative direction, or checking accessibility contrast.

**Why it exists:** Bad colour choices make good layouts look cheap. This skill ensures every palette is deliberate, accessible, and brand-appropriate.

### 4. design-critique

**What it does:** A senior designer's critique framework. Teaches Claude to diagnose "this feels off" - evaluate hierarchy, balance, typography, colour, and imagery. Provides specific vocabulary for articulating feedback and a critique hierarchy (what to fix first).

**When it activates:** When reviewing or evaluating designs, giving feedback, diagnosing design issues, or improving existing layouts.

**Why it exists:** When you tell Claude "this doesn't feel right," this skill helps it diagnose the specific problem and suggest concrete fixes rather than guessing.

### 5. brand-voice-writing

**What it does:** Teaches Claude to write in a specific brand voice consistently. Covers extracting voice from samples, maintaining consistency across content types, voice drift prevention in long-form content, and the specific pattern of reading `01_Core/core_voice-style.md` before every generation.

**When it activates:** When generating any written content - website copy, emails, proposals, blog posts, social captions, headlines.

**Why it exists:** Default AI content sounds like generic AI content. This skill makes sure everything generated sounds like a real person with a real voice - specifically, the user's voice.

### 6. website-sections-cheatsheet

**What it does:** A section-by-section guide for designing and writing website copy. Covers every common website section (hero, authority, problem-solving, offers, about, how-it-works, testimonials, portfolios, pricing, FAQs, CTAs, footers) with specific guidance on what each should contain and how to write it.

**When it activates:** When writing any website copy, designing layouts, planning sitemaps, or critiquing web design.

**Why it exists:** This is the baseline reference for what makes a good website. Every page Claude generates should check its structure against this cheatsheet.

### 7. seo-aio-optimisation

**What it does:** Applies SEO and AI Overview Optimisation principles to content as it's generated - not as a separate audit pass. Covers on-page SEO, technical SEO, AI Overview Optimisation, structured data, entity optimisation, and content patterns that AI engines favour.

**When it activates:** When writing any web content - copy, blog posts, meta tags, alt text, sitemaps, headlines.

**Why it exists:** SEO that's added at the end feels forced. SEO that's baked into the writing from the start is invisible and effective. This skill ensures generated content is search-aware by default. A separate workflow (`workflow_seo-aio-pass.md`) still runs comprehensive pre-launch audits for final quality checks.

### 8. ai-image-prompting

**What it does:** Expert-level prompt engineering for AI image generation. Covers cinematic language, photography terminology, composition, lighting, film stock references, style references (magazines, photographers), consistency across batches, and avoiding AI artifacts.

**When it activates:** When generating image prompts for Nano Banana (or any image model) - strategy deck imagery, website hero images, persona portraits, moodboard images.

**Why it exists:** Generic prompts produce generic AI images. This skill teaches Claude to prompt like an art director - specific, cinematic, well-directed. The result is images that look like real premium photography, not obvious AI output.

### 9. nano-banana-integration

**What it does:** Technical reference for calling Google's Gemini 2.5 Flash Image API via curl. Covers authentication, request structure, response parsing, base64 image extraction, error handling, batch generation patterns, cost optimisation, and image editing.

**When it activates:** When Claude is actually making API calls to generate images - during `workflow_generate-visual-direction.md` and `workflow_curate-visuals.md`.

**Why it exists:** Claude needs to know the exact API format, headers, and response structure to successfully generate images. This skill provides that technical detail so the workflows can focus on business logic.

---

## How skills combine

Most tasks activate multiple skills simultaneously. Here are the common combinations:

### Writing homepage copy
- **brand-voice-writing** (sound like the user)
- **website-sections-cheatsheet** (structure each section correctly)
- **seo-aio-optimisation** (SEO-aware from the start)

### Generating the strategy deck HTML
- **editorial-typography** (premium type)
- **layout-systems** (editorial layouts)
- **color-theory-practical** (palette decisions)
- **website-sections-cheatsheet** (structure reference)

### Generating visual direction images
- **ai-image-prompting** (construct the prompts)
- **nano-banana-integration** (make the API calls)

### Reviewing a design
- **design-critique** (diagnosis framework)
- **editorial-typography**, **layout-systems**, **color-theory-practical** (specific area expertise)

### Writing an email to a client
- **brand-voice-writing** (sound like the user)

### Generating a proposal
- **brand-voice-writing** (sound like the user)
- **website-sections-cheatsheet** (if the proposal references website sections)

---

## When to update skills

Skills ship with the product and update via GitHub when you run `update system`. To update or add skills:

1. Edit or create the `SKILL.md` file in `.claude/skills/[skill-name]/`
2. Commit and push to the repo
3. Members run `update system` to pull the latest skills

The update process preserves any skills you've added locally in your user-level `~/.claude/skills/` folder - those don't conflict with the project-level skills shipped here.

---

## Troubleshooting

### A skill isn't activating when I expect

Skills activate based on semantic matching against their description. If a skill you expect isn't loading:

1. Check the skill's description in its `SKILL.md` - does it mention the keywords you used?
2. Try phrasing your request differently to match the description
3. You can explicitly mention the skill ("use the editorial-typography patterns")

### I want to disable a skill temporarily

Add `disable-model-invocation: true` to the skill's frontmatter. This prevents Claude from auto-loading it while still letting you invoke it manually via `/skill-name`.

### I want to see all available skills

Ask Claude "what skills are available?" and it will list them with descriptions.

### Token usage feels high

Skills use progressive disclosure - only descriptions load baseline (~1k tokens for 9 skills). Full content only loads when matched. If you're seeing high token usage, it's probably from frameworks being loaded by workflows, not from skills.

---

## Skill philosophy

The 9 skills in Web Design OS weren't picked randomly. They represent the specific expertise a senior designer brings that junior designers (and default AI) don't: typography discipline, layout systems, colour theory, design critique vocabulary, voice matching, section-by-section copywriting, SEO awareness from the start, cinematic image prompting, and technical API integration.

Every skill exists because without it, the output quality would suffer in a specific, identifiable way. Together, they raise the quality floor of everything Claude generates in this vault.
