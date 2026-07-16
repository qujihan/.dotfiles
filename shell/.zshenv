# Dotfiles only distinguish personal and company-managed environments.
(( ${+DOTFILES_PERSONAL} )) || typeset -gr DOTFILES_PERSONAL="personal"
(( ${+DOTFILES_NON_PERSONAL} )) || typeset -gr DOTFILES_NON_PERSONAL="non_personal"

unproxy() {
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY no_proxy NO_PROXY
}

proxy_status() {
    echo "${http_proxy}"
    echo "${https_proxy}"
    echo "${HTTP_PROXY}"
    echo "${HTTPS_PROXY}"
    echo "${no_proxy}"
    echo "${NO_PROXY}"
}

init_zshenv() {
    local -l zshenv_user="${USER:-${LOGNAME:-}}"
    typeset -g dotfiles_environment="$DOTFILES_PERSONAL"

    [[ "$zshenv_user" == *bytedance* || "$zshenv_user" == "qujihan.qjh" ]] &&
        dotfiles_environment="$DOTFILES_NON_PERSONAL"

    case "$dotfiles_environment" in
        "$DOTFILES_PERSONAL")
            proxy() {
                export http_proxy="http://127.0.0.1:7897"
                export https_proxy="$http_proxy"
                export HTTP_PROXY="$http_proxy"
                export HTTPS_PROXY="$https_proxy"
                # export no_proxy=""
                # export NO_PROXY="$no_proxy"
            }
            ;;
        "$DOTFILES_NON_PERSONAL")
            [[ -r "$HOME/.bytedance" ]] && source "$HOME/.bytedance"
            ;;
    esac
}

init_zshenv
