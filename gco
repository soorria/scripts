#!/usr/bin/env bash

# set -euxo pipefail

branch="$1"

echo "Switching to branch $branch"

if [ -z "$branch" ]; then
  if command -v fzf > /dev/null; then
    branch=$(git branch --format='%(refname:short)' | fzf)
    # branch=$(git branch --format='%(refname:short)' | fzf --preview 'git log --oneline --graph --date=short --color=always {}' --preview-window :50%)
  else
    exit "Please specify a branch to switch to, or install fzf."
  fi
fi

git checkout "$branch"

