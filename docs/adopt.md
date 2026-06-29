# Adopting the lighthouse in a project

Three models. Pick by how much you want updates to flow automatically.

## 1. Global (every project inherits it)

Install the skill + agent into your user-level `~/.claude/`, and add the
`CLAUDE.md` guidance to your global `~/.claude/CLAUDE.md`:

```bash
./install.sh --global
```

This copies:
- `skills/best-practices/` → `~/.claude/skills/best-practices/`
- `agents/claude-best-practices-specialist.md` → `~/.claude/agents/`

Then append this repo's [`CLAUDE.md`](../CLAUDE.md) into your `~/.claude/CLAUDE.md`
(the installer prints the exact snippet). Now `/best-practices` and the
specialist agent are available in **every** project, and the rules load every
session.

## 2. Per-project (vendored into the repo)

Copy into a specific project's `.claude/` and root `CLAUDE.md`:

```bash
./install.sh /path/to/your/project
```

This copies the skill + agent under `<project>/.claude/` and prints the
`CLAUDE.md` snippet to merge into the project's root `CLAUDE.md`. Good when you
want the practices **committed and versioned with the project** (e.g. shared with
a team).

## 3. Submodule / linked (auto-updating)

Vendor this repo and symlink, so `git pull` here updates every consumer:

```bash
# in your project
git submodule add https://github.com/leonardochalhoub/claude-best-practices .best-practices
ln -s ../../.best-practices/skills/best-practices .claude/skills/best-practices
ln -s ../../.best-practices/agents/claude-best-practices-specialist.md \
      .claude/agents/claude-best-practices-specialist.md
```

Or use the installer's link mode for the global case:

```bash
./install.sh --global --link   # symlink instead of copy
```

## Notes

- **Local agents/skills override plugin ones** of the same name (Claude Code's
  resolution order), so a project copy wins over a global one — intentional.
- Skills and agents load at **session start**; after installing, start a new
  session for them to appear.
- The `CLAUDE.md` guidance is the always-on layer; the skill/agent are the
  on-demand deep layer. Use both.
