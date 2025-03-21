# MacOS or Ubuntu
```shell
git clone https://github.com/qujihan/.dotfiles.git ~/.dotfiles; cd ~/.dotfiles
make download; make link
./initscript/.macos --set
```

# Windows
```shell
scoop install sudo
git clone https://github.com/qujihan/.dotfiles.git ~/.dotfiles; cd ~/.dotfiles
make download_win; make link
```


# Font
- [FiraCode](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip)
    - `brew install font-fira-code-nerd-font`
    - `scoop install nerd-fonts/FiraCode-NF-Mono`
- [Cascadia Code](https://github.com/microsoft/cascadia-code)
    - `brew install font-cascadia-mono`
    - `scoop install nerd-fonts/CascadiaCode-NF-Mono`
