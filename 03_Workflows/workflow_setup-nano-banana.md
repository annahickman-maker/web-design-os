---
type: workflow
slug: setup-nano-banana
status: active
tags:
  - type/workflow
  - domain/setup
---

# Workflow: Set Up Nano Banana Image Generation

One-time setup for the Nano Banana (Gemini 2.5 Flash Image) integration. Walks the user through getting a Gemini API key, saving it to their config, and testing that image generation works.

---

## Trigger

User says any of:
- "setup nano banana"
- "set up image generation"
- "configure gemini api"
- "enable image generation"

Also called automatically by `workflow_generate-visual-direction.md` if the user tries to use it before setup is complete.

---

## Prerequisites

- User is past onboarding
- User has a Google account (for Gemini API key)

---

## Steps

### Step 1 - Explain what this is

Say:

> Nano Banana is Google's Gemini 2.5 Flash Image model. It's the best AI image generator for premium brand photography - used for moodboards, strategy deck imagery, website hero images, and persona portraits.
>
> Setting it up takes about 5 minutes. You'll need:
>
> 1. A Google account
> 2. A free Gemini API key (free to create, you pay pennies per image as you use it)
>
> Cost: roughly $0.02-0.04 per image generated. A typical client visual direction generation uses 15-20 images, so around $0.40-$0.80 per client total. Significantly cheaper than stock photo subscriptions.
>
> Ready to set this up?

Wait for confirmation.

### Step 2 - Get the API key

Say:

> Here's how to get your API key:
>
> 1. Open https://aistudio.google.com/app/apikey in your browser
> 2. Sign in with your Google account
> 3. Click "Create API key"
> 4. Choose "Create API key in new project" (or pick an existing project if you have one)
> 5. Copy the API key that appears
>
> Once you have the key, paste it here. I'll save it securely - it won't be committed to GitHub.

Wait for them to paste the key.

### Step 3 - Validate the key format

When the user pastes a key, verify it:
- Should start with `AIza`
- Should be roughly 35-40 characters long
- No spaces

If it doesn't look right:
> That doesn't look like a valid Gemini API key. Gemini keys start with "AIza" and are about 35 characters long. Can you double-check and paste it again?

### Step 4 - Save to config file

Check if `00_System/system_config.md` exists. If not, create it.

Read the existing file (if it exists) and add or update the `GEMINI_API_KEY` line.

File format:

```
---
type: system
slug: config
status: active
tags:
  - type/system
  - domain/config
---

# System Config

## API Keys
GEMINI_API_KEY: [the key they pasted]

## Other Config
(add other settings here as needed)

---

**Security note:** This file is gitignored and will not be committed to GitHub. Your API keys stay on your local machine only.
```

Verify `00_System/system_config.md` is in the `.gitignore`. If not, add it.

### Step 5 - Test the integration

Tell the user:

> Saved. Now let's test that it works by generating a small sample image.

Run a test curl request using the Bash tool:

```bash
# Read the key from the config
API_KEY=$(grep "GEMINI_API_KEY:" "00_System/system_config.md" | sed 's/GEMINI_API_KEY: //')

# Make a test request
RESPONSE=$(curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent?key=$API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "contents": [{
      "parts": [{
        "text": "A single red apple on a white marble surface, soft natural light from the left, minimal editorial photography, shot on Kodak Portra 400"
      }]
    }]
  }')

# Try to extract and save the image
mkdir -p "00_System/test"
echo "$RESPONSE" | python3 -c "
import json, base64, sys
try:
    data = json.load(sys.stdin)
    if 'error' in data:
        print('API_ERROR: ' + data['error'].get('message', 'Unknown error'))
    elif 'candidates' in data and data['candidates'][0].get('content', {}).get('parts'):
        for part in data['candidates'][0]['content']['parts']:
            if 'inlineData' in part:
                with open('00_System/test/test-output.png', 'wb') as f:
                    f.write(base64.b64decode(part['inlineData']['data']))
                print('SUCCESS')
                sys.exit(0)
        print('NO_IMAGE_IN_RESPONSE')
    else:
        print('UNEXPECTED_RESPONSE')
        print(json.dumps(data)[:500])
except Exception as e:
    print(f'PARSE_ERROR: {e}')
"
```

### Step 6 - Report results

**If the test succeeded:**

> Nano Banana is set up and working. Here's what just happened:
>
> 1. Your API key is saved to `00_System/system_config.md` (gitignored)
> 2. I generated a test image at `00_System/test/test-output.png` - open it to see the result
> 3. Every image generation workflow can now use this integration
>
> You're ready to start generating visual direction for clients.
>
> **What you can do now:**
> - `generate visual direction for [client name]` - generates a full set of brand photography for a client project
> - `regenerate [image name]` - regenerate a specific image that didn't work
> - `curate visuals for [client name]` - review generated images and keep the best ones

**If the test failed:**

Based on the error code, give specific guidance:

- **API_ERROR with "API key not valid"** - "The API key didn't authenticate. Double-check you copied the whole key. Want to try pasting it again?"
- **API_ERROR with "quota"** - "You've hit a rate limit. This is unusual for a new key - wait a minute and try again, or check your Google Cloud billing."
- **API_ERROR with "permission"** - "Your API key doesn't have permission to use Gemini 2.5 Flash Image. Make sure you're using the Gemini API, not another Google API."
- **NO_IMAGE_IN_RESPONSE** - "The API responded but didn't return an image. This is unusual - let me retry with a different prompt."
- **PARSE_ERROR** - "Something went wrong parsing the response. Let me show you the raw response and we can diagnose."

### Step 7 - Update system state

After successful setup, update `00_System/system_config.md`:

```
## Features enabled
- nano_banana: true
- nano_banana_setup_date: [today's date]
```

This lets other workflows check if image generation is available.

### Step 8 - Suggest next step

> Now that image generation is set up, you're ready for the Visual Direction Engine. The first time you run `generate visual direction for [client name]`, I'll walk you through the full visual direction generation process for that client.

---

## Troubleshooting

### "Can't find Google AI Studio"
Direct them to https://aistudio.google.com/app/apikey explicitly. Tell them to sign in with Google first.

### "I'm being asked about billing"
Gemini API has a free tier but some regions require billing to be enabled. Walk them through enabling billing with a card (they won't be charged until they exceed the free tier, which is unlikely for normal usage).

### "The API key doesn't work"
Possible causes:
- They copied it with extra whitespace
- They created the key in a project without the Gemini API enabled
- Their account has geographic restrictions

Ask them to go back to aistudio.google.com and verify the key, then try again.

### "I don't want to pay anything"
The free tier covers small usage. For larger usage, explain the costs clearly:
- Free tier: 50 requests per day
- Paid tier: pay per use, roughly $0.02-0.04 per image
- Most designers use 15-30 images per client, so ~$0.30-$1.20 per client

If they're sensitive to costs, they can start on the free tier and upgrade when they need to.

---

## STOP

After setup is complete, the workflow ends. The user can now use image generation workflows whenever they want.
