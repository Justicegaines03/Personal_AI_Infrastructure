#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════
#  pai-sync.sh — Auto-sync upstream PAI and upgrade .claude
#
#  Fetches upstream (danielmiessler/PAI), merges into local
#  main, detects new releases, and repoints ~/.claude symlinks.
#
#  Safe by design:
#    - Never touches user-owned files (SOUL.md, USER.md, etc.)
#    - Creates timestamped backups before any symlink changes
#    - Dry-run mode by default (pass --apply to execute)
#    - Logs everything to memory/
# ═══════════════════════════════════════════════════════════
set -euo pipefail

BLUE='\033[38;2;59;130;246m'
GREEN='\033[38;2;34;197;94m'
YELLOW='\033[38;2;234;179;8m'
RED='\033[38;2;239;68;68m'
GRAY='\033[38;2;100;116;139m'
RESET='\033[0m'
BOLD='\033[1m'

info()    { echo -e "  ${BLUE}ℹ${RESET} $1"; }
success() { echo -e "  ${GREEN}✓${RESET} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${RESET} $1"; }
error()   { echo -e "  ${RED}✗${RESET} $1"; }
section() { echo -e "\n${BOLD}${BLUE}═══${RESET} $1 ${BLUE}═══${RESET}"; }

PAI_REPO="$HOME/.claude/context/projects/Personal_AI_Infrastructure"
CLAUDE_DIR="$HOME/.claude"
RELEASES_DIR="$PAI_REPO/Releases"
LOG_FILE="$PAI_REPO/memory/pai-sync.log"
DATE_STAMP=$(date +%Y-%m-%d)
TIME_STAMP=$(date +%Y-%m-%dT%H:%M:%S)

DRY_RUN=true
FORCE=false
SKIP_FETCH=false

USER_OWNED_FILES=(
  "SOUL.md" "USER.md" "MEMORY.md" "HEARTBEAT.md" "IDENTITY.md"
  "AGENTS.md" "TOOLS.md" "CLAUDE.md" ".openclaw"
)

SYMLINKED_DIRS=(
  "PAI" "PAI-Install" "VoiceServer" "agents" "hooks" "lib" "skills"
)

SYMLINKED_FILES=(
  "CLAUDE.md.template" "install.sh" "statusline-command.sh"
)

usage() {
  echo "Usage: pai-sync.sh [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  --apply       Actually execute changes (default: dry-run)"
  echo "  --force       Force symlink repoint even if version unchanged"
  echo "  --skip-fetch  Skip git fetch (use cached upstream refs)"
  echo "  --status      Show current version and upstream status"
  echo "  --help        Show this help"
  exit 0
}

log() {
  mkdir -p "$(dirname "$LOG_FILE")"
  echo "[$TIME_STAMP] $1" >> "$LOG_FILE"
}

get_current_version() {
  local target
  target=$(readlink "$CLAUDE_DIR/PAI" 2>/dev/null || echo "")
  if [[ -n "$target" ]]; then
    echo "$target" | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' | head -1
  else
    echo "unknown"
  fi
}

get_latest_release() {
  local latest=""
  local latest_sort=""
  for dir in "$RELEASES_DIR"/v*/; do
    [[ -d "$dir/.claude" ]] || continue
    local ver
    ver=$(basename "$dir")
    local sort_key
    sort_key=$(echo "$ver" | sed 's/v//' | awk -F. '{printf "%03d%03d%03d", $1, $2, $3}')
    if [[ -z "$latest_sort" ]] || [[ "$sort_key" > "$latest_sort" ]]; then
      latest="$ver"
      latest_sort="$sort_key"
    fi
  done
  echo "$latest"
}

show_status() {
  section "PAI Sync Status"
  local current
  current=$(get_current_version)
  local latest
  latest=$(get_latest_release)

  info "Current symlink version: ${BOLD}$current${RESET}"
  info "Latest local release:    ${BOLD}$latest${RESET}"

  cd "$PAI_REPO"
  git fetch upstream --quiet 2>/dev/null || true
  local local_head upstream_head
  local_head=$(git rev-parse main 2>/dev/null)
  upstream_head=$(git rev-parse upstream/main 2>/dev/null)

  if [[ "$local_head" == "$upstream_head" ]]; then
    success "Local main is up to date with upstream"
  else
    local behind
    behind=$(git rev-list --count main..upstream/main 2>/dev/null || echo "?")
    warn "Local main is ${BOLD}$behind${RESET} commits behind upstream"
  fi

  if [[ "$current" != "$latest" && "$latest" != "" ]]; then
    warn "Symlinks point to ${BOLD}$current${RESET} but ${BOLD}$latest${RESET} is available"
  elif [[ "$current" == "$latest" ]]; then
    success "Symlinks point to latest release"
  fi
}

fetch_upstream() {
  section "Fetching Upstream"
  cd "$PAI_REPO"

  if ! git remote get-url upstream &>/dev/null; then
    error "No 'upstream' remote configured"
    exit 1
  fi

  info "Fetching from $(git remote get-url upstream)..."
  git fetch upstream --quiet
  success "Upstream refs updated"

  local behind
  behind=$(git rev-list --count main..upstream/main 2>/dev/null || echo "0")
  if [[ "$behind" == "0" ]]; then
    success "Already up to date — no new upstream commits"
    return 1
  fi

  info "${BOLD}$behind${RESET} new commits from upstream"
  echo ""
  git log --oneline main..upstream/main | head -10
  [[ "$behind" -gt 10 ]] && echo "  ... and $((behind - 10)) more"
  return 0
}

