#!/usr/bin/env bash

path="$1"

editor='Cursor'

if ! command -v cursor &>/dev/null; then
  editor='Visual Studio Code'
fi

path=$(resolve-git-path "$path")

open -a "$editor" "$path"
