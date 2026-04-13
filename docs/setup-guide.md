# Setting up Web Design OS

This is your complete setup guide. Follow the steps in order - it takes about 10 minutes.

By the end, you'll have your own AI-powered web design studio running on your computer, ready to onboard your first client.

---

## What you need before you start

- A computer (Mac or Windows)
- An internet connection
- A Claude Pro or Team subscription ($20/month at claude.ai)

That's it. No coding experience needed.

---

## Step 1 - Install Claude Code

Claude Code is the app that runs Web Design OS. Think of it as a terminal that talks to Claude - but instead of chatting, it reads your files, runs your workflows, and builds things for you.

**On Mac:**

Open Terminal (search "Terminal" in Spotlight) and paste this:

```
brew install claude-code
```

If you don't have Homebrew installed yet, paste this first:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then run the brew install command above.

**On Windows:**

Open PowerShell (search "PowerShell" in Start menu) and paste this:

```
npm install -g @anthropic-ai/claude-code
```

You'll need Node.js installed first. If you don't have it, download it from nodejs.org - get the LTS version. Install it, restart PowerShell, then run the npm command above.

**Alternative - Desktop app:**

You can also download the Claude Code desktop app directly from claude.ai/code. This gives you the same thing with a friendlier interface. Works on both Mac and Windows.

---

## Step 2 - Clone the vault

This downloads Web Design OS to your computer.

Open Terminal (Mac) or PowerShell (Windows) and paste this:

```
cd ~/Desktop
git clone https://github.com/annahickman-maker/web-design-os.git "Web Design OS"
```

This creates a folder called "Web Design OS" on your Desktop.

**Don't have git?**

- **Mac:** It will prompt you to install Xcode Command Line Tools. Click Install and wait.
- **Windows:** Download git from git-scm.com. Install it with default settings, restart PowerShell, then run the clone command.

---

## Step 3 - Open the vault in Claude Code

**From Terminal/PowerShell:**

```
cd ~/Desktop/"Web Design OS"
claude
```

This opens Claude Code inside your vault. Claude will read the system files and know exactly what to do.

**From the Desktop app:**

Open Claude Code, then click "Open Folder" and select the Web Design OS folder on your Desktop.

---

## Step 4 - Start onboarding

The very first time you open the vault, Claude will automatically start your onboarding. You don't need to type anything specific - just say hello.

Onboarding walks you through 12 short steps:

1. **Mode** - Are you using this for yourself, for clients, or both?
2. **Paths** - Do you offer productized packages, custom projects, or both? (client mode only)
3. **Positioning** - Who are you and what do you do?
4. **Audience** - Who do you help and what are they struggling with?
5. **Story** - What's your background and how did you get here?
6. **Voice** - How do you talk and write?
7. **Offer** - What do you sell and at what price?
8. **CTA** - What's the one action you want people to take?
9. **Brand visuals** - Your fonts, colors, and logo
10. **Booking link** - Your Calendly/Cal.com link
11. **Testimonials** - Your client testimonials bank
12. **Payments** - Your currency, Stripe setup, and payment terms

Each step is a conversation. Claude asks you questions, you answer in your own words, and it saves everything into your personal vault files. These files power everything else in the system.

**You can take breaks.** If you need to stop, just tell Claude "I need to take a break" and it will save your progress. When you come back, say "continue onboarding" and it picks up exactly where you left off.

---

## Step 5 - You're in

Once onboarding is done, Claude shows you everything you can do. Here are the big ones:

**Strategy Engine** - Generate a complete brand strategy deck from a client interview. Brand story, identity, personas, competitor analysis, creative direction, sitemap - all assembled into a polished HTML deck in your brand.

**Copy Engine** - Write every page of website copy (homepage, about, services, sales, contact, ecommerce) in your client's brand voice, optimised for SEO and AI search.

**Website Builder** - Assemble a complete website from strategy + copy + creative direction. Outputs to Framer or HTML.

**Client Management** - Dashboard, proposals, contracts, invoices, client portals, email templates - all in your brand, all generated from your data.

**Visual Direction Engine** - AI-generate brand images for strategy decks and websites using Gemini.

To use any of these, just tell Claude what you want. For example:

- "generate strategy deck for [client name]"
- "write homepage copy"
- "create proposal for [client name]"
- "show my dashboard"

---

## Keeping the system updated

When new workflows, frameworks, or templates are added, you can update with one command. Just tell Claude:

**"update system"**

This pulls the latest files from GitHub. Your personal files (positioning, audience, clients, projects) are never touched - only system files get updated.

---

## Quick troubleshooting

**"Claude doesn't seem to know what Web Design OS is"**
Make sure you opened Claude Code inside the Web Design OS folder. Claude reads the folder's CLAUDE.md file to understand the system. If you opened it from a different folder, close it and reopen from the right location.

**"I got an error about git"**
Make sure git is installed (see Step 2). If you cloned correctly, the folder should have a hidden .git directory inside it.

**"Claude is asking me to do things I already did"**
Your progress is saved in files inside the vault. If those files exist, Claude should pick up where you left off. Try saying "continue onboarding" or "where did we leave off?"

**"I want to start over"**
Delete the folder, clone again from GitHub, and reopen in Claude Code. This gives you a fresh vault.

---

## What's in the vault

You don't need to understand the folder structure to use the system - Claude handles everything. But if you're curious:

- **01_Core/** - Your personal files (positioning, audience, voice, etc). Created during onboarding.
- **02_Frameworks/** - The methodologies behind every workflow. You never edit these directly.
- **03_Workflows/** - The step-by-step processes Claude follows. These are the engine.
- **04_Clients/** - One folder per client with all their project data.
- **05_Projects/** - For self-mode personal projects.
- **06_Templates/** - HTML templates for strategy decks, portals, proposals, contracts, invoices, dashboards, and email templates.

The only folders you'll ever interact with directly are your client folders (to check on files) and deliverables (to open HTML files in a browser). Everything else is managed by Claude.
