#!/bin/zsh
BYTEDANCE_SCRIPT_PATH="${HOME}/.bytedance"

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Util Function                                                               │
#╰──────────────────────────────────────────────────────────────────────────────╯
is_macos() { [[ "$OSTYPE" == "darwin"* ]]; }
source_if_exists() { [ -f "$1" ] && source "$1"; }
export_path_if_exists() { [ -d "$1" ] && export PATH="$PATH:$1"; }
command_exists() { command -v "$1" &>/dev/null; }
is_bytedance_macos() {
    is_macos || return false
    local bytedance_macos_uuid="C8429192-B5D4-5789-93BB-011FE9953A41"
    [[ $(system_profiler SPHardwareDataType | awk '/Hardware UUID:/ { print $3 }') == "$bytedance_macos_uuid" ]]
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Zsh Plugin                                                                  │
#╰──────────────────────────────────────────────────────────────────────────────╯
# apt install -y zsh-syntax-highlighting zsh-autosuggestions
# brew install zsh-syntax-highlighting zsh-autopair zsh-autosuggestions zsh-autocomplete
zsh_plugins_source() {
    command_exists brew && PLUGIN_DIR=$(brew --prefix) || {command_exists apt && PLUGIN_DIR="/usr/share/" || return}

    # zsh-syntax-highlighting
    source_if_exists "${PLUGIN_DIR}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    # zsh-autopair
    source_if_exists "${PLUGIN_DIR}/share/zsh-autopair/autopair.zsh"
    # zsh-autosuggestions
    # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
    source_if_exists "${PLUGIN_DIR}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    # zsh-autocomplete
    # source_if_exists "${PLUGIN_DIR}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Env Set                                                                     │
#╰──────────────────────────────────────────────────────────────────────────────╯
env_set() {
    export_path_if_exists /home/linuxbrew/.linuxbrew/bin # linux homebrew
    is_macos && export EDITOR=vim
    ! is_macos && export LC_ALL="C.utf8"
    command_exists fzf && source <(fzf --zsh)
    command_exists eza && export EZA_COLORS="di=37"
    command_exists starship && eval "$(starship init zsh)"
    command_exists docker && source <(docker completion zsh)
    command_exists kubectl && source <(kubectl completion zsh)
    command_exists helm && source <(helm completion zsh)
    command_exists direnv && eval "$(direnv hook zsh)"
    command_exists brew &&
        export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api" &&
        export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles" &&
        export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git" &&
        export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git" &&
        export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
    command_exists rustup &&
        # export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup &&
        # export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup &&
        export_path_if_exists $(brew --prefix)/opt/rustup/bin &&
        export_path_if_exists ${HOME}/.cargo/bin
    command_exists go &&
        export_path_if_exists ${HOME}/go/bin &&
        go env -w GO111MODULE=on &&
        go env -w GOSUMDB=sum.golang.google.cn &&
        go env -w GOPROXY=https://goproxy.cn,direct &&
        is_bytedance_macos && source_if_exists ${BYTEDANCE_SCRIPT_PATH}
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Define Function                                                             │
#╰──────────────────────────────────────────────────────────────────────────────╯
if is_macos; then
    local proxy_ip="127.0.0.1" && local proxy_port="7897" && local url=${proxy_ip}:${proxy_port}
    proxy() { export https_proxy=${url} && export http_proxy=${url} && export all_proxy=${url}; }
    unproxy() { unset https_proxy && unset http_proxy && unset all_proxy; }
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Alias                                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
local alias_pairs=(
    # facility utils
    "ee exit" "ls eza --icons" "la ls -a --icons" "ll ls -l" "lla ls -a -l"
    "man tldr" "watch viddy" "cloc loc" "df duf" "tree eza --tree" "cat bat" "top btm -b" "diff difft"
    # program language
    "python python3" "pip pip3" "cb cargo build" "cr cargo run" "gb go build" "gr go run"
    # tmux && zellij
    "tm tmux" "ta tmux attach -t" "ze zellij"
)

alias_set() {
    for pair in "${alias_pairs[@]}"; do
        alias_left=${pair%% *}
        alias_right=${pair#* }
        command=${alias_right%% *}
        command_exists "$command" && alias "$alias_left"="$alias_right"
    done

    # c/cpp
    alias cmakeb="cmake -B build -S."
    alias cmakec="cmake --build build"
    # config
    is_macos && alias dotc="cd ${HOME}/.dotfiles && code ${HOME}/.dotfiles"
    is_macos && alias rimec="cd ${HOME}/Library/Rime && code ${HOME}/Library/Rime"
    # env
    is_macos && alias epath='echo $PATH | tr ":" "\n" | sort'
    is_macos && alias essh="cat ${HOME}/.ssh/config"
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Config                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
shell_set() {
    autoload -Uz compinit && compinit -u
    zsh_plugins_source
    env_set
    alias_set
}

shell_set
