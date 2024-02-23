# 配置 vscode vim
# .vscodevimrc url: https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/.vscodevimrc

# 配置 vscode keybindings.json
# keybindings.json url: https://raw.githubusercontent.com/qujihan/vscode/Library/Application%20Support/Code/User/keybindings.json

$proxy_url = "https://mirror.ghproxy.com"
$keybindings_url = "https://raw.githubusercontent.com/qujihan/vscode/Library/Application%20Support/Code/User/keybindings.json"
$vimrc_url = "https://raw.githubusercontent.com/qujihan/.dotfiles/main/vscode/.vscodevimrc"

$keybingings_download_url = "$proxy_url/$keybindings_url"
$vimrc_download_url = "$proxy_url/$vimrc_url"

if ($args.Count -gt 0) {
    $keybindings_path = $args[0]
} else {
    $keybindings_path = "$env:HOME/Library/Application Support/Code/User/keybindings.json"
}
$vimrc_path = "$env:HOME/.vscodevimrc"

if (Test-Path $keybindings_path) {
    if (Test-Path "${keybindings_path}.script.bak") {
        Write-Host "remove old config file(*.script.bak)"
        Remove-Item "${keybindings_path}.script.bak"
    }
    Write-Host "backup old config file(*.script.bak)"
    Move-Item $keybindings_path "${keybindings_path}.script.bak"
}

if (Test-Path $vimrc_path) {
    if (Test-Path "${vimrc_path}.script.bak") {
        Write-Host "remove old config file(*.script.bak)"
        Remove-Item "${vimrc_path}.script.bak"
    }
    Write-Host "backup old config file(*.script.bak)"
    Move-Item $vimrc_path "${vimrc_path}.script.bak"
}

Invoke-WebRequest -Uri $keybingings_download_url -OutFile $keybindings_path
Invoke-WebRequest -Uri $vimrc_download_url -OutFile $vimrc_path
