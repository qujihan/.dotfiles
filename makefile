.PHONY: all brew download install uninstall

all: download link

brew:
	@sh script/brew.sh && diff brew_install* > brew_diff.md

download_win:
	@echo "TODO"

download:
	@bash download.sh

link:
	@cd ${HOME}/.dotfiles; if [ -e dotfiles ]; then ./dotfiles link; fi

unlink:
	@cd ${HOME}/.dotfiles; if [ -e dotfiles ]; then ./dotfiles clean; fi
