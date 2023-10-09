# use debug
# export DOTFILE_DEBUG=1
#
# disable debug
# unset DOTFILE_DEBUG

# use vim
# set -o vi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Ignore lower/upper                                                          │
#╰──────────────────────────────────────────────────────────────────────────────╯
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Theme                                                                       │
#│  brew install starship                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
eval "$(starship init zsh)"

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Mac Zsh Config                                                              │
#╰──────────────────────────────────────────────────────────────────────────────╯
if [ -f $HOME/.config/sh/mac.sh ]; then 
    source $HOME/.config/sh/mac.sh
fi