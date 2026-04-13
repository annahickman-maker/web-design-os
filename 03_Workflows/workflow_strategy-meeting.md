---
type: workflow
slug: strategy-meeting
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Strategy Meeting

Presents the generated strategy to the client in a meeting. Different from the strategy refinement meeting (which happens BEFORE generation on custom path).

---

## Trigger

- "strategy meeting with [client]"
- "present strategy to [client]"
- "prep for strategy meeting"

---

## Prerequisites

- Strategy deck generated
- Client meeting scheduled

---

## Steps

### Part A: Prepare for the meeting

### Step 1 - Load the strategy deck

Read:
1. `04_Clients/[client-slug]/deliverables/strategy-deck.html` (or open it in browser)
2. All strategy output files in `04_Clients/[client-slug]/strategy/`

### Step 2 - Create meeting prep

Generate a meeting structure the designer can follow:

```
# Strategy Meeting - [client name]

## Meeting Setup
- Open the strategy deck HTML file in your browser
- Share your screen
- Have the copy documents ready too

## Flow

### 1. Context setting (2 mins)
"I've put together the complete brand and website strategy. This is a collaborative document - I'd love your feedback as we go through it. If something doesn't feel right, speak up so we can refine it before we move to design."

### 2. Walk through Identity (10 mins)
- Brand Mission
- Golden Circle (What, How, Why)
- Values
- Tone of voice
- Ask: "Does this feel aligned with how you see your brand?"

### 3. Walk through Audience (10 mins)
- Personas
- Brand story script
- Transformation pairs
- Ask: "Do these feel accurate to who you're trying to reach?"

### 4. Walk through Competitor Analysis (5 mins)
- Main competitors
- Our positioning
- How we're different
- Ask: "Is this how you want to position yourself in the market?"

### 5. Walk through Marketing (5 mins)
- Awareness levels
- Customer journey
- Ask: "Does this match how you plan to attract customers?"

### 6. Walk through Website Strategy (5 mins)
- Sitemap
- Page purposes
- Ask: "Is there anything missing or anything you don't need?"

### 7. Walk through Creative Direction (5 mins)
- Mood
- Color palette (preliminary)
- Typography (preliminary)
- Moodboard
- Ask: "Does this visual direction feel right?"

### 8. Wrap up (3 mins)
- Summarise any feedback points
- Agree on revisions (if needed)
- Confirm next step: copywriting/design

## Questions to Listen For
- "Can we..." → note as revision request
- "I'm not sure about..." → note as concern to address
- "I love..." → confirm this in the deliverable
- "What about..." → note as new consideration

## What to capture
- Every revision requested
- Every concern raised
- New information about the client
- Strategic shifts they suggest
```

Save to `04_Clients/[client-slug]/strategy-meeting-prep.md`.

### Part B: After the meeting

### Step 3 - Capture notes

Ask the user:

> How did the strategy meeting go? Paste any notes, transcripts, or just tell me what came up.

### Step 4 - Extract changes

From the notes, identify:
- **Approved sections** (no changes needed)
- **Revision requests** (specific changes to make)
- **New information** (anything that changes the brief)
- **Concerns to address** (things the client wasn't sure about)

### Step 5 - Apply revisions

For each revision request:
1. Identify which strategy output file it affects
2. Update that file with the change
3. Regenerate the affected section of the HTML strategy deck

### Step 6 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** advance to `design` (strategy approved
  means the project moves into the design phase, which
  encompasses copy + design work in the kanban)
- Tick milestones:
  - `[x] Strategy presented`
  - `[x] Strategy approved`
- Move the "Present strategy deck to [client]" action from
  Next Actions to Done with today's date.
- **Next Actions:** append
  ```
  - [ ] high [copy] Write homepage copy | due: [today + 3 days]
  - [ ] normal [copy] Write about page copy | due: [today + 5 days]
  - [ ] normal [copy] Write services page copy | due: [today + 6 days]
  ```

### Step 7 - Next step

> Strategy meeting processed. Revisions applied to:
> - [list affected files]
>
> Next step: copywriting. Ready to start writing the website copy? Say "write copy for [client]" and I'll generate the full site copy.

---

## STOP
