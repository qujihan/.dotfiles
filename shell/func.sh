if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading function"
fi
#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Clash proxy                                                                 │
#╰──────────────────────────────────────────────────────────────────────────────╯
proxy(){
    export https_proxy=http://127.0.0.1:7897 
    export http_proxy=http://127.0.0.1:7897 
    export all_proxy=http://127.0.0.1:7897
}

unproxy(){
    unset https_proxy
    unset http_proxy
    unset all_proxy
}

alias pp="proxy"
alias up="unproxy"