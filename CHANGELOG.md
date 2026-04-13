# Changelog

All updates to Web Design OS. Type `update system` in Claude Code to get the latest.

---

## v1.1.0 - Skills + Visual Direction Engine

Major additions to v1.0.

### New: Skills system
Web Design OS now ships with 9 expert-level skills at `.claude/skills/` that auto-load when Claude detects relevant tasks. Skills use progressive disclosure - only descriptions load baseline, full content loads on match.

**Skills added:**
- `editorial-typography` - Premium typography patterns for HTML/CSS
- `layout-systems` - CSS Grid and editorial layout patterns
- `color-theory-practical` - Practical colour theory for brand systems
- `design-critique` - Senior designer critique framework
- `brand-voice-writing` - Writing in specific brand voice consistently
- `website-sections-cheatsheet` - Section-by-section website guide (converted from framework)
- `seo-aio-optimisation` - SEO and AI Overview optimisation (converted from framework)
- `ai-image-prompting` - Expert prompt engineering for image generation
- `nano-banana-integration` - Gemini 2.5 Flash Image API integration via curl

### New: Visual Direction Engine module
Complete AI image generation workflow for brand photography using Google's Nano Banana (Gemini 2.5 Flash Image).

**Workflows added:**
- `workflow_setup-nano-banana` - One-time setup for Gemini API key (5 min)
- `workflow_generate-visual-direction` - Generates 17+ brand images per client
- `workflow_curate-visuals` - Review, regenerate, and approve generated images

**Requires:** Gemini API key from Google AI Studio (free to create, ~$0.40-$0.80 per client for full generation)

### Rebuilt: HTML strategy deck template
The strategy deck HTML template has been completely rebuilt with:
- Elevated editorial style (not pixel-copy of reference)
- Fraunces + Inter typography
- Image slot convention (`assets/curated/` folder)
- Elegant empty states when images aren't present
- Better layout proportions and hierarchy

### Updated: Distribution system
- `update_system.sh` now pulls from `.claude/skills/` and `docs/` folders
- `docs/skills.md` added with complete skills documentation
- `CLAUDE.md` updated to reference the skills system

### Removed (converted to skills)
- `framework_website-sections.md` → now `website-sections-cheatsheet` skill
- `framework_seo-aio.md` → now `seo-aio-optimisation` skill
- Note: `workflow_seo-aio-pass.md` still exists as a final audit tool

---

## v1.0.0 - Initial Release

The first version of Web Design OS. A complete vault for building your own website or running a web design business.

**Included:**

- Two-mode support (self mode for solopreneurs, client mode for designers, both mode for designers building their own site too)
- Two delivery paths for client mode (productized + custom)
- 8 onboarding workflows (mode, paths, positioning, audience, story, voice, offer, CTA)
- Strategy Engine: AI interview, brand story script, brand identity, customer personas, competitor analysis, creative direction, sitemap, HTML strategy deck
- Copy Engine: homepage, about, services, sales page, contact, eCommerce copy, SEO/AIO optimisation
- Client Management: new lead, discovery call, productized intake, proposal, contract, project kickoff, strategy meeting, strategy refinement meeting, present designs, handover, testimonial request, client email generator
- Design & Launch: design system setup, launch checklist
- Update system via GitHub
