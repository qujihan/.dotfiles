# MacOS
```shell
brew install stow
git clone https://github.com/qujihan/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/mac.sh
zsh ./mac.sh --install
zsh ./initscript/mac/mac.sh
setMac
```

# Windows
```shell
scoop install sudo
git clone https://github.com/qujihan/.dotfiles.git ~/.dotfiles
sudo  ~/.dotfiles/win.bat
```

# Ubuntu
```shell
# export DOTFILE_DEBUG=true
export proxy_url="https://mirror.ghproxy.com"
export base_url="https://raw.githubusercontent.com/qujihan/.dotfiles/main"
export util_path="${HOME}/.config/utils"
mkdir -p ${util_path}
curl -Lo ${util_path}/utils.sh ${proxy_url}/${base_url}/initscript/ubuntu/utils.sh 
```

```shell
# git
curl ${proxy_url}/${base_url}/initscript/ubuntu/git.sh | bash

# *sh
curl ${proxy_url}/${base_url}/initscript/ubuntu/sh.sh | bash

# tmux
curl ${proxy_url}/${base_url}/initscript/ubuntu/tmux.sh | bash

# vscode
curl ${proxy_url}/${base_url}/initscript/ubuntu/vscode.sh | bash

# ideavim
curl ${proxy_url}/${base_url}/initscript/ubuntu/ideavimrc.sh | bash
```

``` shell
# delete backup file
rm *.backup-*
```
# Note
- Font
    - wezterm/alacritty/starship/vscode ... use [FiraCode(font)](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip)
