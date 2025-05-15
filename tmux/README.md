# tmux 防止遗忘指南
注释: 标注有`*`的表示为自定义快捷键, 需要查看[文件](./.tmux.conf)

Leader表示前导键, 默认为ctrl+b, 表示先按Leader键, 然后按其他键. 

# Shell中建议配置
```shell
alias tm="tmux"
alias tn="tmux new -s"
alias ta="tmux attach -t"
```

# 开始使用tmux
- `tmux new -s session-name`: 以session-name开启一个tmux会话
- `tmux attach -t session-name`: 加入到session-name这个会话中
- `tmux ls`: 显示tmux中所有的会话

# 综合
- `Leader + w`: 显示所有Sessions以及Windows
- `Leader + s`: 显示当前Session以及Windows
- `Leaser + r`: 强制重载当前Session(常用于配置更新)
- `Leader + ?`: 显示所有KeyBindings

# Pane
- `Leader + z`: 最大化当前Pane
- `Leader + !`: 将当前Pane移动到一个新的Window
- `Leader + x`: 关闭Pane
- `Leader + {`: 向前置换当前Pane 
- `Leader + }`: 向后置换当前Pane

# Session
- *`Leader + {h, j, k, l}`: 在左/下/上/右方向新建一个Pane(默认`Leader + {%, "}`)
- `Leader + d`: detach当前Session
- *`Alt + {h, j, k, l}`: 移动到左/下/上/右方向的Pane(默认`Leader + {←, ↓, ↑, →}`)
- *`Alt + s`: 自动排列当前Session的所有Pane(默认`Leader + space`)

# Window
- `Leader + c`: 新建Window
- `Leader + ,`: 重命名Window
- `Leader + .`: 重排号Window
- *`Alt + ,`: 选择左边Window(默认`Leader + p`)
- *`Alt + .`: 选择右边Window(默认`Leader + n`)

# 参考
- [tmux cheat sheet: https://tmuxcheatsheet.com](https://tmuxcheatsheet.com)
- [路易斯/Tmux使用手册](https://louiszhai.github.io/2017/09/30/tmux/)