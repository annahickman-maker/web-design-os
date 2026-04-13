---
type: workflow
slug: strategy-refinement-meeting
status: active
tags:
  - type/workflow
  - domain/strategy
---

# Workflow: Strategy Refinement Meeting

The critical human-in-the-loop step for custom-path projects. Prepares the designer for a meeting with the client to uncover strategic nuance AI will miss, then processes the meeting notes into the brief before full strategy generation.

---

## Why this workflow exists

AI processes structured answers from the questionnaire well, but misses:
- Things the client didn't think to mention
- Contradictions in what they said
- Strategic opportunities they haven't considered
- Industry-specific nuance
- The real reason behind stated reasons

The designer's job in this meeting is to ADD strategic insight on top of what AI captured. This is the premium layer that justifies high prices on custom work.

**This workflow is required on the custom path. Never skip it.**

---

## Trigger

User says any of:
- "strategy refinement meeting"
- "prep for refinement meeting"
- "run refinement meeting for [client]"

Only valid on custom-path projects. Runs after `workflow_ai-interview.md` completes.

---

## Steps

### Part A: Prepare for the meeting

### Step 1 - Load the brief

Read `04_Clients/[client-slug]/brief.md`. Ensure the AI interview is complete.

### Step 2 - Analyse the brief for gaps and opportunities

Review the brief and identify:

**Gaps in the answers:**
- Vague responses that need probing
- Questions the client clearly didn't think hard about
- Missing information about their business model, scale, or context
- Unstated assumptions

**Contradictions:**
- Answers that don't line up with each other
- Stated goals that don't match stated audience
- Positioning that conflicts with competitor choices

**Strategic opportunities:**
- Angles the client didn't mention but might be valuable
- Audience segments they could serve better
- Differentiation they haven't claimed yet
- Positioning shifts that could increase value

**Industry-specific considerations:**
- Norms in their industry that affect strategy
- Common pitfalls the designer has seen before
- Trends the client might want to address

### Step 3 - Generate probing questions for the meeting

Create a list of 8-15 questions the designer should ask in the meeting, grouped by purpose:

**To clarify vague answers:**
- "You mentioned [X]. Can you give me a specific example of what that looks like?"

**To probe contradictions:**
- "You said you want to attract [X audience] but your current customers are [Y audience]. Which of these do you actually want to build around?"

**To explore strategic opportunities:**
- "Have you considered [opportunity]? What would change if you went in that direction?"

**To surface the deeper why:**
- "If everything went perfectly, what would your business look like in 2 years? What would you be doing day to day?"

**To find the differentiator:**
- "Imagine your ideal client has a shortlist of 3 designers. What do you want them to think about you that would make them pick you?"

### Step 4 - Create the meeting prep document

Write to `04_Clients/[client-slug]/refinement-meeting-prep.md`:

```
---
type: meeting-prep
slug: refinement-[client-slug]
status: draft
tags:
  - type/meeting-prep
---

# Strategy Refinement Meeting - Prep

## Client
[name]

## Meeting Date
[TBD or scheduled date]

## Brief Summary
[3-4 sentence summary of what the brief says]

## Gaps I've Identified
[bullet list of gaps from Step 2]

## Contradictions I've Noticed
[bullet list of contradictions]

## Strategic Opportunities to Explore
[bullet list of opportunities]

## Industry Context
[relevant considerations]

## Questions to Ask in the Meeting
### Clarifying questions
- [question 1]
- [question 2]

### Probing questions
- [question 1]
- [question 2]

### Strategic questions
- [question 1]
- [question 2]

### Vision questions
- [question 1]
- [question 2]

## Designer's Strategic Hypotheses
(What I think the strategic positioning should be, to be tested in the meeting)

- [hypothesis 1]
- [hypothesis 2]
- [hypothesis 3]
```

### Step 5 - Present the prep to the designer

Show the designer:

> I've prepared the refinement meeting. Here's what I found in the brief:
>
> **[show gaps, contradictions, opportunities]**
>
> And here are the questions I'd recommend asking to pull out the nuance:
>
> **[show questions]**
>
> My strategic hypotheses based on what the brief says:
>
> **[show hypotheses]**
>
> Take this into the meeting with the client. When you come back, tell me how it went and I'll process the notes.

### Part B: Process the meeting afterwards

### Step 6 - Wait for the designer to complete the meeting

The designer runs the meeting with their client and comes back to this workflow saying something like "meeting done, here are the notes" or "processing refinement meeting for [client]".

### Step 7 - Capture the meeting notes

Ask the designer:

> Great - let's process what came out of the meeting. You can either:
>
> 1. Paste the meeting transcript if you recorded it
> 2. Share your notes
> 3. Answer a few questions and I'll reconstruct what happened
>
> Which works for you?

Take whatever format they give you and extract:
- Answers to the probing questions
- New information that came up
- Contradictions that got resolved
- Strategic direction agreed on
- Changes to positioning, audience, or messaging
- Client's reactions and preferences

### Step 8 - Update the brief

Append to `04_Clients/[client-slug]/brief.md`:

```
---

# Strategy Refinement Meeting Notes

## Meeting Date
[date]

## Key Outcomes
[what was decided]

## New Information
[what came up that wasn't in the brief]

## Resolved Questions
[contradictions or vague areas that got clarity]

## Strategic Direction Agreed
[the positioning direction agreed on]

## Designer's Strategic Notes
[the designer's insights and observations]
```

### Step 9 - Confirm next step

> Refinement meeting notes processed and saved to the brief. The strategy is now ready to be auto-generated with the designer's strategic input baked in.
>
> Want me to generate the full strategy deck now? This will run all the strategy workflows in sequence:
>
> 1. Brand story script
> 2. Brand identity
> 3. Customer personas
> 4. Competitor analysis
> 5. Creative direction
> 6. Sitemap
> 7. HTML strategy deck
>
> Or you can run them one at a time if you want to review each.

### Step 10 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** stays at `strategy`
- Tick the milestone: `[x] Strategy refinement meeting`
- Move the "Prep for strategy refinement meeting" action from
  Next Actions to Done with today's date.
- **Next Actions:** append
  ```
  - [ ] high [strategy] Generate strategy deck with refinement notes | due: [today + 2 days]
  ```

---

## STOP

Do not auto-generate the strategy after the refinement meeting unless the user explicitly asks. Give them the choice.
