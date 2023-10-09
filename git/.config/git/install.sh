#!/bin/bash
filedir=".config/git/"
filename="config"
filepath=~/$filedir$filename

ghproxy="https://mirror.ghproxy.com/"
url="https://raw.githubusercontent.com/qujihan/.dotfiles/main/git/.config/git/config"

if [ -d "$filedir" ]; then
    if [ -f "$filepath" ]; then
        if [ -f "$filepath.bak" ]; then
            rm "$filepath.bak"
        fi
        mv "$filepath" "$filepath.bak"
    fi
else
    mkdir -p "$filedir"
fi

curl --proto '=https' --tlsv1.2 -sSf $ghproxy/$url -o $filepath