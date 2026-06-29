#!/usr/bin/env bash
# Install the /best-practices skill + claude-best-practices-specialist agent
# globally (~/.claude) or into a target project's .claude/.
#
# Usage:
#   ./install.sh --global [--link]      # all projects (copy, or symlink with --link)
#   ./install.sh /path/to/project       # one project
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LINK=0
TARGET=""
for arg in "$@"; do
  case "$arg" in
    --link) LINK=1 ;;
    --global) TARGET="$HOME" ;;
    -*) echo "unknown flag: $arg" >&2; exit 2 ;;
    *) TARGET="$arg" ;;
  esac
done

if [ -z "$TARGET" ]; then
  echo "usage: ./install.sh --global [--link] | ./install.sh /path/to/project" >&2
  exit 2
fi

DEST="$TARGET/.claude"
mkdir -p "$DEST/skills" "$DEST/agents"

place() {  # place <src> <dest>
  local src="$1" dst="$2"
  if [ "$LINK" -eq 1 ]; then
    ln -sfn "$src" "$dst"; echo "  linked  $dst"
  else
    cp -R "$src" "$dst"; echo "  copied  $dst"
  fi
}

echo "Installing into $DEST ..."
place "$SRC/skills/best-practices" "$DEST/skills/best-practices"
place "$SRC/agents/claude-best-practices-specialist.md" "$DEST/agents/claude-best-practices-specialist.md"

echo ""
echo "Done. Start a new session for the skill + agent to load."
echo ""
echo "Always-on layer — add this to your CLAUDE.md ($TARGET/CLAUDE.md):"
echo "------------------------------------------------------------------"
cat "$SRC/CLAUDE.md"
echo "------------------------------------------------------------------"
