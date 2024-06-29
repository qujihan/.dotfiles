if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading alias_mac"
fi


config_path="${HOME}/.config/shell"

if [ -f ${config_path}/alias_base.sh ]; then
    source ${config_path}/alias_base.sh
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  MacOS Alias                                                                 │
#╰──────────────────────────────────────────────────────────────────────────────╯
# facility
alias dotf="code ${HOME}/.dotfiles"
alias rime="code ${HOME}/Library/Rime"
# deprecated function -_-
alias drm="/bin/rm"
alias rm="trash -F"
# zellij
alias z="zellij"