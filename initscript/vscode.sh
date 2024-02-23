#!/usr/bin/env bash
# 配置 vscode vim
# .vscodevimrc url: https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/.vscodevimrc

# 配置 vscode keybindings.json
# keybindings.json url: https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/Library/Application%20Support/Code/User/keybindings.json

proxy_url="https://mirror.ghproxy.com"
keybindings_url="https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/Library/Application%20Support/Code/User/keybindings.json"
vimrc_url="https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/.vscodevimrc"
keybingings_download_url=${proxy_url}/${keybindings_url}
vimrc_download_url=${proxy_url}/${vimrc_url}

keybindings_path=""
if [ $# -gt 0 ]; then
    keybindings_path="$1"
else
    keybindings_path="${HOME}/Library/Application Support/Code/User/keybindings.json"
fi
vimrc_path="${HOME}/.vscodevimrc"

backup_config_file() {
    local config_path=$1

    if [ -f "${config_path}" ]; then
        if [ -f "${config_path}.script.bak" ]; then
            echo "remove old config file (*.script.bak) for ${config_path}"
            rm "${config_path}.script.bak"
        fi
        echo "backup old config file (*.script.bak) for ${config_path}"
        mv "${config_path}" "${config_path}.script.bak"
    fi
}

download_config_file(){
    local download_url=$1
    local config_path=$2
    wget --https-only --secure-protocol=TLSv1_2 -O "${config_path}" "${download_url}"
}

config(){
    local download_url=$1
    local config_path=$2
    backup_config_file "${config_path}"
    download_config_file "${download_url}" "${config_path}"
}

config "${keybingings_path}" "${keybindings_download_url}"
config "${vimrc_path}" "${vimrc_download_url}"