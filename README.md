# Agentic AI Starter Kit

A beginner-friendly setup for Claude Code (and other agentic AI tools). Drop this in and your AI assistant comes pre-configured with safety rails, useful skills, and a personalised profile.

> **Who this is for:** people new to AI coding agents and the command line. If you've never used a terminal before, you're in the right place. The agent will walk you through everything.

---

## What this gives you

When you finish the setup, you'll have:

1. **A personalised `CLAUDE.md`** - a one-page profile so the agent knows who you are and how you like to work
2. **Safety rails** - a list of dangerous commands the agent will never run without asking
3. **2 starter skills** - small "abilities" your agent can use any time:
   - **humanizer** - removes AI-sounding patterns from writing
   - **skill-creator** - helps you build your own skills later

---

## INSTRUCTIONS FOR THE AGENT

> **If you're a human reading this:** the section below is written for the AI agent. You can read it too, it'll show you exactly what's about to happen. The agent will pause at each major step.

### Agent: read this carefully before doing anything

You are helping a beginner set up Claude Code. Your job:

1. **Explain things in plain English.** No jargon. If you must use a technical term, define it the first time. Imagine talking to a smart friend who's never used a terminal.
2. **Ask the 7 setup questions below in ONE message.** Numbered, all at once. Wait for the user's reply, then move on.
3. **Show your work.** Before writing each file, say "I'm about to create `CLAUDE.md`, this is your personal profile that helps me work the way you want." Then create it.
4. **Confirm at each major step.** "Done. Want me to continue?"

### Step 1 - Ask the user these 7 questions in one message

(Git is already installed at this point, the install prompt handled it before cloning the repo. The user's OS is detectable from the path or `uname` - don't ask, just figure it out.)

Post this exact message to the user:

> Quick 7-question setup. Answer all in one message, just put numbers next to your replies. Skip any you're unsure about and I'll use a sensible default. (I'll figure out your OS on my own, don't worry about that.)
>
> 1. What should I call you, and what are you working on right now?
> 2. How comfortable are you with technical stuff - none at all, some basics, fairly comfortable, or advanced?
> 3. What's the main thing you want help with - writing, coding, research, business ops, or a mix?
> 4. What tone do you prefer me to use - casual mate, formal pro, terse and dry, or warm and chatty?
> 5. How long should my responses be by default - short bullets, medium with context, or detailed walkthroughs?
> 6. How autonomous should I be - ask before every change, ask only on risky stuff, or just do it and report after?
> 7. Is there anything I should never do, like use em-dashes, emoji, jargon, or auto-open files?

Wait for the full reply before continuing.

### Step 2 - Write the personalised CLAUDE.md

Take `CLAUDE.md.template` as your starting point. Fill in the placeholders using the user's answers:

- `{{NAME_AND_PROJECT}}` - their answer to Q1
- `{{TECH_COMFORT}}` - Q2
- `{{USE_CASE}}` - Q3
- `{{TONE}}` - Q4
- `{{LENGTH}}` - Q5
- `{{AUTONOMY}}` - Q6
- `{{ANTI_PATTERNS}}` - Q7 (list the things they said never to do, or "none specified" if they skipped)
- `{{OS}}` - what you auto-detected (Windows / Mac / Linux)

Save it as `CLAUDE.md` (drop the `.template`) in the same folder they cloned this repo into.

**Important:** If they're setting this up inside an existing project folder, ask: "Do you want this `CLAUDE.md` to apply to this project specifically, or to *every* project you open with Claude Code?" If global, save to `~/.claude/CLAUDE.md` (Mac/Linux) or `C:\Users\{username}\.claude\CLAUDE.md` (Windows).

### Step 3 - Set up the safety rails

Move `.claude/settings.json` from this repo into the right spot:

- **Project-specific:** keep it where it is, at `.claude/settings.json` in the project folder
- **Global (recommended for beginners):** copy it to `~/.claude/settings.json` (Mac/Linux) or `C:\Users\{username}\.claude\settings.json` (Windows)

