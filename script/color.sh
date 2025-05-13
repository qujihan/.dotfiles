#!/bin/bash
RESET_COLOR="\033[0m"

color_red() {
    echo -e "\033[31m$1 $RESET_COLOR"
}

color_green() {
    echo -e "\033[32m$1 $RESET_COLOR"
}

color_yellow() {
    echo -e "\033[33m$1 $RESET_COLOR"
}

color_blue() {
    echo -e "\033[34m$1 $RESET_COLOR"
}

color_purple() {
    echo -e "\033[35m$1 $RESET_COLOR"
}

color_cyan() {
    echo -e "\033[36m$1 $RESET_COLOR"
}

# 带背景色的打印函数
color_red_bg() {
    echo -e "\033[41m$1 $RESET_COLOR"
}

color_green_bg() {
    echo -e "\033[42m$1 $RESET_COLOR"
}

# 成功/错误提示
print_success() {
    echo -e $(color_green "[✓] $1")
}

print_error() {
    echo -e $(color_red "[✗] $1")
}

print_warning() {
    echo -e $(color_yellow "[!] $1")
}

print_info() {
    echo -e $(color_cyan "[*] $1")
}

COLOR_TEST_FUNCTION() {
    echo "标准颜色测试:"
    echo $(color_red "红色文字")
    echo $(color_green "绿色文字")
    echo $(color_yellow "黄色文字")
    echo $(color_blue "蓝色文字")
    echo $(color_purple "紫色文字")
    echo $(color_cyan "青色文字")
    
    echo -e "\n背景色测试:"
    echo $(color_red_bg "红色背景")
    echo $(color_green_bg "绿色背景")
    
    echo -e "\n样式测试:"
    print_success "操作成功"
    print_error "发生错误"
    print_warning "警告信息"
    print_info "提示信息"
}
