# Shell中较为常见的一些快捷键
## Emacs
```bash
ctrl+a 回到行首
ctrl+e 回到行尾
```

## fzf
https://github.com/junegunn/fzf?tab=readme-ov-file#key-bindings-for-command-line
```bash
ctrl+t 将选定的文件和目录粘贴到命令行上
ctrl+r 将选定的历史记录粘贴到命令行上
alt +c 进入选定的目录
```

## direnv
创建文件名为`.envrc`
```bash
# 载入配置文件
direnv allow .
# 停止载入配置文件
direnv deny .
# 重新加载配置文件
direnv reload
# 查看配置文件状态
direnv status
```

## tmux
[Tmux](../tmux/README.md)