brew_install_file_name = "brew_install.md"
brew_install_file_name_temp = "brew_install_temp.md"
vscode_install_extension_file_name = "vscode_install_extension.md"

.PHONY: brew vscode list install uninstall clean

brew:
	@echo "latest update:" > ${brew_install_file_name}
	@date "+%Y/%-m/%-d-%-H:%M:%S" >> $(brew_install_file_name)
	@echo "  " >> ${brew_install_file_name}
	@echo "brew install " >> ${brew_install_file_name}
	@brew list --installed-on-request >> ${brew_install_file_name}
	@echo "  " >> ${brew_install_file_name}
	@echo "brew install --cask" >> ${brew_install_file_name}
	@brew list --cask >> ${brew_install_file_name}

brew_temp:
	@echo "latest update:" > ${brew_install_file_name_temp}
	@date "+%Y/%-m/%-d-%-H:%M:%S" >> $(brew_install_file_name_temp)
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
	@echo "latest update:" > ${vscode_install_extension_file_name}
	@date "+%Y/%-m/%-d-%-H:%M:%S" >> $(vscode_install_extension_file_name)
	@echo "  " >> ${vscode_install_extension_file_name}
	@echo "hostname:" >> ${vscode_install_extension_file_name}
	@hostname >> $(vscode_install_extension_file_name)
	@echo "  " >> ${vscode_install_extension_file_name}
	@code --list-extensions | awk '{print "code --force --install-extension";print $0; print " "}' >> ${vscode_install_extension_file_name}

list: brew vscode
	@echo "Backup Homebrew install list and VSCode extension list."

install:
	@python3 config.py --install

uninstall:
	@python3 config.py --uninstall

clean:
	@find . -name ".DS_Store" -type f -exec /bin/rm -f {} +