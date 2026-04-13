---
type: workflow
slug: onboarding-offer
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Your Offer

Captures what the user actually sells - their packages, pricing, and the value inside each offer.

---

## Trigger

Called after `workflow_onboarding-voice.md` completes.

---

## Purpose

Fill in `01_Core/core_offer.md` with:
- Their main offer(s)
- What's included in each
- Pricing structure
- Who each offer is for
- The big promise of each offer

---

## Steps

### Step 1 - Explain

> Now let's get clear on what you actually sell. This matters because every sales page, service page, and proposal I generate will pull from this file.
>
> Most people have 1-3 main offers. Let's capture each one.

### Step 2 - Ask about main offer

**Q1:** What's your main offer right now? What do you most want people to buy from you?

### Step 3 - Go deep on that offer

For each offer, ask:

**Q2:** What's the big promise of this offer? In one sentence: what transformation does it provide?

**Q3:** What exactly is included? (List everything - deliverables, meetings, access, bonuses.)

**Q4:** How much does it cost? (Fixed price, price range, payment plans?)

**Q5:** How long does it take?

**Q6:** Who is this specifically for? (Not everyone - who is this perfect for?)

**Q7:** Who is this NOT for? What kind of customer should pass on this one?

**Q8:** What makes this offer different from similar offers from other people?

### Step 4 - Other offers

> Do you have other offers too? Like a lower-priced entry offer, a higher-priced premium tier, or a productized version?

If yes, repeat Step 3 for each additional offer.

If no, note that they have one main offer.

### Step 5 - Write core file

Create `01_Core/core_offer.md`:

```
---
type: core
slug: offer
status: active
tags:
  - type/core
  - domain/strategy
---

# Offers

## Main Offer: [name]

### Big Promise
[one sentence]

### What's Included
- [item 1]
- [item 2]
- ...

### Investment
[price and payment structure]

### Timeline
[duration]

### Perfect For
[specific customer]

### Not For
[customer to pass on]

### Differentiator
[what makes it unique]

---

## Additional Offer: [name]
(if applicable)

[same structure]

---

## Additional Offer: [name]
(if applicable)

[same structure]
```

### Step 6 - Update progress and chain

Update progress. Next: `onboarding-cta`.

> Perfect. Offers saved. One more step - your primary call to action. What do you want people to do when they're ready?

Automatically begin `workflow_onboarding-cta.md`.

---

## STOP

Do not chain beyond the next workflow.
