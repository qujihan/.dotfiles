#!/bin/bash
filename=".tmux.conf"
filepath=~/$filename


ghproxy="https://mirror.ghproxy.com/"
url="https://raw.githubusercontent.com/qujihan/.dotfiles/main/tmux/.tmux.conf"

if [ -f $filepath ]; then
    if [ -f $filepath.bak ]; then
        echo "remove old config file(*.bak)"
        rm $filepath.bak
    fi
    echo "backup old config file(*.bak)"
    mv $filepath $filepath.bak
fi

curl --proto '=https' --tlsv1.2 -sSf $ghproxy/$url -o $filepath
tmux source-file $filepath