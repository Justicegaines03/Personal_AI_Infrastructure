#!/usr/bin/env bash
# Install the PAI upstream sync as a macOS launchd job
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLIST_SRC="$SCRIPT_DIR/com.pai.upstream-sync.plist"
PLIST_DST="$HOME/Library/LaunchAgents/com.pai.upstream-sync.plist"

if [[ ! -f "$PLIST_SRC" ]]; then
  echo "Error: plist not found at $PLIST_SRC"
  exit 1
fi

if launchctl list | grep -q "com.pai.upstream-sync"; then
  echo "Unloading existing job..."
  launchctl unload "$PLIST_DST" 2>/dev/null || true
fi

mkdir -p "$HOME/Library/LaunchAgents"
cp "$PLIST_SRC" "$PLIST_DST"
launchctl load "$PLIST_DST"

echo "✓ PAI upstream sync installed — runs daily at 06:00"
echo "  Logs: ~/.claude/context/projects/Personal_AI_Infrastructure/memory/pai-sync-*.log"
echo ""
echo "Manual commands:"
echo "  Check status:  launchctl list | grep pai"
echo "  Run now:       launchctl start com.pai.upstream-sync"
echo "  Uninstall:     launchctl unload ~/Library/LaunchAgents/com.pai.upstream-sync.plist"