This file does two things:

1. **Deny list** - blocks catastrophic commands (delete-everything, force-push to git, factory-reset, etc.) so the agent literally cannot run them
2. **Allow list** - pre-approves safe stuff (listing files, reading files, checking git status) so the agent doesn't have to ask permission constantly

Tell the user: "I've added a list of dangerous commands I can never run, and a list of safe ones I won't keep asking about. You can edit `settings.json` anytime to add or remove things."

### Step 4 - Install the 2 skills

The `.claude/skills/` folder already contains them. Just confirm they're in place:

```
.claude/skills/
  ├── humanizer/
  └── skill-creator/
```

If the user picked global settings in Step 3, copy `.claude/skills/` to `~/.claude/skills/` (Mac/Linux) or `C:\Users\{username}\.claude\skills\` (Windows) too.

Explain each skill in one sentence:

- **humanizer** - "Paste in AI-sounding text, get it rewritten to sound human. Try it: type 'humanize this' and paste a paragraph."
- **skill-creator** - "When you want to turn a task you do often into a reusable shortcut, ask me to 'create a skill for this'. I'll interview you, draft the skill, and help you test it."

### Step 5 - Model recommendation

Tell the user:

> "Claude Code lets you switch between three models depending on the task:
>
> - **Sonnet** (default, recommended) - smart and fast. Good for ~90% of work. Type `/model sonnet`.
> - **Haiku** - cheaper and faster. Use for simple stuff like renaming files, quick lookups, summarising short text. Type `/model haiku`.
> - **Opus** - the most powerful, but slow and expensive. Save for hard reasoning, complex planning, or when Sonnet gets stuck. Type `/model opus`.
>
> Start on Sonnet. Drop to Haiku for simple tasks to save money. Bring out Opus when something's really hard."

### Step 6 - (Optional) Enable trust mode

If the user picked the "just do it and report after" option in Question 6, show them how to enable trust mode:

> "To turn on trust mode, close Claude Code, then re-open it by typing this in your terminal:
>
> ```
> claude --dangerously-skip-permissions
> ```
>
> That's it. The agent will still refuse the catastrophic commands in the deny list (delete-everything, force-push, etc.), but won't ask permission for everything else. Faster workflow once you trust the setup.
>
> To go back to safe mode, just launch with `claude` (no flag).
>
> **Tip:** Don't use trust mode on a brand-new project until you've checked `settings.json` looks right."

### Step 7 - Wrap up

Tell the user what to try first based on their use case from Q3:

- **Writing:** "Try `humanize this:` followed by a paragraph of AI-written text"
- **Coding:** "Open a project folder and ask me to explain what it does"
- **Research:** "Paste a long article and ask me to pull out the 5 key points"
- **Business ops:** "Tell me about a recurring task you do and we'll see if we can automate it"
- **Mix:** "Just chat, tell me what you're working on today"

End with: "You're set up. If something doesn't feel right, just tell me, and we'll adjust your CLAUDE.md together."

---

## Using a different AI coding tool?

This starter is built for **Claude Code** (Anthropic's terminal agent). If you're using a different platform, here's how the pieces map:

- **Cursor / Windsurf / Antigravity / other AI IDEs:** Most look for instructions in `.cursorrules`, `.windsurfrules`, or similar. Show the agent your `CLAUDE.md` and ask it to translate the content into your tool's equivalent. The skills under `.claude/skills/` are written as plain markdown, most tools can use them with light adaptation.
- **Generic:** the README + CLAUDE.md + settings.json pattern works conceptually anywhere. Ask your agent to read this README and adapt the file paths to your tool.

---

## What's inside

```
agentic-ai-starter-kit/
├── README.md                  # this file
├── CLAUDE.md.template         # personalised by the agent during setup
├── INSTALL_PROMPT.md          # paste-in prompt to share with others
└── .claude/
    ├── settings.json          # deny list + allow list
    └── skills/
        ├── humanizer/
        └── skill-creator/
```
