zmodload zsh/zprof
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
config_path="${HOME}/.config/shell"
if [ -f ${config_path}/mac.sh ]; then 
    source ${config_path}/mac.sh
fi