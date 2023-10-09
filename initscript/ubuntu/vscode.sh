#!/usr/bin/env bash
if [ -n "$DOTFILE_DEBUG" ]; then
    set -ex
fi
source ${HOME}/.config/utils/utils.sh

# keybindings
keybindings_download_url="${proxy_url}/https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/Library/Application%20Support/Code/User/keybindings.json"
keybindings_path="${HOME}/Library/Application Support/Code/User/keybindings.json"
config_backup_and_download "$keybindings_download_url" "$keybindings_path" 

# .vscodevimrc
vscodevimrc_download_url="${proxy_url}/https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/.vscodevimrc"
vscodevimrc_path="${HOME}/.vscodevimrc"
config_backup_and_download "$vscodevimrc_download_url" "$vscodevimrc_path" 