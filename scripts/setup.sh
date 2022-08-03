#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(git rev-parse --show-toplevel)"

# Setup git hooks
$PROJECT_DIR/scripts/githooks/setup-hooks.sh

# Setup bundle
bundle install

# Setup pods
bundle exec pod install --repo-update