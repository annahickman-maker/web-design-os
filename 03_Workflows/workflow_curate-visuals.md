---
type: workflow
slug: curate-visuals
status: active
tags:
  - type/workflow
  - domain/design
---

# Workflow: Curate Visual Direction

Review AI-generated images from the Visual Direction Engine, regenerate ones that don't work, swap in client-provided photos, and move approved images to the curated folder for use in the strategy deck and website.

---

## Trigger

User says:
- "curate visuals for [client]"
- "review generated images"
- "curate [client] visual direction"

Also called after `workflow_generate-visual-direction.md` completes if the user wants to refine.

---

## Prerequisites

- Visual direction has been generated (`04_Clients/[client-slug]/assets/generated/` contains images)
- OR client-provided photos are ready to be organized

---

## Steps

### Step 1 - Verify source images exist

Check `04_Clients/[client-slug]/assets/generated/` exists and has images.

If no images:
> There are no generated images for [client]. Run `generate visual direction for [client]` first, or if you have client-provided photos to curate, tell me where they are.

### Step 2 - Load the generation prompts

Read `04_Clients/[client-slug]/assets/generated/prompts.md` so Claude knows what each image was intended to be.

### Step 3 - List images for review

Get the list of generated images. Show the user:

> Here are the generated images for [client name]:
>
> **Section images (6):**
> - cover.png
> - contents.png
> - section-identity.png
> - section-audience.png
> - section-marketing.png
> - section-website.png
> - section-creative.png
>
> **Deck imagery (4):**
> - identity-accent.png
> - values.png
> - persona-1.png
> - persona-2.png
>
> **Moodboard (9):**
> - moodboard-01.png through moodboard-09.png
>
> **References (3):**
> - inspiration-01.png through inspiration-03.png
>
> **Closing (1):**
> - closing.png
>
> **Total: 23 images**
>
> How do you want to curate?
>
> 1. **Review each image one by one** - I'll open each and you tell me keep/regenerate/replace
> 2. **Bulk approve then refine** - move all to curated, then regenerate specific ones as needed
> 3. **Spot check** - you've already looked at them, just tell me which ones need changes
> 4. **Replace all with client photos** - skip AI entirely and use files the client provided

### Step 4 - Execute the chosen curation path

#### Path A: Review one by one

For each image:
1. Tell the user "Let's look at [image name] - this was the cover hero, intended to show [description from prompts.md]"
2. Ask: "Keep it / regenerate with different prompt / replace with custom image?"
3. Process based on answer:

**Keep:** Move the file to `04_Clients/[client-slug]/assets/curated/[filename]`

**Regenerate:** Ask what they want different, construct a new prompt, generate a new image via Nano Banana, save to `generated/`, then ask again.

**Replace:** Ask them to put the replacement file in `04_Clients/[client-slug]/assets/curated/[filename]`. Confirm when done.

#### Path B: Bulk approve then refine

1. Copy all images from `generated/` to `curated/`
2. Ask: "All images moved to curated. Which ones do you want to change?"
3. For each one they name, process as regenerate or replace.

#### Path C: Spot check

1. Ask: "Which images need work? List them and what to change."
2. For each image mentioned, regenerate or replace.
3. For all other images, move to `curated/` automatically.

#### Path D: Client-provided photos

1. Ask the user where the client photos are (folder path or upload)
2. Help them rename/organize the files to match the strategy deck slot convention:
   - `cover.jpg`
   - `persona-1.jpg`
   - `moodboard-01.jpg` through `moodboard-09.jpg`
   - etc.
3. Place in `04_Clients/[client-slug]/assets/curated/`

### Step 5 - Regeneration pattern

When the user wants to regenerate a specific image:

1. Show them the original prompt
2. Ask: "What do you want different? Options:
   - Different subject
   - Different lighting
   - Different mood
   - Different composition
   - Something specific you have in mind"
