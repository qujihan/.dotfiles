if [ -n "$DOTFILE_DEBUG" ]; then
    echo "loading plugin"
fi

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Plugin                                                                      │
#╰──────────────────────────────────────────────────────────────────────────────╯
# brew install zsh-syntax-highlighting zsh-autopair zsh-autosuggestions zsh-autocomplete

BREW_PREFIX="/opt/homebrew"
# BREW_PREFIX=$(brew --prefix)

# zsh-syntax-highlighting
plugin_path="${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f ${plugin_path} ]; then
    source ${plugin_path}
fi

# zsh-autopair
plugin_path="${BREW_PREFIX}/share/zsh-autopair/autopair.zsh"
if [ -f ${plugin_path} ]; then
    source ${plugin_path}
fi

# zsh-autosuggestions
plugin_path="${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f ${plugin_path} ]; then
    source ${plugin_path}
fi

# zsh-autocomplete
# plugin_path="${BREW_PREFIX}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
# if [ -f ${plugin_path} ]; then
    # source ${plugin_path}
# fi