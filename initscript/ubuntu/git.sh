#!/usr/bin/env bash
if [ -n "$DOTFILE_DEBUG" ]; then
    set -ex
fi
source ${HOME}/.config/shell/utils.sh

gitconfig_download_url="${proxy_url}/${github_url}/main/git/config"
gitconfig_path="${HOME}/.config/git/config"
config_backup_and_download "${gitconfig_download_url}" "${gitconfig_path}"