---
type: workflow
slug: onboarding-cta
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Call to Action

The final onboarding workflow. Captures the user's primary CTA and conversion path.

---

## Trigger

Called after `workflow_onboarding-offer.md` completes.

---

## Purpose

Fill in `01_Core/core_cta.md` with:
- Primary CTA text
- Where it leads
- Secondary CTAs
- Lead magnets (if any)

---

## Steps

### Step 1 - Explain

> Last onboarding step. Your call to action is what you want people to do next - the thing you'll repeat across your website, in emails, and at the end of content. Let's lock it in.

### Step 2 - Ask about primary CTA

**Q1:** What's the main thing you want people to do when they're ready to work with you?
(Examples: "book a free call", "buy my template", "join my email list", "apply to work with me")

**Q2:** Where does that CTA lead? (Calendly link, Stripe checkout, application form, email signup?)

**Q3:** What should the button text actually say? (The shorter and more direct, the better.)

### Step 3 - Ask about lead magnet

**Q4:** Do you have a free lead magnet or freebie? (A download, quiz, mini-course, template, etc.)

If yes:
**Q5:** What is it and what does it help them with?
**Q6:** Where do they access it?

If no, skip.

### Step 4 - Ask about secondary CTAs

**Q7:** Are there any secondary actions people can take besides your main CTA? (Following you on social, reading your blog, watching your videos?)

### Step 5 - Write core file

Create `01_Core/core_cta.md`:

```
---
type: core
slug: cta
status: active
tags:
  - type/core
  - domain/strategy
---

# Call to Action

## Primary CTA

### Button Text
[exact text for buttons]

### Leads To
[link/URL]

### Desired Action
[what you want people to do]

### Use Cases
[where this CTA appears: homepage hero, footer, end of blog posts, etc]

## Lead Magnet (if applicable)

### Name
[name of freebie]

### What It Is
[description]

### Access Link
[URL]

### Who It's For
[target]

## Secondary CTAs

- [social link or secondary action 1]
- [social link or secondary action 2]
- [etc]
```

### Step 6 - Celebrate and show the functions list

Update progress to mark onboarding complete.

Say:

> That's it - onboarding is done. Your foundation is saved and ready to use. Every piece of content I generate from now on will sound like you and serve your business.
>
> Here's what you can do with Web Design OS:
>
> **Strategy Engine**
> - `run AI interview` - interview a client (or yourself) for project brief
> - `generate brand story` - create the brand story script
> - `generate brand identity` - create brand values, mission, golden circle
> - `generate personas` - create customer personas
> - `run competitor analysis` - research and analyse competitors
> - `generate strategy deck` - build the full HTML strategy deck
> - `generate sitemap` - design the website sitemap
>
> **Copy Engine**
> - `write homepage copy`
> - `write about page copy`
> - `write services page copy`
> - `write sales page copy`
> - `write contact page copy`
> - `write ecommerce copy`
> - `run SEO AIO pass` - optimise for search and AI overviews
>
> **Design & Launch**
> - `build design system` - colors, fonts, components
> - `run launch checklist` - pre-launch validation

If client mode, also show:

> **Client Management**
> - `new lead` - add and qualify a new lead
> - `run discovery call` - prepare and process a discovery call
> - `create proposal` - generate a client proposal
> - `create contract` - generate a client contract
> - `kick off project` - start a new client project
> - `strategy meeting` - prepare and run the strategy meeting
> - `strategy refinement meeting` - the custom-path refinement session
> - `present designs` - deliver design feedback
> - `handover` - off-board a completed project
> - `request testimonial` - send the testimonial request
> - `draft client email` - generate an email in your voice

Then:

> **System**
> - `update system` - pull the latest workflows and modules from GitHub
> - `switch mode` - change between self and client mode
>
> What do you want to do next?

### Step 7 - STOP

Wait for user input. Do not auto-chain another workflow. The user is now free to start using the system.

---

## STOP

Onboarding is complete. Wait for user instruction.
