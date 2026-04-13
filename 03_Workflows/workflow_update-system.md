---
type: workflow
slug: update-system
status: active
tags:
  - type/workflow
  - domain/system
---

# Workflow: Update System

Pulls the latest workflows, frameworks, templates, and scripts from GitHub. Personal files are never touched.

---

## Trigger

- "update system"
- "check for updates"
- "update Web Design OS"

---

## Steps

### Step 1 - Explain

> I'm going to check for updates to the system files - workflows, frameworks, templates, and scripts. Your personal files (Core, Clients, Projects, System state) will not be touched.
>
> I'll show you what's changed before anything updates.

### Step 2 - Run the update script

Run:

```bash
bash scripts/update_system.sh
```

### Step 3 - Report the result

If already up to date:
> Your system is up to date. No changes needed.

If updates were applied, parse the output and show what changed:
> Updated. Here's what's new:
>
> **New workflows:**
> - [list]
>
> **Updated workflows:**
> - [list]
>
> **Updated frameworks:**
> - [list]
>
> **New templates:**
> - [list]
>
> A backup of your previous files was saved automatically. Your personal files were not touched.

### Step 4 - Highlight new modules

If the update includes new modules (from the CHANGELOG), highlight them:

> **New feature: [module name]**
>
> [brief description of what it does]
>
> To use it, say: `[trigger phrase]`
>
> Want me to walk you through it now?

If there was an error:
> There was a problem checking for updates. [Explain the error]. This usually means the vault wasn't set up using the git clone method. Let me know if you need help fixing this.

---

## STOP

Do not proceed to any other workflow after this. The update is complete.
