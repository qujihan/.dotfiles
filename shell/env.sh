if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading env"
fi


# Ignore lower/upper
ignore_config(){
    autoload -Uz compinit && compinit -u
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
}

# Starship
# brew install starship
starship_config(){
    eval "$(starship init zsh)"
}

# Homebrew
homebrew_config(){
    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
}

# Rust
rust_config(){
    export PATH=$PATH:$(brew --prefix)/opt/rustup/bin
    export PATH=$PATH:${HOME}/.cargo/bin
    export PATH=$PATH:${HOME}/.rustup/toolchains/*/bin 
    export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
    export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
}

# Golang
golang_config(){
    if command -v go &>/dev/null; then 
        export PATH=$PATH:${HOME}/go/bin
        go env -w GO111MODULE=on
        go env -w GOPROXY=https://goproxy.cn,direct
        go env -w GOSUMDB=sum.golang.google.cn
    fi
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    homebrew_config
    rust_config
    golang_config
    starship_config
    ignore_config
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    rust_config
    golang_config
fi