if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading plugin"
fi
#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Plugin                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
# brew install zsh-syntax-highlighting zsh-autopair zsh-autosuggestions zsh-autocomplete

# zsh-syntax-highlighting
plugin_path="$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f ${plugin_path} ]; then
    source ${plugin_path}
fi

# zsh-autopair
plugin_path="$(brew --prefix)/share/zsh-autopair/autopair.zsh"
if [ -f ${plugin_path} ]; then
    source ${plugin_path}
fi

# zsh-autosuggestions
plugin_path="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f ${plugin_path} ]; then
    source ${plugin_path}
fi

# zsh-autocomplete
plugin_path="$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
if [ -f ${plugin_path} ]; then
    source ${plugin_path}
fi




source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autopair/autopair.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh