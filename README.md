# Claude Dotfiles

Portable Claude Code configuration across all surfaces: terminal, desktop, web, VS Code, and JetBrains IDEs.

**One command to sync your entire Claude setup across devices.**

## What's Included

- **Global communication style** (professional, neutral, no exclamation marks)
- **Permission rules** (read-only bash commands, allowed plugins)
- **Default model and theme** settings
- **Automation hooks** (pre/post actions)
- **Links to all 39 skills** (in erubyte/claude-skills)

See [erubyte/claude-skills](https://github.com/erubyte/claude-skills) for the full skill library.

## Quick Start

### Desktop, Terminal, VS Code

```bash
# Clone this repo
git clone https://github.com/erubyte/claude-dotfiles ~/claude-dotfiles
cd ~/claude-dotfiles

# Run setup (creates symlink ~/.claude -> ~/claude-dotfiles/.claude)
bash setup.sh

# Verify
claude --version
```

Your config is now active across all Claude surfaces. Start Claude Code on any project — it will load your global settings, communication style, and CLAUDE.md instructions.

### Web (claude.ai/code)

Cloud sessions read only the project's `.claude/settings.json` and your organization's managed settings. Before running a cloud session:

```bash
cd your-project
# Copy shared settings if needed:
cp ~/claude-dotfiles/.claude/settings.json .claude/settings.json
git add .claude/settings.json
git commit -m "Add team Claude Code settings"
git push
```

## Syncing Across Devices

### Option 1: Git Push/Pull (Recommended)

After any change:

```bash
cd ~/claude-dotfiles
git add -A
git commit -m "Update communication style / add hook / etc"
git push
```

On another device:

```bash
cd ~/claude-dotfiles
git pull
```

### Option 2: Dropbox/iCloud Sync

If you prefer automatic sync:

```bash
# On first device
rm -rf ~/claude-dotfiles
ln -s ~/Dropbox/Claude-Sync ~/claude-dotfiles
```

Dropbox syncs the files automatically. On other devices, create the same symlink.

## What's Synced

✅ **Synced across devices:**
- `.claude/CLAUDE.md` — Global instructions and communication style
- `.claude/settings.json` — Permissions, model, theme
- `.claude/hooks/` — Automation scripts

❌ **NOT synced (machine-specific):**
- `sessions/` — Session history (stays local)
- `cache/` — Plugin cache (Claude syncs via account)
- `ide/` — IDE locks (editor-specific)
- `.claude.json` — Session tokens (NEVER share!)

Machine-specific files stay in `~/.claude.local` and aren't committed.

## Communication Style

This dotfiles repo enforces a professional, neutral communication style:

- **No exclamation marks** in prose
- **Minimal punctuation** (commas only where clarity needs them)
- **Short paragraphs** and active voice
- **No intensifiers** (very, really, quite, so, such)
- **Facts without editorial** ("This works" not "This beautifully solves the problem")

See `.claude/CLAUDE.md` for the full style guide and examples.

## Installing Skills

All 39 skills are available at [erubyte/claude-skills](https://github.com/erubyte/claude-skills).

Install globally:

```bash
npx skills add erubyte/claude-skills@agent-architecture-patterns
npx skills add erubyte/claude-skills@choose-design-skills
npx skills add erubyte/claude-skills@documentation-style
```

Or from Claude Code:

```
/install-skill: erubyte/claude-skills improve-codebase-architecture
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

## Customizing Your Setup

Edit `~/.claude/settings.json` to customize. See [Claude Code settings](https://code.claude.com/docs/en/settings) for all options.

Commit changes:

```bash
cd ~/claude-dotfiles
git add .claude/settings.json
git commit -m "Update [what changed]"
git push
```

## Troubleshooting

**"Command not found: claude"** — Install via `curl -fsSL https://claude.ai/install.sh | bash`

**"Settings not loading"** — Run `/status` in Claude Code to check which files loaded

**"Communication style not applied"** — Restart the Claude Code session or check `~/.claude/CLAUDE.md` exists

## Related

- [erubyte/claude-skills](https://github.com/erubyte/claude-skills) — All 39 skills
- [agentsKB](https://github.com/erubyte/agentsKB) — Knowledge base of practices

For Claude Code docs: https://code.claude.com/docs

## Skills

Master copy lives in a separate repo: https://github.com/erubyte/claude-skills
New machine:

    git clone https://github.com/erubyte/claude-skills ~/claude-skills
    ln -sfn ~/claude-skills ~/.claude/skills
    ln -sfn ~/claude-skills ~/.Claude/skills
    ln -sfn ~/claude-skills "$HOME/Library/Application Support/Claude/skills"
