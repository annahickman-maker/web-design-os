---
type: framework
slug: two-paths
status: active
tags:
  - type/framework
  - domain/workflow
---

# Two Delivery Paths

Client mode supports two distinct paths for delivering web design projects. Designers choose which paths they offer during onboarding. Most offer both - productized for lower tiers, custom for premium work.

---

## Path A: Productized

**For:** Fixed-price packages, template-based builds, design sprints, day rates, starter packages

**How it works:**
Client purchases directly from a sales page → immediately taken to AI client interview → AI auto-generates strategy → designer reviews and refines → designer presents strategy to client → design phase → launch.

**What's skipped:**
- Discovery call (client already knows what they want)
- Proposal (price is fixed on the sales page)
- Strategy refinement meeting (package scope is defined)

**Time from purchase to strategy delivery:** 1-3 days (versus 2-3 weeks for custom)

**Best for:**
- Designers with repeatable productized offers
- Lower-to-mid price points (typically under $5000)
- Clients who are clear on what they want
- High volume delivery model

---

## Path B: Custom

**For:** Bespoke high-ticket work, agency-style projects, complex stakeholders

**How it works:**
Client inquires via contact form → discovery call → designer creates proposal → client signs and pays deposit → client does AI interview → designer reviews interview results → **strategy refinement meeting between designer and client** → AI auto-generates full strategy incorporating the meeting notes → designer polishes → presents to client → design phase → launch.

**Critical difference:** The strategy refinement meeting happens BEFORE auto-generation.

### Why the refinement meeting matters

AI processes structured answers well but misses:

- Things the client didn't think to mention
- Contradictions between what they say they want and what they actually want
- Strategic opportunities the client hasn't considered
- Industry-specific nuance
- The real reason behind stated reasons
- Unstated assumptions that would change the approach

The designer's job in the refinement meeting is to add strategic insight on top of what the AI captured. This is the "human in the loop" that justifies premium pricing on custom work. AI-only strategy for a $15k project would feel thin; designer-refined strategy feels premium.

**Best for:**
- Designers charging $5000+ per project
- Clients with complex businesses or unclear needs
- Projects where strategic positioning is a key deliverable
- Low volume, high touch delivery model

---

## Choosing which paths to offer

Most designers offer both:
- **Productized** for their entry-level package or template-based work
- **Custom** for their main high-ticket service

The system adapts based on which path a client is on. When creating a new client, Claude asks which path they came in on (if the designer offers both).

---

## Workflow branching by path

When running project workflows, Claude checks the client's path and adjusts:

| Step | Productized | Custom |
|---|---|---|
| Discovery call | Skipped | Required |
| Proposal | Skipped (pre-purchased) | Required |
| Contract | Standardised package contract | Custom contract |
| AI interview | Required | Required |
| Designer review of interview | Light review | Deep review |
| Strategy refinement meeting | Skipped | Required |
| Auto-generate strategy | Immediately after interview | Only after refinement meeting |
| Strategy presentation meeting | Optional | Required |
| Revisions rounds | 1 round | 2 rounds |
| Post-launch support | 7-14 days | 30 days |

These defaults can be overridden per client if needed.
