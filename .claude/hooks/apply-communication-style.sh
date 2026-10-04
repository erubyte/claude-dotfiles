#!/bin/bash
# Hook: Apply nora-communication-style to every Claude session
# This runs at session start and ensures the communication style is loaded

# Check if the skill exists
SKILL_PATH="$HOME/Library/Application Support/Claude/skills/nora-communication-style"

if [ -f "$SKILL_PATH/SKILL.md" ]; then
  # Log that the hook ran (optional, for debugging)
  echo "[HOOK] nora-communication-style is installed at $SKILL_PATH" >> /tmp/claude-hooks.log

  # The hook cannot directly modify Claude's context, but we can ensure the skill is discoverable.
  # The actual enforcement happens through the user's system message / instructions.
  exit 0
else
  echo "[HOOK] WARNING: nora-communication-style skill not found at $SKILL_PATH" >> /tmp/claude-hooks.log
  exit 1
fi
