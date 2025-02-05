#!/usr/bin/env bash
stow --adopt .

defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder
defaults write com.apple.dock expose-group-apps -bool true && killall Dock

brew bundle --file=./.config/homebrew/Brewfile
