set __keepup_current_version '1.0.0'

function __keepup_version -d "prints keepup version"
    echo $__keepup_current_version
end

function __keepup_print_help -d "prints keepup help"
    echo "usage: keepup (version | help)"
end

function __keepup_print_action -d "prints keepup action"
    set_color green
    echo -e "\n $argv[1] \n"
    set_color normal
end

function __keepup_update_brew -d "keepup update brew dependencies"
    __keepup_print_action "keepup -> homebrew : brew update && brew upgrade && brew cleanup"
    brew update && brew upgrade && brew upgrade --cask && brew cleanup
end

function __keepup_update_fisher -d "keepup update"
    __keepup_print_action "keepup -> fisher : fisher update"
    fisher update
end

function __keepup_update_ohmyfish -d "keepup update oh-my-fish"
    __keepup_print_action "keepup -> oh-my-fish : omf update && omf reload \n"
    omf update && omf reload
end

function __keepup_update_all -d "keepup update all systems"
    __keepup_update_brew
    __keepup_update_fisher
    __keepup_update_ohmyfish
end

function __keepup_autocomplete
    complete -ec keepup
    complete -xc keepup -n __fish_use_subcommand -a --help -d "Show usage help"
    complete -xc keepup -n __fish_use_subcommand -a --version -d Version
    for pkg in (keepup ls)
        complete -xc keepup -n "__fish_seen_subcommand_from rm" -a $pkg
    end
end

function __keeup::dim
    set_color 555 ^ /dev/null
end

function __keeup::off
    set_color normal ^ /dev/null
end

function keepup -d "keepup update dependencies"

    set -l sub_args ""

    switch (count $argv)
        case 0
            __keepup_update_all
            return 1
        case 1
        case '*'
            set sub_args $argv[2..-1]
    end

    switch $argv[1]
        case version -v --version
            __keepup_version
        case help -h --help
            __keepup_print_help
            return 0
        case complete --complete
            __keepup_autocomplete
        case "*"
            __keepup_print_help
            return 1
    end

    complete -c keep -s a -l auth -a "yes no"

end
