#!/bin/bash

set -euo pipefail

echo "install-doom-emacs:"

EMACS_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/emacs"

if [[ ! -d "$EMACS_DIR/.git" ]]; then
  if [[ -e "$EMACS_DIR" ]]; then
    echo "Cannot install Doom Emacs: $EMACS_DIR exists but is not a git repository." >&2
    exit 1
  fi

  git clone --depth 1 https://github.com/doomemacs/core.git "$EMACS_DIR"
fi

# Doom's config is managed separately in ~/.config/doom by chezmoi.
"$EMACS_DIR/bin/doom" -! install --no-config --env
