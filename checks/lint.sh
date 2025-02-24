#!/usr/bin/env bash

set -e
set -o pipefail

npm install -g markdownlint-cli
# git fetch origin main:main
for file_name in $(git diff --name-only $HEAD main); do
  if [[ $file_name == *".md" ]]; then
    markdownlint -c ./checks/lint-config.json "$file_name"
  fi
done
