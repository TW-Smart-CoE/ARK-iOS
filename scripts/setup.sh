#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(git rev-parse --show-toplevel)"

# Setup git hooks
$PROJECT_DIR/scripts/githooks/setup-hooks.sh

# Setup bundle
bundle install

# Update Pod repo
bundle exec pod repo update

# Setup pods
bundle exec pod install

# Setup modules
cd "${PROJECT_DIR}/modules/Core"
bundle exec pod install

cd "${PROJECT_DIR}/modules/UI"
bundle exec pod install

