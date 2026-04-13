---
type: workflow
slug: generate-visual-direction
status: active
tags:
  - type/workflow
  - domain/design
---

# Workflow: Generate Visual Direction

The Visual Direction Engine - generates a complete set of brand photography for a client project using Nano Banana. Produces images for every slot in the strategy deck plus website hero assets. Driven by the client's brand identity, each client gets a unique visual direction.

---

## Trigger

User says:
- "generate visual direction for [client name]"
- "generate visual direction"
- "create images for [client name]"
- "run visual direction engine"

---

## Prerequisites

- Client exists in `04_Clients/[client-slug]/`
- Brand identity has been generated (`04_Clients/[client-slug]/strategy/brand-identity.md`)
- Creative direction has been set (`04_Clients/[client-slug]/strategy/creative-direction.md`)
- Nano Banana is set up (`workflow_setup-nano-banana.md` has been run)

---

## Pre-check

Before starting, verify:

### 1. Nano Banana is configured
Check `00_System/system_config.md` for `GEMINI_API_KEY`. If not present:

> Nano Banana isn't set up yet. Want me to run the setup workflow first? It takes 5 minutes.

Pause and run `workflow_setup-nano-banana.md` if needed.

### 2. Client strategy is ready
Verify `brand-identity.md` and `creative-direction.md` exist for this client. If not:

> This client doesn't have a complete brand strategy yet. I need at least the brand identity and creative direction before generating visuals. Want me to run those workflows first?

---

## Steps

### Step 1 - Load sources

