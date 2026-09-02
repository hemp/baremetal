#!/usr/bin/env bash

set -euo pipefail

FONT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download"
ARCHIVES=(
  Iosevka.tar.xz
  Meslo.tar.xz
  NerdFontsSymbolsOnly.tar.xz
)

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$FONT_DIR"

for archive in "${ARCHIVES[@]}"; do
  echo "Downloading $archive"
  archive_dir="$TMP_DIR/${archive%.tar.xz}"
  mkdir -p "$archive_dir"
  curl -fsSL --retry 3 "$DOWNLOAD_URL/$archive" -o "$TMP_DIR/$archive"
  tar -xJf "$TMP_DIR/$archive" -C "$archive_dir"
  find "$archive_dir" -type f -name '*.ttf' -exec cp -f {} "$FONT_DIR/" \;
done

if command -v fc-cache >/dev/null; then
  fc-cache -f "$FONT_DIR"
fi

echo "Fonts installed in $FONT_DIR"
