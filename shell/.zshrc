# Debug script
# export DOTFILE_DEBUG=1
# unset DOTFILE_DEBUG

# Vim
# set -o vi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Config                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
config_path="${HOME}/.config/shell"

common_config(){
    # Env
    if [ -f ${config_path}/env.sh ]; then
        source ${config_path}/env.sh
    fi

    # Alias
    if [ -f ${config_path}/alias.sh ]; then
        source ${config_path}/alias.sh
    fi
}

macos_config(){
    common_config

    # Plugin
    if [ -f ${config_path}/plugin.sh ]; then
        source ${config_path}/plugin.sh
    fi
}

linux_config(){
    common_config
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    macos_config
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux_config
else
    echo "Unknown OS"
fi