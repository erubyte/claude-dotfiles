#!/bin/bash
# Install all skills from manifest
# Usage: bash ~/.claude/install-all-skills.sh

MANIFEST="${HOME}/.claude/skills-manifest.txt"

if [ ! -f "$MANIFEST" ]; then
  echo "Error: Skills manifest not found at $MANIFEST"
  exit 1
fi

echo "Installing skills from manifest..."
echo ""

# Count total
TOTAL=$(grep -v "^#" "$MANIFEST" | grep -v "^$" | wc -l)
echo "Total skills to install: $TOTAL"
echo ""

# Install each skill
INSTALLED=0
FAILED=0

while IFS= read -r skill; do
  # Skip comments and empty lines
  [[ "$skill" =~ ^#.*$ ]] && continue
  [[ -z "$skill" ]] && continue

  echo "Installing: $skill"
  if npx skills add "$skill" 2>&1 | grep -q "Installation complete\|already installed"; then
    ((INSTALLED++))
  else
    echo "  ⚠ Install may have failed"
    ((FAILED++))
  fi
done < "$MANIFEST"

echo ""
echo "=== Installation Summary ==="
echo "Installed: $INSTALLED"
echo "Failed/Skipped: $FAILED"
echo ""
echo "Skills are now available in all future Claude Code sessions."
