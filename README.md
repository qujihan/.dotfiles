# MacOS
```shell
git clone https://github.com/qujihan/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sudo make install # sudo python config.py --install 
sudo make uninstall # sudo python config.py --uninstall
./initscript/.macos --set
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
curl -L ${proxy_url}/${base_url}/initscript/ubuntu/git.sh | bash

# shell
curl -L ${proxy_url}/${base_url}/initscript/ubuntu/shell.sh | bash

# tmux
curl -L ${proxy_url}/${base_url}/initscript/ubuntu/tmux.sh | bash
```

``` shell
# delete backup file
rm *.backup-*
```
# Font
- [FiraCode](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip)
    - `brew install font-fira-code-nerd-font`
    - `scoop install nerd-fonts/FiraCode-NF-Mono`
- [Cascadia Code](https://github.com/microsoft/cascadia-code)
    - `brew install font-cascadia-mono`
    - `scoop install nerd-fonts/CascadiaCode-NF-Mono`
