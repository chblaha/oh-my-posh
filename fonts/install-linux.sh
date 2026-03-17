#!/usr/bin/env bash
set -e

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

FONT="CascadiaCode Nerd Font"

if fc-list | grep -qi "Cascadia"; then
  echo "Font bereits installiert"
  exit 0
fi

TMP=$(mktemp -d)
cd "$TMP"

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
unzip -q CascadiaCode.zip
cp *.ttf "$FONT_DIR"

fc-cache -fv
``