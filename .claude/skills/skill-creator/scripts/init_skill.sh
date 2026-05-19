#!/bin/bash
# Initialize a new skill with proper structure
# Usage: init_skill.sh <skill-name> [--scripts] [--references] [--assets]

set -e

SKILL_NAME="$1"
# Defaults to .claude/skills/ in the current project. Override with SKILLS_DIR env var
# to install globally (e.g. SKILLS_DIR="$HOME/.claude/skills" ./init_skill.sh my-skill).
SKILLS_DIR="${SKILLS_DIR:-.claude/skills}"

if [ -z "$SKILL_NAME" ]; then
    echo "Usage: init_skill.sh <skill-name> [--scripts] [--references] [--assets]"
    echo ""
    echo "Options:"
    echo "  --scripts     Create scripts/ directory"
    echo "  --references  Create references/ directory"
    echo "  --assets      Create assets/ directory"
    exit 1
fi

# Validate name (lowercase, hyphens only)
if ! [[ "$SKILL_NAME" =~ ^[a-z0-9-]+$ ]]; then
    echo "Error: Skill name must be lowercase with hyphens only"
    exit 1
fi

SKILL_PATH="$SKILLS_DIR/$SKILL_NAME"

if [ -d "$SKILL_PATH" ]; then
    echo "Error: Skill already exists at $SKILL_PATH"
    exit 1
fi

# Create base directory
mkdir -p "$SKILL_PATH"

# Parse optional directories
shift
for arg in "$@"; do
    case $arg in
        --scripts)
            mkdir -p "$SKILL_PATH/scripts"
            ;;
        --references)
            mkdir -p "$SKILL_PATH/references"
            ;;
        --assets)
            mkdir -p "$SKILL_PATH/assets"
            ;;
    esac
done

# Create SKILL.md template
cat > "$SKILL_PATH/SKILL.md" << 'EOF'
---
name: SKILL_NAME_PLACEHOLDER
description: TODO - Third-person description. Include trigger phrases. What it does + when to use.
---

# TODO: Skill Title

## Trigger Phrases
- "TODO: trigger phrase"

## Workflow
1. TODO: First step
2. TODO: Second step
   - [ ] Validation checkpoint

## Instructions

TODO: Core instructions

## Resources

TODO: Link to scripts/, references/, assets/ if used
EOF

# Replace placeholder with actual name
sed -i "s/SKILL_NAME_PLACEHOLDER/$SKILL_NAME/" "$SKILL_PATH/SKILL.md"

echo "✓ Created skill at $SKILL_PATH"
echo ""
echo "Next steps:"
echo "1. Edit $SKILL_PATH/SKILL.md"
echo "2. Add scripts/references/assets as needed"
echo "3. Test the skill"
