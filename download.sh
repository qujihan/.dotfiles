#!/bin/bash

if [ -e ${HOME}/.dotfiles/dotfiles ]; then
    echo "Already exists dotfiles."
    exit 0
fi

CURRENT_DIR=$(pwd)
if [ ! "$CURRENT_DIR" = "${HOME}/.dotfiles" ]; then
    echo "Must run in dotfiles directory."
    exit 1
fi

VERSION="v0.2.3"
RELEASE_URL="https://github.com/rhysd/dotfiles/releases/download/${VERSION}"
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
    echo "不支持的架构: $ARCH"
    exit 1
    ;;
esac

FILENAME="dotfiles_${OS}_${ARCH}.zip"
DOWNLOAD_URL="${RELEASE_URL}/${FILENAME}"
echo "正在从 $DOWNLOAD_URL 下载 $FILENAME..."
curl -LO "$DOWNLOAD_URL"

if [ $? -eq 0 ]; then
    echo "下载 $FILENAME 成功。"
else
    echo "下载 $FILENAME 失败。"
    exit 1
fi

unzip ${FILENAME}
rm ${FILENAME}
