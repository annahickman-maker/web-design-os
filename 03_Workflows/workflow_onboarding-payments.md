---
type: workflow
slug: onboarding-payments
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Workflow: Onboarding - Payments

Captures the designer's payment setup and saves it to
`01_Core/core_payments.md`. This is the single source of truth the
invoice workflow reads to populate every invoice with the right
currency, payment terms, Stripe dashboard link, and bank transfer
fallback details. Set once, used on every invoice the system
generates.

---

## Trigger

Called automatically as part of the onboarding sequence after the
testimonials step (client mode only). Can also be re-run on demand
with:

- "update my payment details"
- "change my bank details"
- "re-run onboarding payments"

---

## Why this is captured once

Every invoice the system generates needs the same four things:

1. How the client pays (Stripe Payment Link, bank transfer, or both)
2. What the deposit split looks like (50/50, 40/40/20, etc)
3. What currency you bill in
4. Your fallback bank details if the client can't use the card link

None of this changes client-to-client. Capturing it once means the
invoice workflow can skip asking every time and just populate the
HTML template automatically.

Stripe Payment Links themselves are still created per-invoice in the
Stripe dashboard (30 seconds of manual work). In v1.2 when the
Netlify auto-portal infrastructure ships, this swaps to programmatic
creation via the Stripe API and no template changes are needed.

---

## Steps

### Step 1 - Explain what's needed

Tell the user:

> Next I need your payment setup. This is the single file every
> invoice I generate reads from, so I can fill in currency, payment
> terms, and your bank details automatically without asking you
> each time.
>
> I'll ask about four things:
>
> 1. Whether you take card payments via Stripe (recommended)
> 2. Your bank transfer details as a fallback
> 3. Your default payment terms (deposit split, due dates)
> 4. The currency you bill in
>
> If you don't have a Stripe account yet, you can set one up for
> free at stripe.com and come back, or skip card payments entirely
> and only offer bank transfer.

### Step 2 - Currency

> What currency do you bill your clients in?
>
> 1. GBP (pound)
> 2. USD (dollar)
> 3. EUR (euro)
> 4. AUD (Australian dollar)
> 5. CAD (Canadian dollar)
> 6. Something else

Save the three-letter code and the symbol. If "something else", ask
for the ISO code and symbol directly.

### Step 3 - Stripe setup

> Do you take card payments through Stripe?
>
> 1. Yes, I already have a Stripe account
> 2. Not yet, but I want to set one up now
> 3. No, bank transfer only

**If 1:** ask for their Stripe dashboard URL so the invoice workflow
can link straight to it when prompting them to create a Payment
Link per invoice. Default is `https://dashboard.stripe.com/payment-links/create`.

> Paste the link to your Stripe Payment Links page. If you're not
> sure, press enter and I'll use the default Stripe dashboard URL.

**If 2:** tell them:

> Go to stripe.com, create an account (free, takes about 5 minutes),
> verify your email, then come back and say "continue onboarding
> payments". I'll pick up from here.
>
> You don't need to complete Stripe's full business verification
> to start accepting payments - that can happen after your first
> invoice is sent.

Save progress to `00_System/system_onboarding-progress.md` and stop.

**If 3:** skip the Stripe URL question and mark Stripe as disabled.
Bank transfer becomes the primary payment method in the invoice
template.

### Step 4 - Bank transfer details

