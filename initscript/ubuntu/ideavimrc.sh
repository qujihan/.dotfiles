#!/usr/bin/env bash
if [ -n "$DOTFILE_DEBUG" ]; then
    set -ex
fi
source ${HOME}/.config/utils/utils.sh

ideavimrc_download_url="${proxy_url}/https://raw.githubusercontent.com/qujihan/.dotfiles/main/ideavim/.ideavimrc"
ideavimrc_path="${HOME}/.ideavimrc"
config_backup_and_download "${ideavimrc_download_url}" "${ideavimrc_path}"
