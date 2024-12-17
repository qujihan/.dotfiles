#!/usr/bin/env bash
github_url="${proxy_url}https://raw.githubusercontent.com/qujihan/.dotfiles"

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Utils                                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
red="\033[31m"
green="\033[32m"
blue="\033[34m"
reset="\033[0m"

config_backup_and_download() {
    local download_url="$1"
    local file_path="$2"
    mkdir -p "$(dirname "${file_path}")"
    if [ -f "${file_path}" ]; then
        echo "${red}NOTE:${reset} ${file_path} exist , start backup file..."
        cp "${file_path}" "${file_path}.backup-$(date +%Y%m%d-%H%M%S)"
    fi
    echo "${green}Start Download${reset}: ${download_url}"
    curl -L -s ${download_url} -o ${file_path}
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  shell                                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
shell_config() {
    echo "${blue}Start Config shell${reset}"
    shell_url_base="${github_url}/main/shell/"
    shell_save_path_base="${HOME}/.config/shell/"
    mkdir -p ${shell_save_path_base}
    config_backup_and_download "${shell_url_base}.zshrc" "${shell_save_path_base}.zshrc"
    if [ -z "$SHELL_CONFIG_EXIST" ]; then
        shell_config_file="${HOME}/.bashrc"
        if [ "${SHELL}" == "/bin/zsh" ]; then
            shell_config_file="${HOME}/.zshrc"
        fi
        echo 'export SHELL_CONFIG_EXIST=1' >>"${shell_config_file}"
        echo "source ${HOME}/.config/shell/.zshrc" >>"${shell_config_file}"
        source "${shell_config_file}"
    fi
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Tmux                                                                        │
#╰──────────────────────────────────────────────────────────────────────────────╯
tmux_config() {
    echo "${blue}Start Config tmux${reset}"
    tmux_url_base="${github_url}/main/tmux/"
    tmux_save_path_base="${HOME}/"
    mkdir -p ${tmux_save_path_base}
    config_backup_and_download "${tmux_url_base}.tmux.conf" "${tmux_save_path_base}.tmux.conf"
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Git                                                                         │
#╰──────────────────────────────────────────────────────────────────────────────╯
git_config() {
    echo "${blue}Start Config git${reset}"
    git_url_base="${github_url}/main/git/"
    git_save_path_base="${HOME}/.config/git/"
    mkdir -p ${git_save_path_base}
    config_backup_and_download "${git_url_base}config" "${gitsave_path_base}config"
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Main                                                                        │
#╰──────────────────────────────────────────────────────────────────────────────╯
main() {
    shell_done=0
    git_done=0
    tmux_done=0

    while [[ $# -gt 0 ]]; do
        case $1 in
        --shell)
            if [[ $shell_done -eq 0 ]]; then
                shell_config
                shell_done=1
            fi
            shift
            ;;
        --git)
            if [[ $git_done -eq 0 ]]; then
                git_config
                git_done=1
            fi
            shift
            ;;
        --tmux)
            if [[ $tmux_done -eq 0 ]]; then
                tmux_config
                tmux_done=1
            fi
            shift
            ;;
        --all)
            if [[ $shell_done -eq 0 ]]; then
                shell_config
                shell_done=1
            fi
            if [[ $git_done -eq 0 ]]; then
                git_config
                git_done=1
            fi
            if [[ $tmux_done -eq 0 ]]; then
                tmux_config
                tmux_done=1
            fi
            shift
            ;;
        *)
            echo "${red}Invalid option${reset}: $1"
            exit 1
            ;;
        esac
    done
}

main "$@"
