#!/usr/bin/env bash
if [ -n "$DOTFILE_DEBUG" ]; then
    set -ex
fi
source ${HOME}/.config/shell/utils.sh

tmux_download_url="${proxy_url}/${github_url}/main/tmux/.tmux.conf"
tmux_path="${HOME}/.tmux.conf"
config_backup_and_download "${tmux_download_url}" "${tmux_path}"