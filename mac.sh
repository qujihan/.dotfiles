#!/bin/bash

# packages=(alacritty git wezterm zsh ideavim vscode starship nushell) 
packages=(git zsh vscode starship tmux hammerspoon ideavim) 

if [ "$1" == "--install" ]; then
  for package in "${packages[@]}"; do
    stow "$package"
  done
elif [ "$1" == "--uninstall" ]; then
  for package in "${packages[@]}"; do
    stow -D "$package"
  done
else
  echo "Invalid option, use -install or -uninstall"
  exit 1
fi
