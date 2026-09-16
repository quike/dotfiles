function brewdump --description "Dump installed Homebrew packages to the Brewfile"
    argparse h/help -- $argv; or return 1

    if set -q _flag_help
        __brewdump_usage
        return 0
    end

    if not type -q brew
        echo "brewdump: brew is not installed" >&2
        return 1
    end

    set -l dotfiles $DOTFILES
    test -z "$dotfiles"; and set dotfiles "$HOME/.dotfiles"

    if not test -d "$dotfiles"
        echo "brewdump: no dotfiles repo at $dotfiles (override with \$DOTFILES)" >&2
        return 1
    end

    # Resolve the stow symlink so the dump rewrites the file in the repo
    # rather than replacing the link in $HOME.
    set -l brewfile (path resolve $dotfiles/.config/homebrew/Brewfile)

    # Descriptions are emitted by default; --describe is disabled in Homebrew >= 4.3.
    if not brew bundle dump --force --file=$brewfile
        return 1
    end

    echo "brewdump: wrote $brewfile"
    git -C $dotfiles diff --stat -- $brewfile
end

function __brewdump_usage
    echo "Usage: brewdump [-h|--help]"
    echo
    echo "Rewrites .config/homebrew/Brewfile from the currently installed"
    echo "taps, formulae, casks, Mac App Store apps and VS Code extensions."
    echo
    echo "Set \$DOTFILES to point at the repo if it is not ~/.dotfiles."
end
