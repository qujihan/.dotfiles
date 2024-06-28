if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading alias_base"
fi
#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Alias                                                                       │
#╰──────────────────────────────────────────────────────────────────────────────╯
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