if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading alias_mac"
fi

if [ -f $HOME/.config/sh/alias_base.sh ]; then
    source $HOME/.config/sh/alias_base.sh
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  MacOS Alias                                                                 │
#╰──────────────────────────────────────────────────────────────────────────────╯
# facility
alias dotf="code ${HOME}/.dotfiles" # bashnot

# deprecated function -_-
alias drm="/bin/rm" # bashnot
alias rm="trash -F" # bashnot