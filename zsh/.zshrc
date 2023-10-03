#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Theme                                                                       │
#│  brew install starship                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
eval "$(starship init zsh)"

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Clash proxy                                                                 │  
#╰──────────────────────────────────────────────────────────────────────────────╯
export https_proxy=http://127.0.0.1:7890 
export http_proxy=http://127.0.0.1:7890 
export all_proxy=socks5://127.0.0.1:7890

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Cargo and Go                                                                │  
#╰──────────────────────────────────────────────────────────────────────────────╯
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/go/bin

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Alias                                                                       │  
#╰──────────────────────────────────────────────────────────────────────────────╯
alias vi="nvim"
alias ndev="nvim +\"set rtp+=./\""
alias ee="exit"
alias cl="clear"
alias la="ls -a"
alias ll="ls -l"
alias python="python3"
alias pip="python3 -m pip"
alias pod="podman"
alias ser="ssh qujihan@121.48.161.203"