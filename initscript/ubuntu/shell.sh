#!/usr/bin/env bash
if [ -n "$DOTFILE_DEBUG" ]; then
    set -ex
fi
source ${HOME}/.config/shell/utils.sh

sh_download_url_base="${proxy_url}/${github_url}/main/shell/"
sh_save_path_base="${HOME}/.config/shell/"

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

echo "source \$HOME/.config/shell/unix.sh" >> "${HOME}/.bashrc"
source "${HOME}/.bashrc"