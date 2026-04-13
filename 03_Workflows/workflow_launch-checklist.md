---
type: workflow
slug: launch-checklist
status: active
tags:
  - type/workflow
  - domain/launch
---

# Workflow: Pre-Launch Checklist

Runs the comprehensive pre-launch checklist to ensure the website is ready to go live.

---

## Trigger

- "run launch checklist"
- "pre-launch check for [client]"
- "ready to launch"

---

## Prerequisites

- Website design complete
- Copy finalised
- Client approval received

---

## Steps

### Step 1 - Confirm readiness

> Ready to run the launch checklist. This is a comprehensive pre-launch validation. I'll work through every item with you.
>
> Before we start:
> - Is the client's final approval confirmed?
> - Is the final payment received? (for client projects)
> - Is all content signed off?
>
> If yes to all, let's begin. If any are missing, address those first.

### Step 2 - Run the checklist

Work through each section with the user. Tick off items as they're verified.

#### Site Settings
- [ ] Site title set
- [ ] Site description set
- [ ] Page image (Open Graph) set
- [ ] Language set correctly
- [ ] Favicon uploaded and showing

#### Page Settings (for every page)
- [ ] Meta title set (50-60 chars)
- [ ] Meta description set (150-160 chars)
- [ ] Page image set
- [ ] URL is clean and keyword-rich
- [ ] No draft/placeholder content

#### URL Structure
- [ ] Short and clean URLs
- [ ] Focus keywords used
- [ ] Hyphens between words
- [ ] Lowercase only
- [ ] No special characters or parameters

#### Compliance (Required)
- [ ] Privacy Policy published and linked
- [ ] Terms & Conditions published and linked
- [ ] Accessibility Statement published and linked
- [ ] Cookie banner installed and working

For each missing legal page, offer to generate one:

> The Privacy Policy is missing. Want me to generate a basic one? (Note: this is not legal advice - the client should have it reviewed.)

#### Accessibility
- [ ] All images have descriptive alt text
- [ ] Aria labels on icon-only buttons
- [ ] Color contrast meets WCAG AA
- [ ] Keyboard navigation works
- [ ] Focus states visible

#### Technical
- [ ] HTML tags used correctly (one H1 per page, proper hierarchy)
- [ ] Page speed checked (Lighthouse - should score 90+)
- [ ] Tested on desktop, tablet, and phone
- [ ] Tested in Chrome, Safari, Firefox
- [ ] All 404 errors resolved (page redirects in place)
- [ ] All external links working
- [ ] All internal links working
- [ ] Contact form tested and working
- [ ] Newsletter signup tested and working
- [ ] Analytics installed and firing

#### Final Content Check
- [ ] Proofread content on every page
- [ ] Consistent fonts, styles, colors
- [ ] All CTAs tested
- [ ] No lorem ipsum or placeholder text
- [ ] No em dashes (should be hyphens)
- [ ] Voice is consistent across all pages

### Step 3 - Generate missing legal pages

If Privacy Policy, Terms, or Accessibility Statement are missing, offer to generate basic versions from client details. Note that these are templates, not legal advice.

### Step 4 - Offer automated checks

> Want me to run these automated checks?
>
> 1. **Page speed audit** - I can check Lighthouse scores for every page (requires the staging URL)
> 2. **Broken link check** - I can verify all internal and external links
> 3. **Alt text audit** - I can flag any images missing alt text
>
> Or if you've already tested these, we can skip.

### Step 5 - Final sign-off

Once the checklist is complete:

> Launch checklist complete. Every item has been verified or noted.
>
> **Outstanding items:**
> - [list anything that couldn't be verified]
>
> **Ready to go live?**
>
> When you're ready, here's the launch sequence:
>
> 1. Remove any passcode
> 2. Publish the site
> 3. Connect custom domain (if using one)
> 4. Verify Google Analytics is firing
> 5. Submit sitemap to Google Search Console
> 6. Celebrate

### Step 6 - Update project state

Update `04_Clients/[client-slug]/project-state.md`:

- **Pipeline State:** `launched`
- Tick all Launch section milestones:
  - `[x] Final payment received`
  - `[x] Launch checklist complete`
  - `[x] Site published`
  - `[x] Domain connected`
  - `[x] Analytics installed`
  - `[x] Sitemap submitted`
- Move the "Run launch checklist for [client]" action from
  Next Actions to Done with today's date.
- **Next Actions:** append
  ```
  - [ ] high [admin] Send handover to [client] | due: [today + 1 day]
  ```

### Step 7 - Suggest next workflow

For client mode:
> Ready to move to offboarding? I can generate the handover email and schedule the post-launch sequence.

For self mode:
> Congrats on launching. Want me to draft an announcement post or social share copy?

---

## STOP

Wait for user direction.
