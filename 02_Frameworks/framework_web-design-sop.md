---
type: framework
slug: web-design-sop-checklist
status: active
tags:
  - type/framework
  - domain/workflow
aliases:
  - Web Design SOP Checklist
  - Complete Web Design Checklist
---

# Complete Web Design SOP Checklist

The full step-by-step process for delivering a web design project, from new lead to offboarding. This is the master reference for building the Web Design OS workflows.

---

# Onboarding

### New lead

Decision: Review intake form - Is this client a good fit?
- NO - send 'not a good fit' email template
- YES - send 'Discovery call invite' email template

Milestone: Discovery Call booked

### Before Call

- Add client to CRM
- Create Discovery Call template
- Add notes from inquiry form
- Add next available project dates
- Add quote or rough budget range (if known)

### Discovery Call

- Follow questions on Discovery Call Script
- Agree budget and start date with client

Decision: Did the sales call go well?
- NO - get off call and send 'not a good fit' email template
- YES - Let client know you'll send over a written proposal

### Within 60 minutes of getting off call

Create a new project and connect to client

Customise client portal:
- Add Name
- Fill in proposal
- Lock proposal
- Create Contract in Dubsado (or other)
- Link contract in Client Portal
- Create invoice in Stripe (or other)
- Link invoice in Client Portal

Film Loom video:
- Excited for project
- Tour of client portal and walkthrough proposal
- What they need to do next to confirm project

Send proposal to client:
- Share client portal with client email address
- Copy link to client portal
- Send 'Client portal' email template

Decision: If you don't hear back from your client
- After 48 hours send 'proposal follow up' email
- After 1 week archive client and project

Milestone: Client signed contract and paid invoice

- Schedule all invoices for project in Stripe
- Create Calendar booking link for strategy meeting (Mon-Wed on first week of project)
  - Automatic questionnaire reminder 1 week before meeting
  - Automatic meeting reminder 1 day before
- Embed Calendar booking page in Client Portal
- Create Google drive folder and add to 'website images' page in client portal
- Update project status in client portal
- Send 'Project confirmed' email template

Decision: If you haven't got questionnaire back from client
- Send 'questionnaire follow up' email on due date
- Send 'project on hold' email if missed deadline by 3+ days

Milestone: Strategy call booked and questionnaire complete

---

# Strategy

### Prep Work

- Take answers from client questionnaire and run AI prompts
- Fill in Brand Story Script
- Add notes to Strategy Deck
- Add notes to Website Copy Templates
- Create Strategy meeting template and add notes

### Strategy Meeting

- Set the context: explain that this is a collaborative process
- Take client through strategy deck - ask for feedback and clarification
- Take client through website copy template

### After strategy meeting

- Write up notes and finalise strategy deck
- Upload strategy deck to client portal
- Update client portal status
- Send 'strategy deck and website content' email
- Schedule reminder email for website content and strategy deck feedback 2 days before deadline

Decision: If not received website content and strategy deck feedback from client
- Send follow up email on due date
- Send 'project on hold' email if missed deadline by 3+ days

Milestone: Strategy Deck Approved
Milestone: Website Copy Template complete and images uploaded

Decision: Is copywriting included in your service?
- If yes go to Copywriting phase
- If no go to Design phase

---

# Copywriting

### SEO research

- Carry out keyword research with answers from SEO section of website copy templates
- Define target keywords for each page

### Content Writing

- Use key messaging from strategy deck to fill out website copy templates
- Run through SEO checklist for every page
- Check website content against sitemap
- Proofread for spelling and grammar errors

### Website Content Feedback

- Send 'website content' email for feedback
- Schedule reminder email 2 days before website content feedback due
- Implement feedback and send back to client for review

Decision: If not received website content feedback from client
- Send follow up email on due date
- Send 'project on hold' email if missed deadline by 3+ days

Milestone: Client approved copy

---

# Design

### Preparing images

