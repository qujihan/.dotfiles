if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading env"
fi
#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Rust                                                                        │
#╰──────────────────────────────────────────────────────────────────────────────╯
export PATH=$PATH:${HOME}/.cargo/bin
export PATH=$PATH:${HOME}/.rustup/toolchains/*/bin 
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Golang                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
if command -v go &>/dev/null; then 
    export PATH=$PATH:${HOME}/go/bin
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct
    go env -w GOSUMDB=sum.golang.google.cn
fi
