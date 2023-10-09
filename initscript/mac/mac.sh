#!/usr/bin/env bash
set -ex

# 在窗口任意位置按住 ctrl + command 就可以在任意位置拖动窗口
function setDrag(){
    defaults write -g NSWindowShouldDragOnGesture -bool "true"
}

function resetDrag(){
    defaults delete -g NSWindowShouldDragOnGesture
}

function setABC(){
    cp ~/Library/Preferences/com.apple.HIToolbox.plist  ~/Library/Preferences/com.apple.HIToolbox.plist.backup
    /usr/libexec/PlistBuddy -c "Delete :AppleEnabledInputSources:0"  ~/Library/Preferences/com.apple.HIToolbox.plist 
}

function resetABC(){
    rm -rf  ~/Library/Preferences/com.apple.HIToolbox.plist 
    mv  ~/Library/Preferences/com.apple.HIToolbox.plist.backup  ~/Library/Preferences/com.apple.HIToolbox.plist
}

function setTrackpad(){
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
}

function resetTrackpad(){
    defaults delete com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag"
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
}

function setDock(){
    # Dock 栏大小
    defaults write com.apple.dock "tilesize" -int 38 

    # 不显示最近项目
    defaults write com.apple.dock "show-recents" -bool "false"

    # 神奇缩放
    defaults write com.apple.dock "mineffect" -string "genie"

    # 在 Dock 的应用图标上向下滚动滚轮可以打开这个应用的所有窗口
    # 在 触控板上两根手指向上滑动
    defaults write com.apple.dock "scroll-to-open" -bool "true"

    # 只显示打开的应用
    defaults write com.apple.dock static-only -boolean true

    defaults delete com.apple.dock persistent-apps
    defaults delete com.apple.dock persistent-others
    killall Dock
}

function resetDock(){
    defaults delete com.apple.dock
    killall Dock
}

function setFinder(){
    # 显示所有后缀
    defaults write -g AppleShowAllExtensions -bool true

    # 在 Finder 下面显示路径栏
    defaults write com.apple.finder ShowPathbar -bool true

    # 边栏图标大小
    defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1" 

    # 默认打开 $HOME 目录
    defaults write com.apple.finder NewWindowTarget -string "PfHm"

    # 默认使用 List
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

    # 默认使用当前目录搜索
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    killall Finder
}

function resetFinder(){
    defaults delete com.apple.finder
    killall Finder
}

function setMac(){
    setDock ; setFinder ; setDrag
}

function resetMac(){
    resetDock ; resetFinder ; resetDrag
}

setMac