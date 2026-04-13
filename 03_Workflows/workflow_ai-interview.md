---
type: workflow
slug: ai-interview
status: active
tags:
  - type/workflow
  - domain/strategy
---

# Workflow: AI Client Interview

Replaces the static client questionnaire with a dynamic AI-led interview. This captures all the information needed to generate brand strategy and website copy.

---

## Trigger

User says any of:
- "run AI interview"
- "start client interview"
- "interview [client name]"
- "interview myself" (for self-mode users)

Also called automatically by `workflow_project-kickoff.md` when starting a new client project.

---

## Context

Before starting, check:
1. What mode the user is in (`00_System/system_mode.md`)
2. If client mode: which client this is for and which path they're on
3. If self mode: this interview creates the user's own project brief in `05_Projects/my-website/`

---

## Steps

### Step 1 - Set up the brief file

**For client mode:**
Create or update `04_Clients/[client-slug]/brief.md` starting from `04_Clients/_template/brief.md`.

**For self mode:**
Create or update `05_Projects/my-website/brief.md` starting from `05_Projects/_template/brief.md`.

### Step 2 - Explain how this works

If client mode, tell the designer:
> I'm going to interview [client name] to gather everything we need for their brand strategy and website. You can either:
>
> 1. Let me run this now and type their answers as we go (if they're with you or on a call)
> 2. Send them the interview questions I generate so they can answer in their own time
> 3. Wait for v1.1 - the standalone Client Interview Web App where they can do this themselves via a unique link
>
> Which would you like to do?

If self mode, tell the user:
> I'm going to interview you about your business to generate your brand strategy and website content. Answer naturally - I'll pull out the strategic insights afterward.

### Step 3 - Run the interview

Ask the questions one at a time. For each question, the AI should:
- Ask the main question
- Wait for the answer
- If the answer is vague or generic, ask one or two follow-up questions to get specifics
- If the answer contradicts an earlier answer, gently probe
- Move to the next question only when you have useful data

---

## Interview Questions

### Section 1: Your Business

1. Tell me about your business. What do you do, how long have you been doing it, and what's working right now?

2. What's the story behind the business? Why does it exist?

3. What problems are you solving for your customers?

4. What are your biggest goals for the next 12 months? What about 3 years?

5. What do you feel is missing or broken in your current setup that prompted this project?

### Section 2: Your Audience

6. Describe your current customers. Who are they? What are they like?

7. If you could design your IDEAL customer from scratch, who would they be?

8. What problems are your customers facing that bring them to you?

9. What do they actually want at the deepest level?

10. What have they tried before that didn't work?

11. What do they say when they talk about their situation? Can you give me any specific quotes or phrases?

12. Are there any customers you DON'T want? Who's a bad fit?

### Section 3: Your Competitors

13. Name 3 competitors or similar brands in your space. Include their name and website or social if you have them.

14. What do you like or admire about each of them?

15. What do you dislike or think they're missing?

16. What's going to make your ideal customer choose YOU over them?

### Section 4: Your Brand

17. Describe the vibe of your brand in 2-6 adjectives. (e.g. modern, friendly, luxury, edgy)

18. Do you have any colour preferences? Any colours you'd want to avoid?

19. What are 3 brands (any industry) whose visual style you love? What specifically do you like about each?

20. Do you have any existing brand assets - logo, colours, fonts, photography?

21. Can you share 3-5 websites that inspire you and tell me what you like about each?

### Section 5: Your Marketing

22. How are you currently getting customers?

23. How do you plan to market the business going forward?

24. What content do you already create? What platforms do you use?

### Section 6: This Project

25. What's the main goal of this website? What's the #1 thing it needs to accomplish?

26. What features or functionality do you specifically need? (blog, booking system, shop, etc)

27. If you currently have a website, why are you unhappy with it?

28. Is there anything else I haven't asked about that I should know before we start?

---

## Step 4 - Process the interview

Once all questions are answered, write everything into the brief file with clean structure:

```
---
type: brief
slug: [client-slug or my-website]
status: complete
tags:
  - type/brief
---

# Project Brief: [name]

## Business
[summary of business section]

## Audience
[summary of audience section]

## Competitors
[summary of competitor section]

## Brand Preferences
[summary of brand section]

## Marketing
[summary of marketing section]

## This Project
[summary of project section]

## Full Interview Transcript
[all questions and answers]
```

### Step 5 - Check for gaps

Review the brief and flag any:
- Vague or underdeveloped answers
- Contradictions between sections
- Missing critical information
- Opportunities the client didn't mention but might want to explore

Tell the user what you found:

> Interview captured. Here's what stood out:
>
> **Strong areas:**
> - [what's clear]
>
> **Gaps I'd want to explore:**
> - [what needs more work]
>
> **Potential contradictions:**
> - [if any]

### Step 6 - Next step based on path

**If self mode OR productized path:**
> Ready to move forward? I can now:
> 1. Generate the brand story script
> 2. Generate the full brand identity
> 3. Run competitor analysis
> 4. Or generate the entire strategy deck in one go
>
> What would you like to do?

**If custom path:**
> Since this is a custom project, the next step is the strategy refinement meeting with the client. I'll prepare you for that before we auto-generate the full strategy.
>
> Ready to prep for the refinement meeting? Or do you want to review the brief in more detail first?

### Step 7 - Update project state

If client mode, update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** stays at `strategy`
- Tick the milestone: `[x] AI interview complete`
- Move the "Run AI interview with [client]" action from Next
  Actions to Done with today's date.
- **Next Actions:** append
  - **Custom path:**
    ```
    - [ ] high [calls] Prep for strategy refinement meeting | due: [today + 2 days]
    ```
  - **Productized path:**
    ```
    - [ ] high [strategy] Generate strategy deck | due: [today + 2 days]
    ```

---

## STOP

Do not auto-generate the strategy deck after the interview unless the user explicitly asks. On the custom path, the refinement meeting must happen first.
