set --erase fish_greeting
set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx GOPATH "$HOME/.go"
set -gx CARGOPATH "$HOME/.cargo"
set -gx GO111MODULE auto
set -gx PYTHON3_PATH /usr/local/opt/python/libexec
set -gx EMACSPATH "$HOME/.emacs.d"
set -gx LATEX_BIN /Library/TeX/texbin
# set -gx AWS_PATH "$HOME/Workspace/tools/aws-cli"
# $CARGOPATH/bin is added by conf.d/rustup.fish
set -gx PATH "/opt/homebrew/bin" "$GOPATH/bin" "$PYTHON3_PATH/bin" "$EMACSPATH/bin" "$LATEX_BIN" $PATH
set -gx EDITOR nvim
set -gx DOCKER_DEFAULT_PLATFORM linux/arm64
set -gx DO_NOT_TRACK 1

fish_add_path /opt/homebrew/sbin/
fish_add_path /opt/homebrew/opt/mysql@8.4/bin
fish_add_path "$HOME/Workspace/tools/maven/latest"
fish_add_path "$HOME/Workspace/tools/flutter/latest/bin"
fish_add_path "$HOME/.local/bin"

#fish_add_path "$AWS_PATH"

alias v="nvim"
alias n=v
alias zj="zellij"
alias c="clear"
alias k="kubectl"
alias dai="docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:0.4.2"
alias lg="lazygit"
alias ddt="docker rmi (docker images -f 'dangling=true' -q)"
alias ddc="docker container prune && docker volume prune"

type -q starship; and starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

type -q zoxide; and zoxide init fish | source

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "$HOME/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

if status is-interactive
    if type -q fastfetch
        fastfetch
    end
end

type -q direnv; and direnv hook fish | source

if status is-interactive
    type -q atuin; and atuin init fish | source
end
