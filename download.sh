#!/bin/bash

if [ -e ${HOME}/.dotfiles/dotfiles ]; then
    echo "Already exists dotfiles."
    exit 0
fi


CURRENT_DIR=$(pwd)
DOTFILE_DIR="${HOME}/.dotfiles"
if [ ! "$CURRENT_DIR" = "${DOTFILE_DIR}" ]; then
    print_warning "必须在${DOTFILE_DIR}目录下运行"
    exit 1
fi

source ${DOTFILE_DIR}/script/color.sh
command_exists() { command -v "$1" &>/dev/null; }
command_exists unzip || (print_error "需要安装unzip" && exit 1)
command_exists curl || (print_error "需要安装curl" && exit 1)

VERSION="v0.2.3"
URL_PREFIX=""
if ! curl --max-time 2 x.com >/dev/null 2>&1; then
    URL_PREFIX="https://gh-proxy.com/"
    print_info "使用github代理 ${URL_PREFIX}"
fi
RELEASE_URL="${URL_PREFIX}https://github.com/rhysd/dotfiles/releases/download/${VERSION}"
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case $ARCH in
x86_64)
    ARCH="amd64"
    ;;
aarch64)
    ARCH="arm64"
    ;;
arm64)
    ARCH="arm64"
    ;;
*)
    print_error "不支持的架构: $ARCH"
    exit 1
    ;;
esac

FILENAME="dotfiles_${OS}_${ARCH}.zip"
DOWNLOAD_URL="${RELEASE_URL}/${FILENAME}"
print_info "正在从 $DOWNLOAD_URL 下载 $FILENAME..."
curl -LO "$DOWNLOAD_URL"

if [ $? -eq 0 ]; then
    print_success "下载 $FILENAME 成功。"
else
    print_error "下载 $FILENAME 失败。"
    exit 1
fi

unzip ${FILENAME}
rm ${FILENAME}
