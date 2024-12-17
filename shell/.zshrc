#!/bin/zsh
# Vim
# set -o vi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Env Set                                                                     │
#╰──────────────────────────────────────────────────────────────────────────────╯
# Ignore lower/upper
ignore_config() {
    autoload -Uz compinit && compinit -u
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
}

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
    export PATH=$PATH:${HOME}/.cargo/bin
    export PATH=$PATH:${HOME}/.rustup/toolchains/*/bin
    export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
    export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
}

# Golang
golang_config() {
    export PATH=$PATH:${HOME}/go/bin
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct
    go env -w GOSUMDB=sum.golang.google.cn
}

# fzf
fzf_config() {
    source <(fzf --zsh)
}

env_set() {
    if command -v autoload &>/dev/null && command -v compinit &>/dev/null && command -v zstyle &>/dev/null; then
        ignore_config
    fi

    if command -v fzf &>/dev/null; then
        fzf_config
    fi

    if command -v starship &>/dev/null; then
        starship_config
    fi

    if command -v brew &>/dev/null; then
        homebrew_config
    fi

    if command -v rustc &>/dev/null; then
        rust_config
    fi

    if command -v go &>/dev/null; then
        golang_config
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

    # python
    "python python3"
    "pip python3 -m pip"

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

    # code
    "dotf code ${HOME}/.dotfiles"
    "rime code ${HOME}/Library/Rime"
)

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
#│  Plugin                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
# brew install zsh-syntax-highlighting zsh-autopair zsh-autosuggestions zsh-autocomplete
if command -v brew &>/dev/null; then
    BREW_PREFIX="/opt/homebrew"
    # BREW_PREFIX=$(brew --prefix)

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
    plugin_path="${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    if [ -f ${plugin_path} ]; then
        source ${plugin_path}
    fi

    # zsh-autocomplete
    # plugin_path="${BREW_PREFIX}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
    # if [ -f ${plugin_path} ]; then
    #     source ${plugin_path}
    # fi
fi


#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Config                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
shell_set(){
    env_set
    alias_set
}

shell_set