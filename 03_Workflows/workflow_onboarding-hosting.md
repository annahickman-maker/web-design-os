---
type: workflow
slug: onboarding-hosting
status: active
tags:
  - type/workflow
  - domain/onboarding
aliases:
  - Hosting Setup
  - Website Hosting Onboarding
---

# Onboarding - Hosting Setup

**Purpose:** Set up how the designer's client websites will be built and hosted. This runs once during onboarding and saves the method to `01_Core/core_hosting.md`.

**Prerequisite:** `core_brand-visual.md` must be active (onboarding step 9 complete).

**Mode:** Both self and client mode. Self mode designers still need to host their own site.

---

## Step 1: Explain the two options

Say:

> "Now let's set up how your websites will be built and hosted. You have two options:
>
> **Option A: HTML sites deployed via GitHub**
> Claude generates your website as clean HTML/CSS/JS files. When it's ready, it gets pushed to GitHub and auto-deploys to a live URL via Netlify, Vercel, or GitHub Pages. You and your client both get access to the live site. Updates happen by telling Claude what to change - it edits the code and redeploys automatically. No website builder subscription needed. Free hosting on most platforms.
>
> **Option B: Framer**
> Claude builds your website directly in Framer using the MCP connector. You get a visual editor for fine-tuning. Framer handles hosting and publishing. You'll need a Framer subscription and the MCP connector set up. Best if you want hands-on visual control after Claude assembles the site.
>
> Which approach do you want to use?"

Wait for response.

---

## Step 2: Capture the choice

If **HTML (Option A):**

Ask: "Which hosting platform do you want to use?"

Explain briefly:
- **Netlify** - most popular, generous free tier, custom domains, automatic SSL, form handling built in. Recommended for most designers.
- **Vercel** - similar to Netlify, slightly more developer-focused. Great performance.
- **GitHub Pages** - simplest setup, free, but fewer features (no forms, no serverless functions). Good for simple portfolio sites.

Wait for response.

Then ask: "Do you have a GitHub account? If not, you'll need to create one at github.com - it's free and takes 2 minutes."

Wait for response.

If they don't have GitHub, tell them:
> "Go to github.com and create a free account. Come back when you're set up and say 'continue hosting setup'."

STOP and save progress if needed.

If they have GitHub, ask: "What's your GitHub username?"

Wait for response.

Then ask: "Do you have a [Netlify/Vercel/GitHub Pages] account? If not, you can sign up free at [platform URL] - use 'Sign up with GitHub' for the easiest setup."

- Netlify: netlify.com
- Vercel: vercel.com
- GitHub Pages: no separate account needed

Wait for response.

If **Framer (Option B):**

Ask: "Do you have a Framer account with a site plan?"

Wait for response.

If yes: "Great. You'll also need the Framer MCP connector set up so Claude can build directly in your Framer projects. Here's how to set it up: [link to Framer MCP setup instructions]. Have you already set this up?"

If no: Tell them they'll need a Framer subscription (starts at $5/month for the free plan, $15/month for the mini plan per site). Direct them to framer.com.

Wait for response.

---

## Step 3: Save to core_hosting.md

Write `01_Core/core_hosting.md`:

```
---
type: core
slug: hosting
status: active
tags:
  - type/core
  - domain/hosting
---

# Hosting Configuration

## Method

hosting_method: [html | framer]

## HTML Hosting (if html method)

github_username: [username]
hosting_platform: [netlify | vercel | github-pages]
hosting_account_ready: [true | false]

## Framer Hosting (if framer method)

framer_account_ready: [true | false]
framer_mcp_connected: [true | false]

## Notes

[Any additional context from the setup conversation]
```

---

## Step 4: Confirm

Say:

> "Hosting is set up. Here's what I saved:
>
> - **Method:** [HTML / Framer]
> - **Platform:** [Netlify / Vercel / GitHub Pages / Framer]
> - **GitHub:** [username] (if HTML)
> - **Status:** Ready to build
>
> When you're ready to build a website for a client (or yourself), I'll read this config and handle everything - from assembling the site to deploying it live."

---

## STOP

Do not proceed to the next onboarding step automatically. Wait for the user to continue.
