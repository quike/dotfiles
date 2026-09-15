#!/usr/bin/env bash
set -euo pipefail

SKIP_STOW_ACTION=${SKIP_STOW_ACTION:-false}
SKIP_OSX_ACTION=${SKIP_OSX_ACTION:-false}
SKIP_BREW_ACTION=${SKIP_BREW_ACTION:-true}
SKIP_MISE_ACTION=${SKIP_MISE_ACTION:-false}

# --adopt moves whatever already lives in $HOME into this repo before linking
# it back, so machine-local edits end up committed. Opt in deliberately.
STOW_ADOPT=${STOW_ADOPT:-false}

# .stowrc and the Brewfile are resolved relative to the repository root.
cd "$(dirname "${BASH_SOURCE[0]}")"

require() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "setup: $1 is required but not installed" >&2
    exit 1
  }
}

if [ "$SKIP_STOW_ACTION" = false ]; then
  require stow
  if [ "$STOW_ADOPT" = true ]; then
    stow --adopt .
  else
    stow .
  fi
fi

if [ "$SKIP_OSX_ACTION" = false ]; then
  # finder: enable show hidden files
  defaults write com.apple.finder AppleShowAllFiles -bool true
  killall Finder || true
  # aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
  defaults write com.apple.dock expose-group-apps -bool true
  killall Dock || true
  # aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
  defaults write com.apple.spaces spans-displays -bool true
  killall SystemUIServer || true
fi

if [ "$SKIP_BREW_ACTION" = false ]; then
  require brew
  brew bundle --file=./.config/homebrew/Brewfile
fi

if [ "$SKIP_MISE_ACTION" = false ]; then
  require mise
  mise trust && mise install
fi
