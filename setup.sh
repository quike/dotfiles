#!/usr/bin/env bash
stow --adopt .

defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder

# aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
defaults write com.apple.dock expose-group-apps -bool true && killall Dock
# aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

brew bundle --file=./.config/homebrew/Brewfile

mise trust && mise install
