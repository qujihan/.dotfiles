#!/bin/bash

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Util Function                                                               │
#╰──────────────────────────────────────────────────────────────────────────────╯
is_macos() { [[ "$OSTYPE" == "darwin"* ]]; }
is_bytedance_macos() {
    is_macos || return false
    [[ $(echo "$(id -un)" | tr '[:upper:]' '[:lower:]') == *bytedance* ]]
}

brew_install_file_name="brew_install.md"
if is_bytedance_macos; then
    brew_install_file_name="brew_install_bytedance.md"
fi

echo "latest update: `date '+%Y/%-m/%-d-%-H:%M:%S'`" > ${brew_install_file_name}
echo "  " >> ${brew_install_file_name}
echo "brew install " >> ${brew_install_file_name}
brew list --installed-on-request >> ${brew_install_file_name}
echo "  " >> ${brew_install_file_name}
echo "brew install --cask" >> ${brew_install_file_name}
brew list --cask >> ${brew_install_file_name}