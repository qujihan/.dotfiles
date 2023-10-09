if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading alias_unix"
fi

config_path="${HOME}/.config/shell"

if [ -f ${config_path}/alias_base.sh ]; then
    source ${config_path}/alias_base.sh
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Unix Alias                                                                  │
#╰──────────────────────────────────────────────────────────────────────────────╯