# 在windows下自动下载.ideavimrc文件
# .ideavimrc url: https://raw.githubusercontent.com/qujihan/.dotfiles/main/ideavim/.ideavimrc
$proxyUrl = "https://mirror.ghproxy.com"
$vimrcUrl = "https://raw.githubusercontent.com/qujihan/.dotfiles/main/ideavim/.ideavimrc"
$vimrcDownloadUrl = "${proxyUrl}/${vimrcUrl}"
$vimrcPath = "${HOME}\.ideavimrc"

if (Test-Path $vimrcPath) {
    $backupPath = "${vimrcPath}.script.bak"
    if (Test-Path $backupPath) {
        Write-Host "remove old config file (*.script.bak)"
        Remove-Item $backupPath
    }

    Write-Host "backup old config file (*.script.bak)"
    Move-Item $vimrcPath $backupPath
}

Invoke-WebRequest -Uri $vimrcDownloadUrl -OutFile $vimrcPath