> What bank transfer details should I put on your invoices as a
> fallback (or as the primary method if you're not using Stripe)?
>
> I need:
>
> 1. Account name (the name on the account)
> 2. Bank name
> 3. Account number (or IBAN)
> 4. Sort code / routing number / BIC / SWIFT
> 5. Any reference or memo instructions for the client
>
> These go directly onto every invoice you generate, so they need
> to be the exact details a client can copy and paste into their
> bank app.

Capture each one. If the designer is in a country where the format
is different (IBAN only, or IBAN + BIC only), just accept whichever
fields they give.

Optional:

> Anything else a client needs to know to send a transfer? For
> example: "use invoice number as reference" or "allow 2-3 working
> days for international transfers".

### Step 5 - Default payment terms

> What's your default payment terms for new projects?
>
> 1. 50% deposit before work begins, 50% on launch
> 2. 40% deposit, 40% mid-project, 20% on launch
> 3. 100% upfront
> 4. Net 7 (full invoice, due 7 days from issue)
> 5. Net 14
> 6. Net 30
> 7. Something else

Save the split. If "something else", ask for a short description
(e.g. "30% deposit, 30% at copy sign-off, 40% on launch").

Then:

> How many days does a client have to pay each invoice once it's
> sent? (default is 7)

Save as an integer.

### Step 6 - Late payment policy

> Do you charge a late fee on overdue invoices?
>
> 1. No
> 2. Yes, flat fee
> 3. Yes, percentage per week

**If 2:** ask for the flat amount.
**If 3:** ask for the percentage and cadence (per week / per month).

This gets referenced in the contract template and noted on invoices
as a footnote.

### Step 7 - Write the core file

Write to `01_Core/core_payments.md`:

```
---
type: core
slug: payments
status: active
tags:
  - type/core
  - domain/payments
---

# Payments

The single source of truth for payment setup. Every invoice the
system generates reads from this file.

## Currency

- **Code:** [ISO code from step 2]
- **Symbol:** [currency symbol]

## Stripe

- **Enabled:** [yes / no]
- **Dashboard URL:** [URL from step 3, or "None"]
- **Usage:** Create a Payment Link per invoice in the Stripe
  dashboard, then paste the URL into the invoice template when the
  workflow prompts for it. In v1.2 this becomes automatic via the
  Stripe API.

## Bank transfer

- **Account name:** [from step 4]
- **Bank name:** [from step 4]
- **Account number / IBAN:** [from step 4]
- **Sort code / routing / BIC / SWIFT:** [from step 4]
- **Reference instructions:** [from step 4, or "Use invoice number as reference"]

## Default payment terms

- **Split:** [from step 5]
- **Due within:** [N] days from invoice issue
- **Late payment policy:** [from step 6, or "None"]

## Usage

Referenced by every invoice workflow and template. Placeholders
that read from this file:

- `[CURRENCY_SYMBOL]` - currency symbol
- `[CURRENCY_CODE]` - ISO currency code
- `[STRIPE_DASHBOARD_URL]` - Stripe Payment Links dashboard
- `[BANK_DETAILS_BLOCK]` - full bank transfer block for invoice
- `[PAYMENT_TERMS]` - default deposit split
- `[PAYMENT_DUE_DAYS]` - days from issue to due date
- `[LATE_PAYMENT_POLICY]` - late fee policy line

Stripe Payment Links are created per-invoice by the designer in the
Stripe dashboard and pasted into `[STRIPE_PAYMENT_LINK]` when the
invoice workflow prompts for it. This is manual in v1.0 and
automatic in v1.2.
```

### Step 8 - Confirm

Show the user:

> Payment setup saved. Here's what I've got:
>
> - **Currency:** [code and symbol]
> - **Stripe:** [enabled / disabled]
> - **Bank transfer:** [account name, bank]
> - **Terms:** [split], [N] days to pay
> - **Late policy:** [policy or "None"]
>
> Every invoice I generate from now on will fill these in
> automatically. If anything changes, just say "update my payment
> details" and I'll walk you through it again.

### Step 9 - Mark complete

Update file status to `active`.

---

## Validation

Before marking complete, verify:

- `01_Core/core_payments.md` exists
- Currency code and symbol are both set
- Either Stripe is enabled OR bank transfer has an account name
  and account number / IBAN (at minimum one payment method must
  work)
- Payment terms split is set
- File has proper frontmatter

If neither payment method is configured, do not mark complete.
Prompt the user:

> I need at least one way for clients to pay you. Either set up
> Stripe or give me your bank transfer details. Which one do you
> want to do now?

---

## When things go wrong

### User doesn't have a Stripe account yet

Walk them through setup:

> Go to stripe.com and click "Start now". You only need an email
> and password to create the account. Full business verification
> can happen later. Once you're in the dashboard, come back and
> say "continue onboarding payments".

Save progress to `00_System/system_onboarding-progress.md`.

### User wants to offer something other than Stripe or bank transfer

Tell them:

> v1.0 supports Stripe Payment Links and bank transfer. If you want
> to use something else (PayPal, Wise, GoCardless, Revolut), paste
> the payment instructions into the bank transfer section for now
> and the client will see them as a fallback option on the invoice.
> Native support for other payment tools can land in a later
> version if there's demand.

### User is in a country with different bank field formats

Accept whatever fields make sense for their country. Don't force
"sort code" if they use BIC. The invoice template handles missing
fields gracefully - it only renders lines that have values.

### Em dashes in any of the details

Replace with hyphens before saving. System-wide rule - no em dashes
anywhere, ever.

---

## STOP

After saving the core file and confirming with the user, stop and
let them continue the onboarding sequence. Do not auto-chain into
other workflows unless the onboarding workflow is calling this
step as part of a larger sequence.
