# Install Prompt

Paste this into your AI coding agent (Claude Code, Cursor, Windsurf, Antigravity, etc.) to set up the Agentic AI Starter Kit.

---

```
I'm giving you a starter kit called Agentic AI Starter Kit. It sets me up with a personalised profile, safety rails, and 2 useful skills.

Before anything else, check if git is installed on my machine. Run `git --version` in the terminal.

If it returns a version number, you're good, move on.
If it says "command not found" or errors, walk me through installing git first:
- Windows: download from https://git-scm.com/download/win, run the installer, accept all defaults
- Mac: in Terminal, run `xcode-select --install` and hit enter
- Linux: `sudo apt install git` (Ubuntu/Debian) or `sudo dnf install git` (Fedora)

Plain English. One step at a time. Wait for me to confirm git is installed before continuing.

Once git is ready, get the kit:

git clone https://github.com/robonuggets/agentic-ai-starter-kit

Then read the README in the cloned folder and follow the INSTRUCTIONS FOR THE AGENT section. It will tell you to:
1. Ask me 7 short setup questions in one message (numbered, all at once)
2. Personalise CLAUDE.md based on my answers
3. Drop the safety-rail settings.json into place
4. Confirm the 2 skills are installed (humanizer + skill-creator)
5. Recommend which Claude model to use day-to-day
6. (Optional) explain how to switch to trust mode

Explain everything in plain English, I'm new to this. Pause after each major step and confirm before moving on.

If you're not Claude Code (e.g. Cursor, Windsurf, Antigravity, generic agent), adapt the file paths to your platform's equivalent. The README has notes on this. Tell me what you're translating as you go.
```

---

## Notes for the person sharing this prompt

- The git install check is built into the prompt, the agent handles it before cloning.
- This is the public version, uses `git clone` without authentication. If you fork to a private repo, swap in the PAT-embedded clone URL.
- The prompt is intentionally agent-agnostic. Claude Code reads `.claude/skills/` natively; other tools need a translation pass which the prompt asks the agent to do.
