# What should be installed if you use this config
1. curl wget git unzip
2. gcc g++ 
3. ripgrep fd-find(for telescope)
4. [Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases)(i use [Firacode](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip))

**Note:option**
1. If you use Golang, you'll also need to install Golang and delve using `apt install golang gopls` and `go install github.com/go-delve/delve/cmd/dlv@latest`
2. If you ues C/C++, you'll also need to install cpptools using `apt install make cmake python3.10-venv `.(Note: python3.10-venv is for cmake_lsp)
3. If you use Python, you'll also need to install python and debugpy using `apt install python3`
4. for null-ls, you can install stylua/gofmt

# TODO
1. add telescope function



# Delete
at this page, can change the debug's point ui [this](https://github.com/mfussenegger/nvim-dap/discussions/355)
