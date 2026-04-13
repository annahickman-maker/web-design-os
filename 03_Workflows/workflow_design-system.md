---
type: workflow
slug: design-system
status: active
tags:
  - type/workflow
  - domain/design
---

# Workflow: Design System Setup

Translates the creative direction into actual design system tokens the designer can apply in Framer or their chosen build tool.

---

## Trigger

- "build design system"
- "set up design system for [client]"

---

## Prerequisites

- Creative direction complete
- Brand identity complete

---

## Steps

### Step 1 - Load sources

Read:
1. `04_Clients/[client-slug]/strategy/creative-direction.md`
2. `04_Clients/[client-slug]/strategy/brand-identity.md`
3. `02_Frameworks/framework_creative-direction.md`

### Step 2 - Confirm finalised decisions

The creative direction has suggestions. Before generating the system, confirm the designer has made final decisions on:

- Color palette (which colors chosen)
- Typography (which fonts chosen)
- Any logo or brand assets

If not yet decided, remind them:

> The creative direction has suggestions but these need final decisions before I can build the system. Have you decided on:
>
> 1. Final color palette
> 2. Final typography pairing
> 3. Logo files
>
> Let me know what's locked and I'll work with the rest as placeholders.

### Step 3 - Generate the design system

Output a complete design system with:

#### Colors
```
Primary: [hex]
Secondary 1: [hex]
Secondary 2: [hex]
Neutral Dark: [hex]
Neutral Mid: [hex]
Neutral Light: [hex]
Background: [hex]
Text Primary: [hex]
Text Secondary: [hex]
Link: [hex]
Link Hover: [hex]
Success: [hex]
Warning: [hex]
Error: [hex]
```

Plus dark mode variants if applicable.

#### Typography
```
Display Font: [name]
Body Font: [name]
Optional Accent Font: [name]

Type Scale:
- H1: [size/weight/line-height]
- H2: [size/weight/line-height]
- H3: [size/weight/line-height]
- H4: [size/weight/line-height]
- H5: [size/weight/line-height]
- H6: [size/weight/line-height]
- Body: [size/weight/line-height]
- Body small: [size/weight/line-height]
- Caption: [size/weight/line-height]
```

#### Spacing Scale
```
Space 1: 4px
Space 2: 8px
Space 3: 16px
Space 4: 24px
Space 5: 32px
Space 6: 48px
Space 7: 64px
Space 8: 96px
Space 9: 128px
Space 10: 192px
```

#### Components
Describe baseline styles for:

**Buttons:**
- Primary: [styling]
- Secondary: [styling]
- Outline: [styling]
- Ghost: [styling]

**Navigation:**
- Desktop style
- Mobile style

**Cards:**
- Default card style
- Featured card style

**Form Elements:**
- Input fields
- Textareas
- Selects
- Checkboxes
- Radio buttons

**Sections:**
- Hero section
- Content section
- Feature section
- Testimonial section
- CTA section

### Step 4 - Write output file

Write to `04_Clients/[client-slug]/design/design-system.md`

### Step 5 - Framer import guidance

Tell the user how to apply this in Framer:

> Here's how to import this into Framer:
>
> 1. Go to Assets > Site Styles
> 2. Add each color with its name (primary, secondary, etc)
> 3. Add text styles using the type scale - H1 through H6, Body, Caption
> 4. Add the spacing scale as variables
> 5. Build out the components in the Components section using these tokens
>
> Once the system is set up in Framer, you can apply it consistently across every page.

### Step 6 - Mark complete

---

## STOP
