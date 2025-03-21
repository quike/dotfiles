
# Copyright (C) 2012-2014 Dmitry Medvinsky <me@dmedvinsky.name>. All Rights Reserved.
# This file is licensed under the GPLv2+. Please see COPYING for more information.

set -l PROG pass

function __fish_pass_get_prefix
    if set -q PASSWORD_STORE_DIR
        realpath -- "$PASSWORD_STORE_DIR"
    else
        echo "$HOME/.password-store"
    end
end

function __fish_pass_needs_command
    [ (count (commandline -opc)) -eq 1 ]
end

function __fish_pass_uses_command
    set -l cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

function __fish_pass_print_gpg_keys
    gpg2 --list-keys | grep uid | sed 's/.*<\(.*\)>/\1/'
end

function __fish_pass_print
    set -l ext $argv[1]
    set -l strip $argv[2]
    set -l prefix (__fish_pass_get_prefix)
    set -l matches $prefix/**$ext
    printf '%s\n' $matches | sed "s#$prefix/\(.*\)$strip#\1#"
end

function __fish_pass_print_entry_dirs
    __fish_pass_print /
end

function __fish_pass_print_entries
    __fish_pass_print ".gpg" ".gpg"
end

function __fish_pass_print_entries_and_dirs
    __fish_pass_print_entry_dirs
    __fish_pass_print_entries
end

function __fish_pass_git_complete
    set -l prefix (__fish_pass_get_prefix)
    set -l git_cmd (commandline -opc) (commandline -ct)
    set -e git_cmd[1 2] # Drop "pass git".
    complete -C"git -C $prefix $git_cmd"
end

complete -c $PROG -f -n __fish_pass_needs_command -a help -d 'Command: show usage help'
complete -c $PROG -f -n __fish_pass_needs_command -a version -d 'Command: show program version'

complete -c $PROG -f -n __fish_pass_needs_command -a init -d 'Command: initialize new password storage'
complete -c $PROG -f -n '__fish_pass_uses_command init' -s p -l path -d 'Assign gpg-id for specified sub folder of password store'

complete -c $PROG -f -n __fish_pass_needs_command -a ls -d 'Command: list passwords'
complete -c $PROG -f -n '__fish_pass_uses_command ls' -a "(__fish_pass_print_entry_dirs)"

complete -c $PROG -f -n __fish_pass_needs_command -a insert -d 'Command: insert new password'
complete -c $PROG -f -n '__fish_pass_uses_command insert' -s e -l echo -d 'Echo the password on console'
complete -c $PROG -f -n '__fish_pass_uses_command insert' -s m -l multiline -d 'Provide multiline password entry'
complete -c $PROG -f -n '__fish_pass_uses_command insert' -s f -l force -d 'Do not prompt before overwritting'
complete -c $PROG -f -n '__fish_pass_uses_command insert' -a "(__fish_pass_print_entry_dirs)"

complete -c $PROG -f -n __fish_pass_needs_command -a generate -d 'Command: generate new password'
complete -c $PROG -f -n '__fish_pass_uses_command generate' -s n -l no-symbols -d 'Do not use special symbols'
complete -c $PROG -f -n '__fish_pass_uses_command generate' -s c -l clip -d 'Put the password in clipboard'
complete -c $PROG -f -n '__fish_pass_uses_command generate' -s f -l force -d 'Do not prompt before overwritting'
complete -c $PROG -f -n '__fish_pass_uses_command generate' -s i -l in-place -d 'Replace only the first line with the generated password'
complete -c $PROG -f -n '__fish_pass_uses_command generate' -a "(__fish_pass_print_entry_dirs)"

complete -c $PROG -f -n __fish_pass_needs_command -a mv -d 'Command: rename existing password'
complete -c $PROG -f -n '__fish_pass_uses_command mv' -s f -l force -d 'Force rename'
complete -c $PROG -f -n '__fish_pass_uses_command mv' -a "(__fish_pass_print_entries_and_dirs)"

complete -c $PROG -f -n __fish_pass_needs_command -a cp -d 'Command: copy existing password'
complete -c $PROG -f -n '__fish_pass_uses_command cp' -s f -l force -d 'Force copy'
complete -c $PROG -f -n '__fish_pass_uses_command cp' -a "(__fish_pass_print_entries_and_dirs)"

complete -c $PROG -f -n __fish_pass_needs_command -a rm -d 'Command: remove existing password'
complete -c $PROG -f -n '__fish_pass_uses_command rm' -s r -l recursive -d 'Remove password groups recursively'
complete -c $PROG -f -n '__fish_pass_uses_command rm' -s f -l force -d 'Force removal'
complete -c $PROG -f -n '__fish_pass_uses_command rm' -a "(__fish_pass_print_entries_and_dirs)"

complete -c $PROG -f -n __fish_pass_needs_command -a edit -d 'Command: edit password using text editor'
complete -c $PROG -f -n '__fish_pass_uses_command edit' -a "(__fish_pass_print_entries)"

complete -c $PROG -f -n __fish_pass_needs_command -a show -d 'Command: show existing password'
complete -c $PROG -f -n '__fish_pass_uses_command show' -s c -l clip -d 'Put password in clipboard'
complete -c $PROG -f -n '__fish_pass_uses_command show' -a "(__fish_pass_print_entries)"
# When no command is given, `show` is defaulted.
complete -c $PROG -f -n __fish_pass_needs_command -s c -l clip -d 'Put password in clipboard'
complete -c $PROG -f -n __fish_pass_needs_command -a "(__fish_pass_print_entries)"
complete -c $PROG -f -n '__fish_pass_uses_command -c' -a "(__fish_pass_print_entries)"
complete -c $PROG -f -n '__fish_pass_uses_command --clip' -a "(__fish_pass_print_entries)"

complete -c $PROG -f -n __fish_pass_needs_command -a git -d 'Command: execute a git command'
complete -c $PROG -f -n '__fish_pass_uses_command git' -a '(__fish_pass_git_complete)'
complete -c $PROG -f -n __fish_pass_needs_command -a find -d 'Command: find a password file or directory matching pattern'
complete -c $PROG -f -n __fish_pass_needs_command -a grep -d 'Command: search inside of decrypted password files for matching pattern'
complete -c $PROG -f -n '__fish_pass_uses_command grep' -a '(begin
    set -l cmd (commandline -opc) (commandline -ct)
    set -e cmd[1 2] # Drop "pass grep".
    complete -C"grep $cmd"
end)'
