---
name: skill-creator
description: Create or update skills for your AI agent. Use when designing, building, or refining skills. Triggers on "create skill", "build skill", "new skill for [task]", or when packaging procedural knowledge into reusable form.
---

# Skill Creator

Build skills that make future-me better at specific tasks.

## When to Create a Skill

- Same workflow repeated 3+ times
- Domain-specific knowledge that isn't obvious
- Multi-step procedures with validation points
- Tool integrations with setup/config requirements

**Don't create skills for:** One-off tasks, things I already know, simple tool usage.

## Skill Structure

```
skill-name/
├── SKILL.md          # Required - main instructions
├── scripts/          # Optional - deterministic helpers
├── references/       # Optional - docs to load as needed
└── assets/           # Optional - templates, files for output
```

Project skills live in `.claude/skills/` at your project root. Global skills live in `~/.claude/skills/` (Mac/Linux) or `C:\Users\{username}\.claude\skills\` (Windows).

## SKILL.md Template

```markdown
---
name: kebab-case-name
description: Third-person description. Include trigger phrases. What does it do + when to use it.
---

# Skill Title

## Trigger Phrases
- "phrase that should activate this"
- "another trigger pattern"

## Workflow
1. Step one
2. Step two
   - [ ] Checkpoint/validation
3. Step three

## Instructions
[Core logic, commands, patterns]

## Resources
- [scripts/helper.sh](scripts/helper.sh) - when to use
- [references/api.md](references/api.md) - load for detailed API info
```

## Frontmatter Rules

| Field | Rules |
|-------|-------|
| `name` | Lowercase, hyphens only. Max 64 chars. Verb-led preferred. |
| `description` | Third person. Include triggers. Max 1024 chars. |

Bad: `name: MyAwesomeSkill`  
Good: `name: generating-thumbnails`

## Writing Principles

### Conciseness
I'm smart. Don't explain what a PDF is. Focus on what's unique to this skill.

**Token budget:** Keep SKILL.md under 500 lines. If more detail needed, split to references/.

### Degrees of Freedom

Match specificity to task fragility:

| Freedom | Format | When |
|---------|--------|------|
| High | Bullet points | Multiple valid approaches |
| Medium | Code templates | Preferred pattern exists |
| Low | Exact commands | Fragile operations |

Example high freedom:
```markdown
## Image Selection
- Prefer high contrast
- Avoid busy backgrounds
- Consider aspect ratio for target platform
```

Example low freedom:
```markdown
## Rotate PDF
```bash
python scripts/rotate_pdf.py --input "$FILE" --degrees 90
`` `
```

### Progressive Disclosure

1. **Description** - Always in context (~100 words). This is the trigger.
2. **SKILL.md body** - Loaded when skill activates (<500 lines)
3. **references/** - Loaded on demand (unlimited)

Link to deeper content:
```markdown
For tracked changes workflow, see [references/redlining.md](references/redlining.md).
```

## Workflow Integration

### Plan-Validate-Execute Pattern

For risky operations, include validation:

```markdown
## Workflow

1. **Plan**: List files to modify
2. **Validate**: Run `scripts/check_config.py`, must pass before proceeding
3. **Execute**: Apply changes
4. **Verify**: Run tests/checks
```

### Checklists for State Tracking

For multi-step workflows, include copyable checklists:

```markdown
## Deployment Checklist
- [ ] Config validated
- [ ] Tests passing
- [ ] Backup created
- [ ] Changes applied
- [ ] Smoke test passed
```

### Error Handling

For scripts: "Run `--help` if unsure about options."

Don't over-document error cases, handle common ones, let errors surface naturally.

## Scripts Guidelines

Put code in `scripts/` when:
- Same code rewritten repeatedly
- Deterministic reliability needed
- Complex logic that benefits from testing

Scripts should be:
- Self-contained (no unusual dependencies)
- Have `--help` documentation
- Tested before committing

## Creating a New Skill

### Step 1: Gather Examples

Ask myself:
- What triggers this skill?
- What's a concrete example of using it?
- What does success look like?

### Step 2: Identify Reusable Parts

For each example:
- What code do I write repeatedly? → `scripts/`
- What docs do I reference? → `references/`
- What templates do I copy? → `assets/`

### Step 3: Create Structure

```bash
mkdir -p .claude/skills/new-skill-name/scripts
touch .claude/skills/new-skill-name/SKILL.md
```

### Step 4: Write SKILL.md

Start with frontmatter and triggers. Add workflow. Fill instructions. Link resources.

### Step 5: Test

Actually use the skill. Does it trigger correctly? Are instructions clear? Iterate.

## Anti-Patterns

❌ **Don't create:**
- README.md, CHANGELOG.md, INSTALLATION.md
- "When to use this skill" in the body (put in description)
- Deeply nested references (one level max)
- Verbose explanations of common concepts

❌ **Don't:**
- Duplicate info between SKILL.md and references
- Include setup instructions in the skill itself
- Over-specify when flexibility is fine

## Examples of Good Skill Patterns

- **Preference-based, high freedom** - a workflow skill that captures how *you* like to work. Mostly bullet points, leaves the agent room to judge.
- **Sub-agent spawning** - a research skill that fans out to multiple sub-agents and consolidates findings.
- **Simple tool integration** - a thin wrapper around a CLI tool or API. Mostly low-freedom exact commands.

## Validation Checklist

Before considering a skill complete:

- [ ] `name` is kebab-case, descriptive
- [ ] `description` includes triggers and purpose
- [ ] SKILL.md < 500 lines
- [ ] No README/CHANGELOG/etc clutter
- [ ] Scripts tested (if any)
- [ ] Actually used the skill successfully
