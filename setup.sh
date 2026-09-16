#!/usr/bin/env bash
set -Eeuo pipefail

SKIP_STOW_ACTION=${SKIP_STOW_ACTION:-false}
SKIP_OSX_ACTION=${SKIP_OSX_ACTION:-false}
SKIP_BREW_ACTION=${SKIP_BREW_ACTION:-true}
SKIP_MISE_ACTION=${SKIP_MISE_ACTION:-false}

# --adopt moves whatever already lives in $HOME into this repo before linking
# it back, so machine-local edits end up committed. Opt in deliberately.
STOW_ADOPT=${STOW_ADOPT:-false}

# .stowrc and the Brewfile are resolved relative to the repository root.
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
  bold=$'\e[1m' dim=$'\e[2m' red=$'\e[31m' green=$'\e[32m' cyan=$'\e[36m' reset=$'\e[0m'
else
  bold='' dim='' red='' green='' cyan='' reset=''
fi

ran=0
skipped=0
started=0

step() {
  started=$SECONDS
  printf '\n%s==>%s %s%s%s\n' "$cyan" "$reset" "$bold" "$1" "$reset"
}

detail() { printf '    %s%s%s\n' "$dim" "$1" "$reset"; }

ok() {
  ran=$((ran + 1))
  printf '  %s✓%s %s %s(%ss)%s\n' "$green" "$reset" "$1" "$dim" "$((SECONDS - started))" "$reset"
}

skip() {
  skipped=$((skipped + 1))
  printf '\n%s==>%s %s%s%s %s· skipped, %s%s\n' "$cyan" "$reset" "$bold" "$1" "$reset" "$dim" "$2" "$reset"
}

die() {
  printf '\n  %s✗ %s%s\n' "$red" "$1" "$reset" >&2
  exit 1
}

trap 'die "failed at line $LINENO"' ERR

require() {
  command -v "$1" >/dev/null 2>&1 || die "$1 is required but not installed"
}

printf '%sdotfiles setup%s\n' "$bold" "$reset"
detail "$PWD"

if [ "$SKIP_STOW_ACTION" = true ]; then
  skip "Symlinks" "SKIP_STOW_ACTION=true"
else
  step "Symlinks"
  require stow
  if [ "$STOW_ADOPT" = true ]; then
    detail "--adopt: existing \$HOME files will be pulled into the repository"
    stow --adopt .
  else
    stow .
  fi
  ok "stowed into $HOME"
fi

if [ "$SKIP_OSX_ACTION" = true ]; then
  skip "macOS defaults" "SKIP_OSX_ACTION=true"
else
  step "macOS defaults"
  defaults write com.apple.finder AppleShowAllFiles -bool true
  detail "finder: show hidden files"
  # aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
  defaults write com.apple.dock expose-group-apps -bool true
  detail "dock: group windows by application"
  # aerospace: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
  defaults write com.apple.spaces spans-displays -bool true
  detail "spaces: displays share one space"
  detail "restarting Finder, Dock and SystemUIServer"
  killall Finder Dock SystemUIServer 2>/dev/null || true
  ok "3 defaults applied"
fi

if [ "$SKIP_BREW_ACTION" = true ]; then
  skip "Homebrew packages" "SKIP_BREW_ACTION=true"
else
  step "Homebrew packages"
  require brew
  detail "brew bundle --file=.config/homebrew/Brewfile"
  brew bundle --file=./.config/homebrew/Brewfile
  ok "Brewfile applied"
fi

if [ "$SKIP_MISE_ACTION" = true ]; then
  skip "Tool versions" "SKIP_MISE_ACTION=true"
else
  step "Tool versions"
  require mise
  mise trust --quiet
  missing=$(mise ls --missing 2>/dev/null | wc -l | tr -d ' ')
  if [ "$missing" -gt 0 ]; then
    detail "$missing tool(s) to install, this can take a while"
  fi
  mise install
  ok "$(mise ls --current 2>/dev/null | wc -l | tr -d ' ') tools current"
fi

printf '\n%sdone%s %s· %d run, %d skipped, %ss total%s\n' \
  "$green$bold" "$reset" "$dim" "$ran" "$skipped" "$SECONDS" "$reset"
