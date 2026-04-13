---
type: workflow
slug: onboarding-mode
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Mode Selection

The first workflow every user runs. Determines whether they're using Web Design OS for their own website, for client work, or both.

---

## Trigger

First-ever message in the vault. User has not yet completed onboarding.

---

## Steps

### Step 1 - Welcome

Say exactly this (adapted naturally):

> Welcome to Web Design OS. Before we dive in, I need to know one thing so I can set everything up correctly.
>
> Are you using this to:
>
> 1. **Build your own website or sales page** - you're a solopreneur, coach, creator, or small business owner building something for yourself
>
> 2. **Deliver web design projects for clients** - you're a freelance web designer or agency running projects for other businesses
>
> 3. **Both** - you want to build your own website first, then start taking on clients
>
> Just tell me which one.

### Step 2 - Capture answer

Wait for user's answer. Accept:
- "1", "one", "self", "my own website", "for me", "solo", "creator", etc → self mode
- "2", "two", "client", "clients", "freelance", "agency", etc → client mode
- "3", "three", "both", "first me then clients", etc → both mode

If the answer is ambiguous, ask once for clarification.

### Step 3 - Write mode file

Create `00_System/system_mode.md` with this exact content:

```
---
type: system
slug: mode
status: active
tags:
  - type/system
  - domain/config
---

# Mode

mode: [self | client | both]
set_on: [current date]
```

Replace `[self | client | both]` with the user's selection and `[current date]` with today's date.

### Step 4 - Confirm and set expectations

If **self mode**:
> Got it. Your vault is set up for building your own website.
>
> I'll run you through 6 short onboarding steps to learn about your business, your audience, your story, and your voice. Then you'll be ready to generate your brand strategy and website.
>
> The client management features are hidden since you don't need them. If you ever start taking clients, just say "switch to client mode" and they'll be activated.
>
> Ready to start?

If **client mode**:
> Got it. Your vault is set up for running a web design business.
>
> Before the main onboarding, I need to ask one more thing about how you deliver projects. Then I'll run you through 6 short steps to learn about your business, your audience, your story, and your voice.
>
> Ready to continue?

If **both mode**:
> Got it. Your vault is set up for both your own website and client work.
>
> I'll treat your own website as your first project so you get to experience the full workflow from the client side too.
>
> Before we start the main onboarding, I need to ask one more thing about how you deliver client projects. Then I'll run you through 6 short steps to learn about your business, your audience, your story, and your voice.
>
> Ready to continue?

### Step 5 - Update progress and chain next workflow

Write to `00_System/system_onboarding-progress.md`:

```
---
type: system
slug: onboarding-progress
---

# Onboarding Progress

completed:
  - mode

current: [next workflow]
```

Where `[next workflow]` is:
- `onboarding-paths` if client or both mode
- `onboarding-positioning` if self mode

Then automatically begin the next workflow.

---

## STOP

Do not chain beyond the next workflow. Run one workflow at a time.
