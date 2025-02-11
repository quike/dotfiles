# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
fpath+=~/.config/zsh/completions/
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$HOME/.config/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  brew
  bun
  bundler
  cp
  deno
  gh
  github
  rust
  ruby
  common-aliases
  direnv
  dotenv
  encode64
  fzf
  fzf-zsh-plugin
  git
  golang
  gradle
  iterm2
  jsontools
  mvn
  node
  npm
  macos
  pip
  tmux
  vscode
  wd
  zsh-completions 
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

fpath=($fpath "$HOME/.zfunctions")

# Load custom zshrc for extra
ZSHRC_CUSTOM="$HOME/.zshrc.custom"
if [ -f "$ZSHRC_CUSTOM" ]; then
    source "$ZSHRC_CUSTOM"
else
    echo "No $ZSHRC_CUSTOM, ignore."
fi

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

# Custom
alias code="codium"
alias keepup="brew upgrade && brew update && omz update && omz reload"
alias e="nvim"
alias vim="nvim"
alias cl='clear'

# navigation
cx() { cd "$@" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

#oh-my-posh
#eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/base.toml)"

# zoxide
eval "$(zoxide init zsh)"

# bun
[ -s "/Users/quike/.bun/_bun" ] && source "/Users/quike/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/quike/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
