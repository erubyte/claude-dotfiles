#!/bin/bash
# Skill audit tool wrapper
# Usage: bash ~/.claude/skills-audit.sh [scan|report]

AUDIT_REPO="${HOME}/skill-audit-kit"
SKILLS_PATH="${HOME}/.Claude/skills"
REPORT_DIR="${HOME}/.claude/audit-reports"

mkdir -p "$REPORT_DIR"

case "${1:-scan}" in
  scan)
    echo "Scanning installed skills for conflicts, duplication, orphans..."
    echo "Skills directory: $SKILLS_PATH"
    echo ""
    cd "$AUDIT_REPO" && node bin/cli.js scan "$SKILLS_PATH"
    ;;

  report)
    echo "Generating HTML report..."
    cd "$AUDIT_REPO" && node bin/cli.js scan "$SKILLS_PATH" --report html > "$REPORT_DIR/skills-audit-$(date +%Y%m%d-%H%M%S).html"
    echo "Report saved to: $REPORT_DIR"
    ls -lh "$REPORT_DIR"/skills-audit-*.html | tail -1
    ;;

  *)
    echo "Skill Audit Tool"
    echo ""
    echo "Usage: bash ~/.claude/skills-audit.sh [command]"
    echo ""
    echo "Commands:"
    echo "  scan       - Terminal output of conflicts, duplicates, orphans"
    echo "  report     - Generate HTML report (saved to ~/.claude/audit-reports/)"
    echo ""
    ;;
esac
