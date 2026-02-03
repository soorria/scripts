#!/usr/bin/env bash

# set -euxo pipefail

if [ $# -gt 1 ]; then
  git checkout $@
  exit 0
fi

branch="$1"

echo "Switching to branch $branch"

if [ -z "$branch" ]; then
  if command -v fzf > /dev/null; then
    branch=$(git branch --color=always | fzf --ansi | sed 's/\x1b\[[0-9;]*m//g' | cut -c3-)
    # branch=$(git branch | fzf | cut -c3-)
    # branch=$(git branch --format='%(refname:short)' | fzf --preview 'git log --oneline --graph --date=short --color=always {}' --preview-window :50%)
  else
    exit "Please specify a branch to switch to, or install fzf."
  fi
fi

git checkout "$branch"

