#!/usr/bin/env bash
# bootstrap-zsh.sh — reinstall external oh-my-zsh plugins/themes on a new machine.
#
# Run this AFTER installing oh-my-zsh (https://ohmyz.sh) and BEFORE (or after)
# stowing the zsh package. Built-in plugins (git, vscode, dirhistory, jsontools)
# ship with oh-my-zsh — only the external ones below need cloning.

set -euo pipefail

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone() { # clone <target-dir> <git-url>
  if [ -d "$1" ]; then
    echo "already installed: $1"
  else
    git clone --depth=1 "$2" "$1" && echo "installed: $1"
  fi
}

# ── External plugins ──────────────────────────────────────────────────────────
clone "$ZSH_CUSTOM/plugins/zsh-autosuggestions" https://github.com/zsh-users/zsh-autosuggestions

# Add more here as you install them, e.g.:
# clone "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" https://github.com/zsh-users/zsh-syntax-highlighting

echo "Done. Restart your shell or run: source ~/.zshrc"
