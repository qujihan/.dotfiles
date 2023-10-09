# How to use (MacOS and Linux)
```shell
brew install stow
git clone --recurse-submodules https://github.com/qujihan/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/mac.sh -install
```

# How to use (Windows)
```shell
scoop install sudo
git clone --recurse-submodules https://github.com/qujihan/.dotfiles.git ~/.dotfiles
sudo  ~/.dotfiles/win.bat
```
Note: wezterm/alacritty use the font of `FiraCode Nerd Font Mono`, it can download at [Firacode](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip)

# Use it quickly in ubuntu
- git
```shell
curl --proto '=https' --tlsv1.2 -sSf https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/git/.config/git/install.sh | sh
```

- zsh/bash
```shell
curl --proto '=https' --tlsv1.2 -sSf https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/zsh/install.sh | sh
```

- tmux
```shell
curl --proto '=https' --tlsv1.2 -sSf https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/tmux/install.sh | sh
```

<!-- curl -LO https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/vscode -->