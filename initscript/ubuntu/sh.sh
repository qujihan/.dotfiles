#!/usr/bin/env bash
if [ -n "$DOTFILE_DEBUG" ]; then
    set -ex
fi
source ${HOME}/.config/utils/utils.sh

sh_download_url_base="${proxy_url}/https://raw.githubusercontent.com/qujihan/.dotfiles/main/zsh/.config/sh/"
sh_save_path_base="${HOME}/.config/sh/"

mkdir -p "${sh_save_path_base}"
filelist=(
    func.sh
    env.sh
    alias_base.sh
    alias_unix.sh
    unix.sh
)

for filename in ${filelist[@]}; do
    download_url="${sh_download_url_base}${filename}"
    save_path="${sh_save_path_base}${filename}"
    config_backup_and_download "${download_url}" "${save_path}"
done

echo "source \$HOME/.config/sh/unix.sh" >> "${HOME}/.bashrc"
source "${HOME}/.bashrc"