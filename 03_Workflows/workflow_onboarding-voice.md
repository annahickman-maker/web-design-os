---
type: workflow
slug: onboarding-voice
status: active
tags:
  - type/workflow
  - domain/onboarding
---

# Onboarding: Voice and Style

Captures how the user naturally speaks and writes. This file is read EVERY TIME Claude generates content, so it must be accurate and detailed.

---

## Trigger

Called after `workflow_onboarding-story.md` completes.

---

## Purpose

Fill in `01_Core/core_voice-style.md` with:
- Tone positions on the 7 spectrums
- Specific phrases they use
- Words and phrases they avoid
- Their rhythm and sentence style
- Examples of their voice in action

---

## Steps

### Step 1 - Explain

> This is the most important file for making sure everything I generate sounds like you. Read it, fill it in carefully, and I'll use it on every single piece of content I create for you from now on.
>
> Let's start with the tone spectrums.

### Step 2 - Tone of voice spectrums

For each spectrum, ask where they sit. Accept a 1-10 scale or a position description.

> On each of these, where do you sit? You can give me a 1-10 (1 = far left, 10 = far right) or just describe it.
>
> 1. **Formal ↔ Friendly**
> 2. **Mainstream ↔ Edgy**
> 3. **Serious ↔ Playful**
> 4. **Realistic ↔ Idealistic**
> 5. **Exclusive ↔ Accessible**
> 6. **Careful ↔ Spontaneous**
> 7. **Traditional ↔ Progressive**

Capture their position on each.

### Step 3 - Signature language

> Now tell me about your signature language:
>
> **Q1:** What are 3-5 specific phrases, sayings, or words you use often in your content or with clients? These are phrases that are recognisably YOU.
>
> **Q2:** What words or phrases do you deliberately AVOID? What makes you cringe when other people in your industry use it?
>
> **Q3:** Do you write in short punchy sentences, long flowing ones, or a mix?
>
> **Q4:** Do you swear in your content? Casually or never?
>
> **Q5:** Do you use em dashes, exclamation marks, or emojis? (Note: Web Design OS never uses em dashes - we use - instead. So this is about the other things.)

### Step 4 - Voice samples

> Last thing - the most important. Do you have 2-3 short samples of your writing that you feel most represent your voice? These could be:
>
> - A recent email you sent to a client
> - An Instagram caption or LinkedIn post
> - A few sentences from your current website
> - A YouTube script excerpt
> - A message you sent to a friend about your work
>
> Paste them here. These become my calibration reference.

If they don't have samples ready, skip this step and note it in the file.

### Step 5 - Analyse and summarise

Review everything they shared and identify:
- Sentence rhythm patterns
- Word choice tendencies
- How they open thoughts
- How they transition
- How they close
- Their use of contractions, hedges, directness
- Their relationship with the reader (teacher, friend, peer)

### Step 6 - Write core file

Create `01_Core/core_voice-style.md`:

```
---
type: core
slug: voice-style
status: active
tags:
  - type/core
  - domain/voice
---

# Voice and Style Guide

## Tone of Voice Positions

- Formal ↔ Friendly: [position]
- Mainstream ↔ Edgy: [position]
- Serious ↔ Playful: [position]
- Realistic ↔ Idealistic: [position]
- Exclusive ↔ Accessible: [position]
- Careful ↔ Spontaneous: [position]
- Traditional ↔ Progressive: [position]

## Signature Phrases
- [phrase 1]
- [phrase 2]
- [phrase 3]
- [phrase 4]
- [phrase 5]

## Words and Phrases to Avoid
- [avoided word/phrase 1]
- [avoided word/phrase 2]
- [avoided word/phrase 3]

## Sentence Style
[short/long/mix + any specific patterns]

## Formatting Preferences
- Swearing: [yes/no/casually]
- Exclamation marks: [yes/no/rarely]
- Emojis: [yes/no/where]
- Em dashes: NEVER (system rule)

## Voice Samples

### Sample 1
[paste sample]

### Sample 2
[paste sample]

### Sample 3
[paste sample]

## Voice Analysis

### Patterns observed
- [specific patterns]

### Rhythm
[sentence rhythm description]

### Opening style
[how they start things]

### Relationship with reader
[teacher/friend/peer/etc]

### Distinctive characteristics
[anything else notable]
```

### Step 7 - Update progress and chain

Update progress. Next: `onboarding-offer`.

> Voice saved. From now on, every single thing I generate for you will be run through this file first. Next: your offer. What do you actually sell?

Automatically begin `workflow_onboarding-offer.md`.

---

## STOP

Do not chain beyond the next workflow.
