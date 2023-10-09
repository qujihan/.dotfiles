# MacOS
```shell
git clone https://github.com/qujihan/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sudo make install # sudo python config.py --install 
sudo make uninstall # sudo python config.py --uninstall
setMac
```

# Windows
```shell
scoop install sudo
git clone https://github.com/qujihan/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sudo make install # sudo python config.py --install 
sudo make uninstall # sudo python config.py --uninstall
```

# Ubuntu
```shell
# export DOTFILE_DEBUG=true
export proxy_url="https://mirror.ghproxy.com"
export base_url="https://raw.githubusercontent.com/qujihan/.dotfiles/main"
export util_path="${HOME}/.config/shell"
mkdir -p ${util_path}
curl -Lo ${util_path}/utils.sh ${proxy_url}/${base_url}/initscript/ubuntu/utils.sh 
```

```shell
# git
curl ${proxy_url}/${base_url}/initscript/ubuntu/git.sh | bash

# shell
curl ${proxy_url}/${base_url}/initscript/ubuntu/shell.sh | bash

# tmux
curl ${proxy_url}/${base_url}/initscript/ubuntu/tmux.sh | bash
```

``` shell
# delete backup file
rm *.backup-*
```
# Note
- Font
    - wezterm/alacritty/starship/vscode ... use [FiraCode(font)](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip)
