#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
JUSTFILE="${REPO_ROOT}/Justfile"

if ! command -v just >/dev/null 2>&1; then
echo "❌ 'just' command not found. Install it first (e.g., brew install just)."
    exit 1
fi

just --justfile "${JUSTFILE}" "$@"
