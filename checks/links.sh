#!/usr/bin/env bash

set -e
set -o pipefail

npm install -g markdown-link-check
git fetch origin main:main
for file_name in $(git diff --name-only $HEAD main); do
  if [[ $file_name == *".md" ]]; then
    npx markdown-link-check --config ./checks/link-config.json --progress --verbose "$file_name"
  fi
done
