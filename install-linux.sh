#!/usr/bin/env bash
set -e

# Oh My Posh
if ! command -v oh-my-posh >/dev/null; then
  curl -s https://ohmyposh.dev/install.sh | bash
fi

# Fonts
bash ~/oh-my-posh/fonts/install-linux.sh

# Bash config
grep -q oh-my-posh/bash/bashrc ~/.bashrc || \
  echo "source ~/oh-my-posh/bash/bashrc" >> ~/.bashrc