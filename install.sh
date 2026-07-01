#!/usr/bin/env bash
set -euo pipefail

SRC_ROOT="$(cd "$(dirname "$0")" && pwd)/skills"
PROJECT=false
FORCE=false

for arg in "$@"; do
    case "$arg" in
        --project) PROJECT=true ;;
        --force) FORCE=true ;;
        *)
            echo "Unknown option: $arg"
            echo "Usage: ./install.sh [--project] [--force]"
            exit 2
            ;;
    esac
done

if [ "$PROJECT" = true ]; then
    DEST_ROOT="$(pwd)/.codex/skills"
else
    DEST_ROOT="${CODEX_HOME:-$HOME/.codex}/skills"
fi

mkdir -p "$DEST_ROOT"
echo "Installing JudgeLoop skills to: $DEST_ROOT"

for skill in "$SRC_ROOT"/*/; do
    name="$(basename "$skill")"
    dest="$DEST_ROOT/$name"
    if [ -e "$dest" ]; then
        if [ "$FORCE" = true ]; then
            rm -rf "$dest"
            echo "Removed existing $dest (--force)"
        else
            backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
            mv "$dest" "$backup"
            echo "Backed up existing $dest to $backup"
        fi
    fi
    cp -R "$skill" "$dest"
    echo "Installed $name to $dest"
done

if command -v codex >/dev/null 2>&1; then
    echo "Codex CLI found: $(command -v codex)"
else
    echo "Codex CLI not found. Install it if you want headless dispatch."
fi
