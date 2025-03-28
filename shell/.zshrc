#!/bin/zsh
# Vim
# set -o vi

# Homebrew auto update
# export HOMEBREW_NO_AUTO_UPDATE=1
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
if [ ! "${OS}" = "darwin" ]; then
    export LC_ALL="C.utf8"
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Plugin                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
# apt install -y zsh-syntax-highlighting zsh-autosuggestions
if command -v apt &>/dev/null; then
    APT_PREFIX="/usr/share/"

    # zsh-syntax-highlighting
    plugin_path="${APT_PREFIX}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    if [ -f ${plugin_path} ]; then
        source ${plugin_path}
    fi

    # zsh-autosuggestions
    # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
    plugin_path="${APT_PREFIX}/zsh-autosuggestions/zsh-autosuggestions.zsh"
    if [ -f ${plugin_path} ]; then
        source ${plugin_path}
    fi

    # ignore letter lower and upper
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
fi

# brew install zsh-syntax-highlighting zsh-autopair zsh-autosuggestions zsh-autocomplete
if command -v brew &>/dev/null; then
    BREW_PREFIX="/opt/homebrew"
    BREW_PREFIX=$(brew --prefix)

    # zsh-syntax-highlighting
    plugin_path="${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    if [ -f ${plugin_path} ]; then
        source ${plugin_path}
    fi

    # zsh-autopair
    plugin_path="${BREW_PREFIX}/share/zsh-autopair/autopair.zsh"
    if [ -f ${plugin_path} ]; then
        source ${plugin_path}
    fi

    # zsh-autosuggestions
    # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
    plugin_path="${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    if [ -f ${plugin_path} ]; then
        source ${plugin_path}
    fi

    # zsh-autocomplete
    # plugin_path="${BREW_PREFIX}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
    # if [ -f ${plugin_path} ]; then
    #     source ${plugin_path}
    # fi

    # ignore letter lower and upper
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Util Function                                                               │
#╰──────────────────────────────────────────────────────────────────────────────╯
export bytedance_macos_uuid="C8429192-B5D4-5789-93BB-011FE9953A41"
is_bytedance_macos() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        hardware_uuid=$(system_profiler SPHardwareDataType | awk '/Hardware UUID:/ { print $3 }')
        if [[ "$hardware_uuid" == "$bytedance_macos_uuid" ]]; then
            return true
        fi
    fi
    return false
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Env Set                                                                     │
#╰──────────────────────────────────────────────────────────────────────────────╯
# Starship
# brew install starship
starship_config() {
    if command -v starship &>/dev/null; then
        if [ -n "$ZSH_VERSION" ]; then
            eval "$(starship init zsh)"
        elif [ -n "$BASH_VERSION" ]; then
            eval "$(starship init bash)"
        fi
    fi
}

# Homebrew
homebrew_config() {
    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
}

# Rust
rust_config() {
    if command -v brew &>/dev/null; then
        export PATH=$PATH:$(brew --prefix)/opt/rustup/bin
    fi

    if [ -d "${HOME}/.rustup" ]; then
        export PATH=$PATH:${HOME}/.rustup/toolchains/*/bin
    fi

    if [ -d "${HOME}/.cargo" ]; then
        export PATH=$PATH:${HOME}/.cargo/bin
    fi

    # export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
    # export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
}

# Golang
golang_config() {
    export PATH=$PATH:${HOME}/go/bin
    go env -w GO111MODULE=on
    go env -w GOSUMDB=sum.golang.google.cn
    if is_bytedance_macos; then
        # todo
    else
        go env -w GOPROXY=https://goproxy.cn,direct
    fi
}

# Goenv
goenv_config() {
    eval "$(goenv init -)"
    if command -v go &>/dev/null; then
        golang_config
    fi
}

# fzf
fzf_config() {
    source <(fzf --zsh)
}

# eza
eza_config() {
    export EZA_COLORS="di=37"
}

kubectl_config() {
    if [ -n "$ZSH_VERSION" ]; then
        source <(kubectl completion zsh)
    fi
}

env_set() {
    if command -v fzf &>/dev/null; then
        fzf_config
    fi

    if command -v eza &>/dev/null; then
        eza_config
    fi

    if command -v starship &>/dev/null; then
        starship_config
    fi

    if command -v brew &>/dev/null; then
        homebrew_config
    fi

    if command -v rustup &>/dev/null; then
        rust_config
    fi

    if command -v goenv &>/dev/null; then
        goenv_config
    elif command -v go &>/dev/null; then
        golang_config
    fi

    if command -v kubectl &>/dev/null; then
        kubectl_config
    fi
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Define Function                                                             │
#╰──────────────────────────────────────────────────────────────────────────────╯
if [[ "$OSTYPE" == "darwin"* ]]; then
    proxy_ip="127.0.0.1"
    proxy_port="7897"
    proxy() {
        export https_proxy=${proxy_ip}:${proxy_port}
        export http_proxy=${proxy_ip}:${proxy_port}
        export all_proxy=${proxy_ip}:${proxy_port}
    }

    unproxy() {
        unset https_proxy
        unset http_proxy
        unset all_proxy
    }
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Alias                                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
alias_pairs=(
    "ee exit"

    # facility
    "ls eza --icons"
    "la ls -a --icons"
    "ll ls -l"
    "lla ls -a -l"

    "man tldr"
    "watch viddy"
    "cloc loc"
    "df duf"
    "tree eza --tree"
    "cat bat"
    "top btm -b"
    "diff difft"

    # python
    "python python3"
    "pip pip3"

    # rust
    "cb cargo build"
    "cr cargo run"

    # golang
    "gb go build"
    "gr go run"

    # tmux
    "tm tmux"
    "ta tmux attach -t"

    # zellij
    "z zellij"

    # porxy
    "pp proxy"
    "up unproxy"
)

# c/cpp
alias cmakeb="cmake -B build -S."
alias cmakec="cmake --build build"
# config
alias dotc="code ${HOME}/.dotfiles"
alias rimec="code ${HOME}/Library/Rime"
# env
alias epath='echo $PATH | tr ":" "\n" | sort'
alias essh="cat ${HOME}/.ssh/config"

alias_set() {
    for pair in "${alias_pairs[@]}"; do
        alias_left=${pair%% *}
        alias_right=${pair#* }
        command=${alias_right%% *}

        if command -v "$command" &>/dev/null; then
            alias "$alias_left"="$alias_right"
        fi
    done
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Config                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
shell_set() {
    autoload -Uz compinit && compinit -u
    env_set
    alias_set
    if [ -f "$HOME/.zsh_temp" ]; then
        source "$HOME/.zsh_temp"
    fi
}

shell_set
