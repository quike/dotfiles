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
set -gx AWS_PATH "$HOME/Workspace/tools/aws-cli"
set -gx PATH "/opt/homebrew/bin $GOPATH/bin" "$CARGOPATH/bin" "$PYTHON3_PATH/bin" "$EMACSPATH/bin" "$LATEX_BIN" "$AWS_PATH" $PATH
set -gx EDITOR nvim

fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/opt/mysql@8.4/bin

alias v="nvim"
alias n=v
alias z="zoxide"
alias c="clear"

starship init fish | source

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/quike/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)