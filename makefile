.PHONY: brew download install uninstall

brew:
	@sh tool/brew.sh

download_win:
	@echo "TODO"

download:
	@bash download.sh

link:
	@cd ${HOME}/.dotfiles; if [ -e dotfiles ]; then ./dotfiles link; fi

unlink:
	@cd ${HOME}/.dotfiles; if [ -e dotfiles ]; then ./dotfiles clean; fi