---
type: workflow
slug: onboarding-paths
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Delivery Paths

Second workflow for users in client or both mode. Determines which service delivery paths the designer offers.

---

## Trigger

Only runs if mode is `client` or `both`. Called automatically after `workflow_onboarding-mode.md` completes.

---

## Steps

### Step 1 - Explain the paths

Say:

> Quick context: Web Design OS supports two different ways to deliver projects. You can offer one or both. Most designers offer both.
>
> **Path A: Productized** - Fixed-price packages. The client buys from a sales page or pricing page, goes straight to an AI interview, and you review what they submitted before the strategy meeting. No discovery call, no custom proposal. Best for starter packages or design sprints under $5000.
>
> **Path B: Custom** - Bespoke high-ticket work. Inquiry → discovery call → you send a custom proposal → they sign → AI interview → **you review and have a strategy refinement meeting with them** → then the full strategy gets generated. Best for premium projects $5000+.
>
> The critical difference: for custom work, the strategy refinement meeting happens BEFORE the AI generates the full strategy deck. This is where you add the strategic insight that AI will miss. It's what justifies premium pricing.
>
> Which paths do you want to offer?
>
> 1. **Productized only** - I offer fixed packages, no custom work
> 2. **Custom only** - I only do bespoke high-ticket projects
> 3. **Both** - I offer productized packages and custom work

### Step 2 - Capture answer

Wait for user's answer. Accept 1/2/3 or text descriptions.

### Step 3 - Write paths file

Create `00_System/system_paths.md`:

```
---
type: system
slug: paths
status: active
tags:
  - type/system
  - domain/config
---

# Service Delivery Paths

paths: [productized | custom | both]
set_on: [current date]
```

### Step 4 - Confirm and continue

Say:

> Got it. I've saved that. Now let's move on to the main onboarding so I can learn about you and your business.
>
> I'll ask you 6 sets of questions covering your positioning, audience, story, voice, offer, and call to action. This creates the foundation for everything I generate for you later - so when I write copy or emails or strategy decks, they all sound like you and serve your business.
>
> Let's start with positioning.

### Step 5 - Update progress and chain next workflow

Update `00_System/system_onboarding-progress.md`:

```
completed:
  - mode
  - paths

current: onboarding-positioning
```

Then automatically begin `workflow_onboarding-positioning.md`.

---

## STOP

Do not chain beyond the next workflow. Run one workflow at a time.