3. Construct a new prompt incorporating their feedback
4. Reference the `ai-image-prompting` skill for the prompt structure
5. Generate via Nano Banana (using `nano-banana-integration` skill)
6. Save to `generated/` with a version suffix: `cover-v2.png`, `cover-v3.png`
7. Ask: "Does this one work? Keep / try again / back to original?"

Keep iterating until they're happy or they give up on that specific image.

### Step 6 - Handle curated folder

As images get approved, they move to `04_Clients/[client-slug]/assets/curated/`. This folder is the source of truth for the strategy deck.

Naming must match the deck template exactly:
- `cover.jpg` (or `.png`)
- `contents.jpg`
- `section-identity.jpg`
- `section-audience.jpg`
- `section-marketing.jpg`
- `section-website.jpg`
- `section-creative.jpg`
- `identity-accent.jpg`
- `values.jpg`
- `persona-1.jpg`
- `persona-2.jpg`
- `moodboard-01.jpg` through `moodboard-09.jpg`
- `inspiration-01.jpg` through `inspiration-03.jpg`
- `closing.jpg`

If files are generated as PNG, optionally convert to JPG for smaller file size:

```bash
cd "04_Clients/[client-slug]/assets/curated"
for f in *.png; do
    sips -s format jpeg -s formatOptions 85 "$f" --out "${f%.png}.jpg"
    rm "$f"
done
```

### Step 7 - Verify completeness

After curation, check that all required slots are filled:

```bash
cd "04_Clients/[client-slug]/assets/curated"
required_files=(
    "cover.jpg"
    "contents.jpg"
    "section-identity.jpg"
    "section-audience.jpg"
    "section-marketing.jpg"
    "section-website.jpg"
    "section-creative.jpg"
    "persona-1.jpg"
    "persona-2.jpg"
    "moodboard-01.jpg" "moodboard-02.jpg" "moodboard-03.jpg"
    "moodboard-04.jpg" "moodboard-05.jpg" "moodboard-06.jpg"
    "moodboard-07.jpg" "moodboard-08.jpg" "moodboard-09.jpg"
    "closing.jpg"
)

missing=()
for f in "${required_files[@]}"; do
    if [ ! -f "$f" ]; then
        missing+=("$f")
    fi
done
```

If any are missing, tell the user:

> These image slots are still empty:
> - [list]
>
> The strategy deck will show placeholder blocks for these. Want to:
> 1. Generate replacements now
> 2. Leave them as placeholders (acceptable - the deck handles empty states gracefully)
> 3. Pull from elsewhere (stock library, client photos)

### Step 8 - Assembly the strategy deck deliverable folder

Copy the strategy deck HTML template to the client folder alongside the curated assets:

```bash
# Create the deliverable folder
mkdir -p "04_Clients/[client-slug]/deliverables/strategy-deck"

# Copy the HTML template
cp "06_Templates/template_strategy-deck.html" "04_Clients/[client-slug]/deliverables/strategy-deck/index.html"

# Create assets folder linking to curated
ln -s "../../assets/curated" "04_Clients/[client-slug]/deliverables/strategy-deck/assets"
```

(Or copy instead of symlink if preferred.)

### Step 9 - Report completion

> Visual direction curated and ready for [client name].
>
> **Final asset set:**
> - [X] approved images in `assets/curated/`
> - [Y] placeholders (will show elegant empty states in the deck)
>
> **Strategy deck is ready:**
> Open `04_Clients/[client-slug]/deliverables/strategy-deck/index.html` in your browser to preview.
>
> **What's next:**
>
> 1. Review the strategy deck with the curated images in place
> 2. Populate the content placeholders (I'll generate content when you run the strategy workflows)
> 3. Present to client
>
> Anything else for the visual direction?

### Step 10 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:
- "Visual direction curated" - complete
- Next action: "Populate strategy deck content" or "Review deck with client"

---

## STOP

After curation is complete, stop and wait for user direction on the next step.
