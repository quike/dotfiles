set --erase fish_greeting
set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx GOPATH "$HOME/.go"
set -gx CARGOPATH "$HOME/.cargo"
set -gx GO111MODULE auto
set -gx PYTHON3_PATH /usr/local/opt/python/libexec/
set -gx EMACSPATH "$HOME/.emacs.d"
set -gx LATEX_BIN /Library/TeX/texbin
# set -gx AWS_PATH "$HOME/Workspace/tools/aws-cli"
set -gx PATH "/opt/homebrew/bin $GOPATH/bin" "$CARGOPATH/bin" "$PYTHON3_PATH/bin" "$EMACSPATH/bin" "$LATEX_BIN" $PATH
set -gx EDITOR nvim

fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/opt/mysql@8.4/bin
fish_add_path "$HOME/Workspace/tools/maven/latest"
fish_add_path "$HOME/Workspace/tools/flutter/latest/bin"
fish_add_path "$HOME/.local/bin"

#fish_add_path "$AWS_PATH"

alias v="nvim"
alias n=v
alias z="zoxide"
alias c="clear"
alias dai="docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:0.4.2"
alias lg="lazygit"
alias ddt="docker rmi (docker images -f 'dangling=true' -q)"
alias ddc="docker container prune && docker volume prune"

starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/Users/quike/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/quike/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
