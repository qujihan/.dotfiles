# Proxy selection is the Cartesian product of OS and environment ownership.
typeset zshenv_os="unknown"
typeset zshenv_environment="personal"
typeset -l zshenv_user="${USER:-${LOGNAME:-}}"

case "$OSTYPE" in
    darwin*)
        zshenv_os="mac"
        [[ "$zshenv_user" == *bytedance* ]] && zshenv_environment="non_personal"
        ;;
    linux*)
        zshenv_os="linux"
        [[ "$zshenv_user" == *bytedance* || -d /data00 ]] && zshenv_environment="non_personal"
        ;;
esac

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

setup_mac_personal() {
    proxy() {
        export http_proxy="http://127.0.0.1:7897"
        export https_proxy="$http_proxy"
        export HTTP_PROXY="$http_proxy"
        export HTTPS_PROXY="$https_proxy"
        # export no_proxy=""
        # export NO_PROXY="$no_proxy"
    }
}

setup_mac_non_personal() {
    proxy() {
    }
}

setup_linux_personal() {
    proxy() {
    }
}

case "${zshenv_os}:${zshenv_environment}" in
    mac:personal)
        setup_mac_personal
        ;;
    mac:non_personal)
        setup_mac_non_personal
        ;;
    linux:personal)
        setup_linux_personal
        ;;
    linux:non_personal)
        if [[ -r "$HOME/.bytedance_env" ]]; then
            source "$HOME/.bytedance_env"
        fi
        ;;
esac

unset zshenv_os zshenv_environment zshenv_user
