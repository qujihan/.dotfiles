#!/bin/bash
find . -name ".DS_Store" -type f -exec /bin/rm -f {} +

packages=(
  alacritty 
  git 
  hammerspoon 
  ideavim 
  starship 
  tmux 
  vscode 
  # wezterm
  zed
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