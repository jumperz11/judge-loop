#!/usr/bin/env bash
set -euo pipefail

SRC_ROOT="$(cd "$(dirname "$0")" && pwd)/skills"

if [ "${1:-}" = "--project" ]; then
    DEST_ROOT="$(pwd)/.codex/skills"
else
    DEST_ROOT="${CODEX_HOME:-$HOME/.codex}/skills"
fi

mkdir -p "$DEST_ROOT"

for skill in "$SRC_ROOT"/*/; do
    name="$(basename "$skill")"
    rm -rf "${DEST_ROOT:?}/$name"
    cp -R "$skill" "$DEST_ROOT/$name"
    echo "Installed $name to $DEST_ROOT/$name"
done

if command -v codex >/dev/null 2>&1; then
    echo "Codex CLI found: $(codex --version)"
else
    echo "Codex CLI not found. Install it if you want headless dispatch."
fi