merge_upstream() {
  section "Merging Upstream into Main"
  cd "$PAI_REPO"

  local current_branch
  current_branch=$(git branch --show-current)

  if [[ "$current_branch" != "main" ]]; then
    warn "Currently on branch '${current_branch}', switching to main"
    if $DRY_RUN; then
      info "[DRY RUN] Would switch to main and merge"
      return 0
    fi
    git stash push -m "pai-sync: auto-stash before merge" 2>/dev/null || true
    git checkout main
  fi

  if $DRY_RUN; then
    info "[DRY RUN] Would merge upstream/main into main"
    info "[DRY RUN] Would push merged main to origin"
    return 0
  fi

  info "Merging upstream/main..."
  if git merge upstream/main --no-edit; then
    success "Merge successful"
    log "MERGE: upstream/main merged into main"
  else
    error "Merge conflict detected — aborting merge"
    git merge --abort
    log "MERGE_CONFLICT: upstream merge aborted, manual resolution needed"
    return 1
  fi

  info "Pushing updated main to origin..."
  git push origin main
  success "Origin updated"
}

repoint_symlinks() {
  local new_version="$1"
  local new_release_dir="$RELEASES_DIR/$new_version/.claude"

  section "Repointing Symlinks → $new_version"

  if [[ ! -d "$new_release_dir" ]]; then
    error "Release directory not found: $new_release_dir"
    return 1
  fi

  local backup_dir="$CLAUDE_DIR/backups/pre-$new_version-$(date +%Y%m%d-%H%M%S)"

  if $DRY_RUN; then
    info "[DRY RUN] Would create backup at $backup_dir"
  else
    mkdir -p "$backup_dir"
    info "Backup created at $backup_dir"
  fi

  for dir in "${SYMLINKED_DIRS[@]}"; do
    local target="$new_release_dir/$dir"
    local link="$CLAUDE_DIR/$dir"
    if [[ -d "$target" ]]; then
      if $DRY_RUN; then
        info "[DRY RUN] $dir → $target"
      else
        if [[ -L "$link" ]]; then
          local old_target
          old_target=$(readlink "$link")
          echo "$dir -> $old_target" >> "$backup_dir/symlinks.txt"
        fi
        rm -f "$link"
        ln -s "$target" "$link"
        success "$dir → $target"
      fi
    else
      warn "Skipping $dir — not found in $new_version"
    fi
  done

  for file in "${SYMLINKED_FILES[@]}"; do
    local target="$new_release_dir/$file"
    local link="$CLAUDE_DIR/$file"
    if [[ -f "$target" ]]; then
      if $DRY_RUN; then
        info "[DRY RUN] $file → $target"
      else
        if [[ -L "$link" ]]; then
          local old_target
          old_target=$(readlink "$link")
          echo "$file -> $old_target" >> "$backup_dir/symlinks.txt"
        fi
        rm -f "$link"
        ln -s "$target" "$link"
        success "$file → $target"
      fi
    else
      warn "Skipping $file — not found in $new_version"
    fi
  done

  if ! $DRY_RUN; then
    log "UPGRADE: symlinks repointed from $(get_current_version) to $new_version"
  fi
}

write_memory_entry() {
  local new_version="$1"
  local memory_file="$PAI_REPO/memory/$DATE_STAMP.md"

  if $DRY_RUN; then
    info "[DRY RUN] Would append sync entry to $memory_file"
    return
  fi

  if [[ ! -f "$memory_file" ]]; then
    echo "# $DATE_STAMP" > "$memory_file"
    echo "" >> "$memory_file"
    echo "## Session Log" >> "$memory_file"
    echo "" >> "$memory_file"
  fi

  {
    echo ""
    echo "## PAI Upstream Sync"
    echo ""
    echo "- Synced upstream PAI repo (danielmiessler/Personal_AI_Infrastructure)"
    echo "- Upgraded symlinks from $(get_current_version) to $new_version"
    echo "- Backup stored in ~/.claude/backups/"
    echo "- User-owned files preserved (SOUL.md, USER.md, MEMORY.md, etc.)"
  } >> "$memory_file"
}

# ─── Parse Args ────────────────────────────────────────────
for arg in "$@"; do
  case "$arg" in
    --apply)     DRY_RUN=false ;;
    --force)     FORCE=true ;;
    --skip-fetch) SKIP_FETCH=true ;;
    --status)    show_status; exit 0 ;;
    --help|-h)   usage ;;
    *)           error "Unknown option: $arg"; usage ;;
  esac
done

# ─── Main ──────────────────────────────────────────────────
echo ""
echo -e "${BOLD}PAI Upstream Sync${RESET}"
if $DRY_RUN; then
  echo -e "${GRAY}  Running in dry-run mode. Use --apply to execute.${RESET}"
fi
echo ""

current_version=$(get_current_version)
info "Current version: ${BOLD}$current_version${RESET}"

has_new_commits=true
if ! $SKIP_FETCH; then
  fetch_upstream || has_new_commits=false
fi

if $has_new_commits; then
  merge_upstream
fi

latest_release=$(get_latest_release)
info "Latest available release: ${BOLD}$latest_release${RESET}"

if [[ "$current_version" != "$latest_release" && -n "$latest_release" ]] || $FORCE; then
  repoint_symlinks "$latest_release"
  write_memory_entry "$latest_release"

  echo ""
  if $DRY_RUN; then
    success "Dry run complete — would upgrade ${BOLD}$current_version${RESET} → ${BOLD}$latest_release${RESET}"
    info "Run with ${BOLD}--apply${RESET} to execute"
  else
    success "Upgrade complete: ${BOLD}$current_version${RESET} → ${BOLD}$latest_release${RESET}"
    warn "Restart Claude Code for hooks/skills changes to take effect"
  fi
else
  echo ""
  success "Already on latest release (${BOLD}$current_version${RESET})"
fi

log "SYNC_RUN: current=$current_version latest=$latest_release dry_run=$DRY_RUN"
echo ""