- Resize images - 2400x1600px max
- Compress images - tinyjpg.com
- Name using relevant keywords
- Resize and optimise logos
- Create Favicon

### Layout

- Create copy of Web Designer Template and rename to clients website
- Using the approved sitemap create website pages and layout content sections

### Site Styles

Go to Assets / Site Styles and customise:
- Add color palette from strategy deck
- Add inverse colors for dark mode
- Add text styles - H1, H2, H3, H4, H5, H6, Body, Subheading, Testimonial
- Add link styles - Body Link, Menu Link, Light Link

### Customise Global Components

Go to Assets / Components and customise:
- Logo - light and dark variations
- Buttons - Primary, secondary, outline
- Navigation
- Footer
- Social Icons

### Design Homepage

Design each section within their component:
- Copy in content
- Add images
- Adjust design to fit content and brand style
- Add links to buttons
- Check tablet and mobile
- Add image alt text giving accurate description of images
- Go back to homepage and check tablet and phone variations are formatted correctly for each breakpoint

### Homepage Design Feedback

- Record loom video presentation
- Upload to 'homepage design' feedback page in client portal
- Send 'delivering designs' email
- Schedule reminder 2 days before feedback due
- Revisions round 1
- Revisions round 2

Decision: If not received homepage feedback from client
- Send follow up email on due date
- Send 'project on hold' email if missed deadline by 3+ days

Milestone: Homepage design approved

### Website Design

Design the rest of the pages to be consistent with the homepage, for each content section:
- Detach section from main component (if using different content on this page)
- Copy in content and images
- Adjust design to fit content
- Check tablet and mobile
- Add links to buttons

### Page checks

- Check for consistent design between all content sections and pages
- Proofread for spelling and grammar errors
- Test user journey as someone coming onto website for first time
- Check all buttons, links and forms are working

### Website Design Feedback

- Record loom video
- Upload to 'website design' feedback page in client portal
- Send 'delivering designs' email
- Schedule reminder 2 days before feedback due
- Revisions round 1
- Revisions round 2

Decision: If not received website feedback from client
- Send follow up email on due date
- Send 'project on hold' email if missed deadline by 3+ days

Milestone: Website approved

---

# Launch

- Send final invoice to client

Decision: If client has not paid
- Send follow up email on due date
- Send 'project on hold' email if missed deadline by 3+ days

Milestone: Client paid

### Hosting decision

Decision: Are you hosting the site or transferring it to clients account?

Hosting on my account:
- Create monthly maintenance contract
- Send to client
- Client signed contract
- Set up recurring subscription in Stripe

Transferring to client:
- Create remix link
- Client creates Framer account and sets up paid plan
- Get login details
- Use remix link to import into clients account

### Site Settings

- Site title
- Site description
- Page image
- Language
- Favicon

### Page settings

- Meta title
- Meta description
- Page Image

### URL structures

- Short and clean URLs that accurately represent page content
- Use focus keywords
- Use hyphens to separate words

### Compliance

- Privacy Policy
- Terms and Conditions
- Accessibility Statement
- Install cookie banner

### Accessibility

- All images have alt text
- Aria Labels - define aria labels for icon-only buttons

### Technical

- HTML tags
- Check Page speed
- Test website on desktop, tablet and phone
- Test website in different browsers - chrome, safari, firefox
- Check 404 errors - page re-directs used when re-organising pages

### Final checks

- Proofread content on every page
- Check consistent fonts, styles and colors
- Check all links and buttons
- Check contact form, newsletter sign-up

---

# Ready to launch

- Add passcode (if not launching website straight away)
- Publish site
- Connect domain
- Install Google Analytics
- Submit sitemap to Google Console

---

# Offboarding

### Loom video

- Congratulate on new website
- Show how to remove passcode when ready to launch
- Show where to find training videos in client portal
- Explain how post-launch support works

### Schedule emails

- Schedule 'support check-in' email 5 days before support ends
- Schedule 'testimonial request' 4-6 weeks post launch

### When client launches website

- Send 'website launch' email
