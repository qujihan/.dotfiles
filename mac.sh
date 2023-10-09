#!/bin/bash

packages=(
  alacritty 
  git 
  hammerspoon 
  ideavim 
  starship 
  tmux 
  vscode 
  # wezterm
  zsh
) 

if [ "$1" == "--install" ]; then
  for package in "${packages[@]}"; do
    stow "$package"
  done
elif [ "$1" == "--uninstall" ]; then
  for package in "${packages[@]}"; do
    stow -D "$package"
  done
else
  echo "Invalid option, use --install or --uninstall"
  exit 1
fi