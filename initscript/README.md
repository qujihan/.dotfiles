# Mac初始化脚本下载
```bash
wget -O - https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/mac.sh | bash
```
# git 配置脚本
```bash
# unix
wget -O - https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/git.sh | bash
# windows
Invoke-RestMethod -Uri https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/git.sh | Invoke-Expression
```
# tmux 配置脚本
```bash
# unix
wget -O - https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/tmux.sh | bash
```
# vscode 配置脚本
```bash
# unix
wget -O - https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/vscode.sh | bash
# windows
Invoke-RestMethod -Uri https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/vscode.ps1 | Invoke-Expression
```
# bash 配置脚本
bash配置是改自zsh
```bash
# unix
wget -O - https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/bash.sh | bash
```
# ideavimrc 配置脚本
```bash
# unix
wget -O - https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/ideavimrc.sh | bash
# windows
Invoke-RestMethod -Uri https://mirror.ghproxy.com/https://raw.githubusercontent.com/qujihan/.dotfiles/main/initscript/ideavimrc.ps1 | Invoke-Expression
```

# windows 需要执行的指令
```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```