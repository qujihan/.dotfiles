#!/usr/bin/env bash
if [ -n "$DOTFILE_DEBUG" ]; then
    set -ex
fi
source ${HOME}/.config/utils/utils.sh

gitconfig_download_url="${proxy_url}/https://raw.githubusercontent.com/qujihan/.dotfiles/main/git/.config/git/config"
gitconfig_path="${HOME}/.config/git/config"
config_backup_and_download "${gitconfig_download_url}" "${gitconfig_path}"



if [ -n "$DOTFILE_DEBUG" ]; then
    echo "hello";
fi