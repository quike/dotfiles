#!/usr/bin/env bash
stow --adopt .

defaults write com.apple.finder AppleShowAllFiles true
killall Finder

brew bundle --file=./.config/homebrew/Brewfile