Read:
1. `04_Clients/[client-slug]/brief.md` (for context)
2. `04_Clients/[client-slug]/strategy/brand-identity.md` (values, tone, mission)
3. `04_Clients/[client-slug]/strategy/creative-direction.md` (mood, colors, aesthetic)
4. `04_Clients/[client-slug]/strategy/customer-personas.md` (for persona portraits)
5. `01_Core/core_voice-style.md` (for designer's aesthetic preferences if they apply)

**Auto-loaded skills during this workflow:**
- `ai-image-prompting` - for prompt construction
- `nano-banana-integration` - for the technical API calls

### Step 2 - Analyse brand aesthetic

From the creative direction and brand identity, extract:

- **Overall mood:** 3-5 adjectives describing the feeling (e.g. "grounded, warm, considered")
- **Colour palette:** primary colours in the brand palette
- **Photography style preferences:** if the brief mentioned specific styles (editorial, lifestyle, documentary, etc.)
- **Target audience feel:** what would resonate with their personas
- **Industry conventions:** what photography styles match the industry

Generate a **unified aesthetic brief** - 3-4 sentences describing the visual direction for all images.

Example:

> **Aesthetic brief for Acme Wellness Retreat:**
> Grounded, natural, unhurried aesthetic. Warm earth tones (terracotta, olive, cream), natural light throughout, outdoor settings when possible. Cinematic editorial style inspired by Kinfolk magazine and Scandinavian slow-living photography. Shot on Kodak Portra 400 aesthetic - warm, soft, film-like grain. Subjects are often hands, textures, or environments rather than faces. Avoid: bright saturated colours, stock photography clichés, clinical lighting.

### Step 3 - Define the image set

The complete strategy deck needs these images. Plan each one:

#### Required images (16-20 per client)

1. **cover.png** - Full-bleed hero for cover page (landscape, negative space top-right for title)
2. **contents.png** - Portrait for contents page
3. **section-identity.png** - Full-bleed section divider
4. **section-audience.png** - Full-bleed section divider
5. **section-marketing.png** - Full-bleed section divider
6. **section-website.png** - Full-bleed section divider
7. **section-creative.png** - Full-bleed section divider
8. **identity-accent.png** - Landscape accent for golden circle page
9. **values.png** - Side image for values page
10. **persona-1.png** - Portrait for persona 1
11. **persona-2.png** - Portrait for persona 2
12. **moodboard-01.png** through **moodboard-09.png** - 9 moodboard images with varying aspect ratios
13. **inspiration-01.png** through **inspiration-03.png** - 3 website inspiration images
14. **closing.png** - Closing page hero (landscape)

### Step 4 - Generate prompts for each image

Using the `ai-image-prompting` skill and the aesthetic brief, generate specific prompts for each image.

**Each prompt should include:**
- Subject (specific, not generic)
- Composition and shot type
- Lighting direction
- Colour palette (matching the brand)
- Film/camera reference (matching the aesthetic)
- Style reference (magazine or photographer)
- Negative space notes if needed for text overlay

**Prompt construction rules:**
1. Every prompt must reinforce the aesthetic brief
2. Vary subjects dramatically to avoid monotony
3. Vary composition (close-up, medium, wide)
4. Keep lighting consistent (same time of day across images)
5. Use the same film reference throughout for cohesion

### Step 5 - Show the plan to the user

Present the generation plan:

> I'm about to generate 17 images for [client name]'s visual direction. Here's what's coming:
>
> **Aesthetic:** [aesthetic brief]
>
> **Image set:**
> 1. Cover hero - [brief description]
> 2. Section dividers (5) - [brief descriptions]
> 3. Persona portraits (2) - [brief descriptions]
> 4. Moodboard (9) - [brief descriptions]
> 5. Inspiration references (3) - [brief descriptions]
> 6. Closing - [brief description]
>
> Estimated cost: ~$0.50-$0.80 via Gemini API
> Estimated time: 3-5 minutes
>
> Want to proceed, adjust the aesthetic first, or adjust specific image concepts?

Wait for confirmation.

### Step 6 - Generate the images

Once confirmed, run the batch generation using the Bash tool. Reference the `nano-banana-integration` skill for the exact curl pattern.

Process:
1. Read API key from `00_System/system_config.md`
2. Create the output directory: `04_Clients/[client-slug]/assets/generated/`
3. Loop through the prompts
4. For each prompt:
   - Make the curl request
   - Parse the response
   - Save the image with the correct filename
   - Report progress to the user ("Generated 3 of 17...")
   - Sleep 1 second between requests for rate limiting
5. Track any failures for retry

Progress format for the user:

> Generating visual direction for [client name]...
> ✓ cover.png (1/17)
> ✓ contents.png (2/17)
> ✓ section-identity.png (3/17)
> ...
> ✗ persona-1.png - retrying...
> ✓ persona-1.png (retry succeeded)
> ...

### Step 7 - Save the prompts

Save all prompts used to `04_Clients/[client-slug]/assets/generated/prompts.md` so they can be reviewed, reused, or regenerated later:

```
# Visual Direction Prompts - [Client Name]

Generated on [date] using Nano Banana (Gemini 2.5 Flash Image).

## Aesthetic Brief
[the brief]

## Prompts

### cover.png
[prompt used]

### contents.png
[prompt used]

...
```

### Step 8 - Report results

Once generation is complete:

> Visual direction generated for [client name].
>
> **Results:**
> - ✓ Successful: [X] images
> - ✗ Failed: [Y] images (will need regeneration or manual review)
>
> **Output:**
> All generated images are at `04_Clients/[client-slug]/assets/generated/`
>
> **Cost:** Approximately $[amount]
>
> **What's next:**
>
> 1. **Review the images** - open the folder and see what was generated
> 2. **Run the curation workflow** - say "curate visuals for [client]" and I'll walk you through reviewing each image, regenerating the ones you don't like, and moving approved ones to the curated folder
> 3. **If you're happy with all of them** - I can move them directly to curated. Just say "all images approved for [client]"
>
> The strategy deck HTML template references images from `assets/curated/`, so images need to be moved there to show up in the deck.

### Step 9 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:
- Add "Visual direction generated" to milestones
- Next action: "Curate generated visuals"

### Step 10 - Log the generation

Append to `04_Clients/[client-slug]/assets/generated/generation-log.md`:

```
## Generation [date] [time]

- Prompts file: prompts.md
- Images generated: [count]
- Images failed: [count]
- Cost estimate: $[amount]
- API key source: 00_System/system_config.md
```

---

## Handling failures

### Partial failures during batch
If some images fail while others succeed, continue the batch. Report failures at the end and offer to retry them.

### Total failure
If all images fail with the same error, stop the batch and diagnose:
- API key issue - send user back to setup
- Rate limit - wait and retry
- Safety filter - rewrite the prompts to avoid triggering filters
- Network issue - retry

### Specific image failures
If 1-3 images fail and the rest succeed, offer to:
1. Regenerate them with the same prompts
2. Regenerate them with different prompts
3. Skip them and have the designer provide replacements

---

## STOP

After successful generation, stop and wait for the user to review. Don't auto-chain to curation unless they explicitly ask.
