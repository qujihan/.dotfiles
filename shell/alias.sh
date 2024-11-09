if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading alias"
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Clash Function                                                              │
#╰──────────────────────────────────────────────────────────────────────────────╯

# proxy_ip
if [[ $(uname -a) == *WSL* ]]; then
    # WSL
    proxy_ip=$(awk '/nameserver/ {print $2}' /etc/resolv.conf)
else
    proxy_ip="127.0.0.1"
fi

# proxy_port
proxy_port="7897"

proxy(){
    export https_proxy=${proxy_ip}:${proxy_port}
    export http_proxy=${proxy_ip}:${proxy_port} 
    export all_proxy=${proxy_ip}:${proxy_port}
}

unproxy(){
    unset https_proxy
    unset http_proxy
    unset all_proxy
}


#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Alias                                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
common_alias(){
    # basic
    alias ee="exit"
    alias la="ls -a"
    alias ll="ls -l"
    alias lla="ls -a -l"

    # python
    alias python="python3"
    alias pip="python3 -m pip"

    # rust
    alias cb="cargo build"
    alias cr="cargo run"

    # golang
    alias gb="go build"
    alias gr="go run"

    # tmux
    alias tm="tmux"
    alias ta="tmux attach -t"
}

macos_alias(){
    common_alias

    # facility
    alias dotf="code ${HOME}/.dotfiles"
    alias rime="code ${HOME}/Library/Rime"

    alias cle="clear"

    # deprecated function -_-
    # alias drm="/bin/rm"
    # alias rm="trash -F"

    # zellij
    alias z="zellij"

    alias pp="proxy"
    alias up="unproxy"
}


linux_alias(){
    common_alias
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    macos_alias
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux_alias
fi