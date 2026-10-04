#!/bin/bash
# Setup script: Create symlink from ~/.claude to ~/claude-dotfiles/.claude

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_HOME="$HOME/.claude"

echo "Claude Dotfiles Setup"
echo "===================="
echo "Dotfiles: $DOTFILES_DIR"
echo "Target:   $CLAUDE_HOME"
echo ""

# Backup existing ~/.claude
if [ -d "$CLAUDE_HOME" ]; then
  BACKUP_DIR="$HOME/.claude.backup.$(date +%s)"
  echo "Backing up existing ~/.claude to $BACKUP_DIR"
  mv "$CLAUDE_HOME" "$BACKUP_DIR"
  echo "Backup complete."
fi

# Create symlink
echo "Creating symlink..."
ln -s "$DOTFILES_DIR/.claude" "$CLAUDE_HOME"
echo "✓ Symlink created: ~/.claude -> $DOTFILES_DIR/.claude"
echo ""
echo "Setup complete. Your Claude config is now synced."
echo "To push changes: cd $DOTFILES_DIR && git push"
