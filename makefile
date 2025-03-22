brew_install_file_name = "brew_install.md"
brew_install_file_name_temp = "brew_install_temp.md"
vscode_install_extension_file_name = "vscode_install_extension.md"

.PHONY: brew vscode list install uninstall clean

brew:
	@echo "latest update: `date '+%Y/%-m/%-d-%-H:%M:%S'`" > ${brew_install_file_name}
	@echo "  " >> ${brew_install_file_name}
	@echo "brew install " >> ${brew_install_file_name}
	@brew list --installed-on-request >> ${brew_install_file_name}
	@echo "  " >> ${brew_install_file_name}
	@echo "brew install --cask" >> ${brew_install_file_name}
	@brew list --cask >> ${brew_install_file_name}

brew_temp:
	@echo "latest update: `date '+%Y/%-m/%-d-%-H:%M:%S'`" > ${brew_install_file_name}
	@echo "  " >> ${brew_install_file_name_temp}
	@echo "brew install " >> ${brew_install_file_name_temp}
	@brew list --installed-on-request >> ${brew_install_file_name_temp}
	@echo "  " >> ${brew_install_file_name_temp}
	@echo "brew install --cask" >> ${brew_install_file_name_temp}
	@brew list --cask >> ${brew_install_file_name_temp}

brew_diff:
	@make brew_temp
	@difft ${brew_install_file_name} ${brew_install_file_name_temp}

vscode:
	@echo "latest update: `date '+%Y/%-m/%-d-%-H:%M:%S'`" > ${brew_install_file_name}
	@echo "  " >> ${vscode_install_extension_file_name}
	@echo "hostname:" >> ${vscode_install_extension_file_name}
	@hostname >> $(vscode_install_extension_file_name)
	@echo "  " >> ${vscode_install_extension_file_name}
	@code --list-extensions | awk '{print "code --force --install-extension";print $0; print " "}' >> ${vscode_install_extension_file_name}

download_win:
	@echo "TODO"

download:
	@bash download.sh

link:
	@cd ${HOME}/.dotfiles; if [ -e dotfiles ]; then ./dotfiles link; fi

unlink:
	@cd ${HOME}/.dotfiles; if [ -e dotfiles ]; then ./dotfiles clean; fi