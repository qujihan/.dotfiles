if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading alias_unix"
fi

if [ -f $HOME/.config/sh/alias_base.sh ]; then
    source $HOME/.config/sh/alias_base.sh
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Unix Alias                                                                  │
#╰──────────────────────────────────────────────────────────────────────────────╯