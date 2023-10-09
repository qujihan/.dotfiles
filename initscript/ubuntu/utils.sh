#!/usr/bin/env bash
export github_url="https://raw.githubusercontent.com/qujihan/.dotfiles"

config_backup_and_download() {
    local download_url="$1"
    local file_path="$2"
    mkdir -p "$(dirname "${file_path}")"
    if [ -f "${file_path}" ]; then
        echo "${file_path} exist, start backup file..."
        cp "${file_path}" "${file_path}.backup-$(date +%Y%m%d-%H%M%S)"
    fi
    echo "download $(basename "${download_url}")"
    curl -s ${download_url} -o ${file_path}
    if [ $? -ne 0 ]; then
        echo "download ${basename "${download_url}"} failed."
        exit 1
    fi
}