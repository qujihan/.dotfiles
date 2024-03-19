# zsh_config

# use vim
set -o vi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Ignore lower upper                                                          │
#╰──────────────────────────────────────────────────────────────────────────────╯
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Theme                                                                       │
#│  brew install starship                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
eval "$(starship init zsh)"

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Clash proxy                                                                 │  
#╰──────────────────────────────────────────────────────────────────────────────╯
proxy(){
    export https_proxy=http://127.0.0.1:7890 
    export http_proxy=http://127.0.0.1:7890 
    export all_proxy=http://127.0.0.1:7890
}

unproxy(){
    unset https_proxy
    unset http_proxy
    unset all_proxy
}

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Rust                                                                        │  
#╰──────────────────────────────────────────────────────────────────────────────╯
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.rustup/toolchains/stable-aarch64-apple-darwin/bin 
alias cargoc="rm -rf ~/.cargo/.package-cache"

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Golang                                                                      │  
#╰──────────────────────────────────────────────────────────────────────────────╯
export PATH=$PATH:~/go/bin
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
go env -w GOSUMDB=sum.golang.google.cn

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Alias                                                                       │  
#╰──────────────────────────────────────────────────────────────────────────────╯
alias pp="proxy"
alias up="unproxy"
alias vi="nvim"
alias ndev="nvim +\"set rtp+=./\""
alias ee="exit"
alias cl="clear"
alias la="ls -a"
alias ll="ls -l"
#python
alias python="python3"
alias pip="python3 -m pip"
# rust
alias cb="cargo build"
alias cr="cargo run"
# golang
alias gb="go build"
alias gr="go run"
# podman
alias docker="podman"
# deprecated function -_-
alias rm="trash -F"
# tmux 
alias tm="tmux"
alias tr="tmux source-file ~/.tmux.conf"
alias ta="tmux attach -t"
