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

> **If you're a human reading this:** the section below is written for the AI agent. You can read it too, it'll show you exactly what's about to happen. The agent will pause and ask you questions as it goes.

### Agent: read this carefully before doing anything

You are helping a beginner set up Claude Code. Your job:

1. **Explain things in plain English.** No jargon. If you must use a technical term, define it the first time. Imagine talking to a smart friend who's never used a terminal.
2. **Ask the user the 5 setup questions below.** One at a time. Wait for each answer.
3. **Show your work.** Before writing each file, say "I'm about to create `CLAUDE.md`, this is your personal profile that helps me work the way you want." Then create it.
4. **Confirm at each major step.** "Done. Want me to continue?"

### Step 1 - Ask the user these 5 questions

(Git is already installed at this point, the install prompt handled it before cloning the repo.)

Ask one at a time. Plain English. No technical terms unless you explain them.

**Question 1 - Name**
> "What should I call you?"

**Question 2 - Role / what they do**
> "What do you do? Give me one sentence, like 'I run a small ecommerce store' or 'I'm learning to code' or 'I'm a marketer who writes a lot.'"

**Question 3 - Primary use case**
> "What's the first thing you want help with? Pick the closest:
> - **A.** Writing, emails, posts, articles, scripts
> - **B.** Coding, building apps, websites, automations
> - **C.** Research, digging into topics, summarising long stuff
> - **D.** Business ops, running a team, customer work, admin
> - **E.** Mix of everything"

**Question 4 - Operating system**
> "Are you on Windows, Mac, or Linux?" (You may already know this from the path, confirm anyway.)

**Question 5 - Permission style**
> "How do you want me to handle risky stuff? Two options:
>
> - **Safe mode (recommended for first week):** I'll ask before doing anything that could delete files, push code online, or change important settings. More clicks for you, but nothing surprises you.
>
> - **Trust mode:** I just do things. Faster. We've pre-loaded a list of catastrophic commands I'll *never* run without asking (like deleting your whole drive). Everything else, I just do.
>
> Pick safe mode for now if you're not sure. You can switch later."
>
> If they pick trust mode, explain how to enable it after setup (see Step 6 below).

### Step 2 - Write the personalised CLAUDE.md

Take `CLAUDE.md.template` as your starting point. Fill in:

- `{{NAME}}` becomes their name
- `{{ROLE}}` becomes their one-sentence role
- `{{USE_CASE}}` becomes the option they picked plus one sentence on what that means for how you'll work
- `{{OS}}` becomes their operating system

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
- **skill-creator** - "When you find yourself doing the same task often, ask me to 'create a skill for this' and I'll build a reusable shortcut."

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

If the user picked **Trust mode** in Question 5, show them how:

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

Tell the user what to try first based on their use case:

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
├── LICENSE
└── .claude/
    ├── settings.json          # deny list + allow list
    └── skills/
        ├── humanizer/
        └── skill-creator/
```

---

## License

CC BY 4.0, free to use, remix, share. Attribution appreciated.
