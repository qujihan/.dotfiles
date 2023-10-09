#!/bin/bash
magic_str="# zsh_config"

filename="/.bashrc"
curlname="/.zshrc"
filepath=~/$filename
curlfilepath=~/$curlname


ghproxy="https://mirror.ghproxy.com/"
url="https://raw.githubusercontent.com/qujihan/.dotfiles/main/zsh/.zshrc"

if grep -q $magic_str "$filepath"; then
    echo "$magic_str found. Stopping."
    exit 1
fi

curl --proto '=https' --tlsv1.2 -sSf $ghproxy/$url -o $curlfilepath

echo $magic_str >> $filepath
while IFS= read -r line; do
    if [[ $line == alias* ]]; then
        echo "$line" >> $filepath
    fi
done < "$curlfilepath"

rm -f $curlfilepath
source $filepath