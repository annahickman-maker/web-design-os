---
type: workflow
slug: complete-task
status: active
tags:
  - type/workflow
  - domain/client-management
---

# Workflow: Complete Task

Marks a task as done on the designer's dashboard. Moves the
matching line from `Next Actions` to `Done` in the relevant
client's `project-state.md`, then regenerates the dashboard
so the change is reflected immediately.

This is the primary way the designer clears items off their
attention queue. Without it, the designer would have to edit
`project-state.md` by hand every time they finished a task.

---

## Trigger

- "I finished [task] for [client]"
- "mark [task] done for [client]"
- "done with [task] for [client]"
- "finished the [task] for [client]"
- "complete [task] for [client]"
- "[client] [task] is done"

Also accepts shorter forms when the current context makes
the client obvious:

- "I just finished the proposal" (after working on a proposal
  for a specific client in the same session)
- "done with Lila's revisions"

---

## Prerequisites

- Client folder exists in `04_Clients/`
- `project-state.md` exists with a Next Actions section
- Client mode

---

## Steps

### Step 1 - Identify the client

Parse the request to find the client slug:

- If the message has a clear client name ("Lila Park", "Nina",
  "marcus-brightwell"), match it to a folder in `04_Clients/`
  (case-insensitive, fuzzy match on first + last name or
  business name).
- If the message is ambiguous ("I finished the proposal"),
  check the current conversation context for the most recently
  discussed client. Use that.
- If still unclear, ask:

  > Which client is this for? Here are your active clients:
  >
  > [list of non-archived client names]

Do not guess if there's real ambiguity.

### Step 2 - Load the client's project-state.md

Read `04_Clients/[client-slug]/project-state.md` into memory.
Parse the Next Actions section into a list of action objects:

- `priority`
- `category`
- `text`
- `due_date`
- `raw_line` (the original markdown line)

### Step 3 - Match the task to an action

Take the task text from the user's message (the part after
"finished" / "done with" / "complete") and fuzzy-match it
against the `text` field of each action in the list.

Match by:

1. Exact substring match (case-insensitive)
2. Keyword overlap (e.g. "revisions" matches "Address revision
   round 2 feedback")
3. Category match if the task mentions a category word
   (e.g. "proposal" matches any proposal-category action)

If there's exactly one match, use it.

If there are multiple matches, list them and ask:

> I found more than one matching task for [client name]:
>
> 1. [action 1 text] - [due label]
> 2. [action 2 text] - [due label]
>
> Which one did you finish? (reply with the number, or "both")

If there are zero matches, tell the user and list what's
currently pending:

> I couldn't find a matching task on [client name]'s pending
> list. Here's what's currently open:
>
> 1. [action 1 text]
> 2. [action 2 text]
>
> Which one did you finish? Or do you want me to add a new
> entry to the Done log instead?

### Step 4 - Move the task to Done

Edit `project-state.md`:

1. Remove the matched line from the Next Actions section
2. Prepend a new line to the Done section using this format:

   ```
   - [x] [original action text] | completed: [YYYY-MM-DD]
   ```

   Drop the priority and category labels - they're not
   relevant once the task is done. Keep the text clean so
   the Done log is readable.

3. If the user confirmed "both" or multiple tasks, repeat
   for each.

Preserve all other sections of `project-state.md` exactly as
they were. Do not touch Pipeline State, Milestones, Blockers,
Revision Rounds, or Key Dates unless the user explicitly
asked.

### Step 5 - Confirm

Tell the user:

> Marked "[action text]" as done for [client name]. Added to
> their Done log with today's date.

If this was the last pending action for the client, flag it:

> That was the last pending action for [client name]. Their
> dashboard card will show no pending work next time you
> refresh.

### Step 6 - Offer to regenerate the dashboard

> Want me to refresh your dashboard now? (yes / no)

- **Yes** - run `workflow_dashboard.md` to regenerate
  `04_Clients/dashboard.html` and the affected client's
  `workspace.html` + rendered resource HTML files. The
  designer sees the completed task reflected immediately.
- **No** - skip, the dashboard will catch up next time they
  run "show my dashboard".

If the designer has an auto-regen hook enabled (via
`.claude/settings.json`), the edit to `project-state.md`
triggers a background dashboard refresh automatically and
this step becomes a no-op. Mention that if it applies:

> Your auto-regen hook is active, so the dashboard has
> already been refreshed in the background.

---

## Validation

Before writing the file, verify:

- The matched line is present in Next Actions exactly once
- The Done section exists (create it with a header if not)
- The resulting file still has valid frontmatter
- No em dashes in any of the lines (hard rule)

---

## When things go wrong

### User says "done with everything for [client]"

Move ALL pending Next Actions to Done with today's date.
Confirm first:

> [client] has [N] pending actions. Move all of them to Done?
>
> [list all actions]
>
> (yes / no / pick a subset)

### User marks a task done that was actually on a different client

If you catch a mismatch (e.g. "I finished Lila's proposal" but
Lila is in the revisions state and has no proposal action),
flag it:

> Lila Park doesn't have a pending proposal task. Did you mean
> a different client? Here are your open proposals:
>
> - [client A]: [action]
> - [client B]: [action]

### The action has already been moved to Done

If the matched line is already in the Done section (not Next
Actions), tell the user:

> That task is already marked as done for [client] (completed
> [date]). Nothing to update.

### The client folder doesn't exist

Tell the user:

> I don't have a client folder for "[client name]". Check the
> name, or run `new lead` if this is a brand new client.

### Em dashes appear anywhere in the input

Replace with hyphens before writing. Hard rule - system-wide,
no exceptions.

---

## STOP

After updating `project-state.md` and confirming with the
user, stop. Only regenerate the dashboard if the user says
yes in Step 6 (or the auto-regen hook fires). Do not chain
into other workflows.
