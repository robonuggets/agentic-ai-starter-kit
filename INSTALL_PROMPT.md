# Install Prompt

Paste this into your AI coding agent (Claude Code, Cursor, Windsurf, Antigravity, etc.) to set up the Agentic AI Starter Kit.

---

```
I'm giving you a starter kit called Agentic AI Starter Kit. It sets me up with a personalised profile, safety rails, and 2 useful skills.

Get the files with:

git clone https://github.com/robonuggets/agentic-ai-starter-kit

If git isn't installed on my machine, walk me through installing it first (one minute, link to the official installer for my OS).

Then read the README in the cloned folder and follow the INSTRUCTIONS FOR THE AGENT section. It will tell you to:
1. Ask me 5 short setup questions
2. Personalise CLAUDE.md based on my answers
3. Drop the safety-rail settings.json into place
4. Confirm the 2 skills are installed (humanizer + skill-creator)
5. Recommend which Claude model to use day-to-day
6. (Optional) explain how to switch to trust mode

Explain everything in plain English, I'm new to this. Pause after each step and confirm before moving on.

If you're not Claude Code (e.g. Cursor, Windsurf, Antigravity, generic agent), adapt the file paths to your platform's equivalent. The README has notes on this. Tell me what you're translating as you go.
```

---

## Notes for the person sharing this prompt

- Replace `robonuggets` with your GitHub username before sharing.
- This is the **public version**, uses `git clone` without authentication. If you fork to a private repo, swap in the PAT-embedded clone URL.
- The prompt is intentionally agent-agnostic. Claude Code reads `.claude/skills/` natively; other tools need a translation pass which the prompt asks the agent to do.
