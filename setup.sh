#!/usr/bin/env bash

SKIP_STOW_ACTION=${SKIP_STOW_ACTION:-false}
SKIP_OSX_ACTION=${SKIP_OSX_ACTION:-false}
SKIP_BREW_ACTION=${SKIP_BREW_ACTION:-true}
SKIP_MISE_ACTION=${SKIP_MISE_ACTION:-false}

if [ "$SKIP_STOW_ACTION" = false ]; then
  stow --adopt .
fi

if [ "$SKIP_OSX_ACTION" = false ]; then
  # finde: enable show hidden files
  defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder
  # aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
  defaults write com.apple.dock expose-group-apps -bool true && killall Dock
  # aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
  defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer
fi

# Only run brew bundle if SKIP_BREW_BUNDLE is not true
if [ "$SKIP_BREW_ACTION" = false ]; then
    brew bundle --file=./.config/homebrew/Brewfile
fi

# Only run brew bundle if SKIP_BREW_BUNDLE is not true
if [ "$SKIP_MISE_ACTION" = false ]; then
  mise trust && mise install
fi
