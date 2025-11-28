set allow-duplicate-recipes := true
set ignore-comments := true

# Root of the detectors checkout. Shared with recipes for relative paths.
detector_repo_root := justfile_directory()

# Default target just lists available commands.
_default:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Supply-Chain Security Detectors"
    echo ""
    just --list

import "./sparkSec/recipes/04-security.just"
