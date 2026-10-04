# Claude Dotfiles

Portable Claude Code configuration across desktop, web, VS Code, and terminal.

## Installation

```bash
# Clone this repo
git clone https://github.com/erubyte/claude-dotfiles ~/claude-dotfiles
cd ~/claude-dotfiles

# Run setup (creates symlink)
bash setup.sh
```

## What's Included

- **`.claude/settings.json`** - User permissions, default model, theme
- **`.claude/CLAUDE.md`** - Global communication style and instructions
- **`.claude/hooks/`** - Pre/post-commit hooks for automation

## Syncing Across Devices

### Option 1: Git (Recommended)
```bash
cd ~/claude-dotfiles
git pull  # Before starting work
git push  # After changes
```

### Option 2: Cloud Sync
Symlink to Dropbox/iCloud:
```bash
ln -s ~/Dropbox/claude-dotfiles ~/.claude-sync
```

## Cloud Sessions

Cloud sessions read only the project's `.claude/settings.json`. Commit team settings there.

## Files NOT Synced

Machine-specific (stored in `~/.claude` only, not in dotfiles):
- `sessions/` - Session history
- `cache/` - Plugin and changelog cache
- `ide/` - IDE locks
- `plugins/` - Installed plugins

These sync via Claude's cloud account, not via this repo.
