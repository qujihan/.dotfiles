brew_install_file_name = "brew_install.md"

.PHONY: brew install uninstall clean

brew:
	@echo "latest update:" > ${brew_install_file_name}
	@date "+%Y/%-m/%-d %-H:%M:%S" >> $(brew_install_file_name)
	@echo "  " >> ${brew_install_file_name}
	@echo "hostname:" >> ${brew_install_file_name}
	@hostname >> $(brew_install_file_name)
	@echo "  " >> ${brew_install_file_name}
	@brew list --installed-on-request >> ${brew_install_file_name}
	@echo "  " >> ${brew_install_file_name}
	@brew list --cask >> ${brew_install_file_name}

install:
	@python3 config.py --install

uninstall:
	@python3 config.py --uninstall

clean:
	@find . -name ".DS_Store" -type f -exec /bin/rm -f {} +