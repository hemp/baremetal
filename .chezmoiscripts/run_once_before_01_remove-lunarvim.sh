#!/bin/bash

set -euo pipefail

echo "remove-lunarvim:"

for link in "$HOME/.local/bin/vi" "$HOME/.local/bin/vim"; do
  if [[ -L "$link" && "$(readlink "$link")" == */lvim ]]; then
    rm -f "$link"
  fi
done

rm -f "$HOME/.local/bin/lvim"
rm -rf \
  "${XDG_CONFIG_HOME:-$HOME/.config}/lvim" \
  "${XDG_DATA_HOME:-$HOME/.local/share}/lunarvim" \
  "${XDG_CACHE_HOME:-$HOME/.cache}/lvim"
