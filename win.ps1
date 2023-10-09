function ForceDelete {
    [CmdletBinding()]
    param(
        [string] $path
    )
    if (Test-Path $path) {
        Remove-Item -Force -Recurse $path
    }
}

function TouchSymbolicLink{
    [CmdletBinding()]
    param(
        [string] $path,
        [string] $target
    )

    if(Test-Path -Path $target -PathType Container){
        # if path is a dir
        New-Item -ItemType Junction -Path $path -Target $target  
    } else {
        # if path is a file
        New-Item -ItemType SymbolicLink -Path $path -Target $target
    }
} 


function ConfigApp{
    [CmdletBinding()]
    param(
        [string] $path,
        [string] $target
    )

    ForceDelete -path $path
    TouchSymbolicLink  -path $path -target $target 
}


$CurrentLocation = Get-Location

Write-Host "Config VSCode keybindings"
ConfigApp -path "$env:USERPROFILE\AppData\Roaming\Code\User\keybindings.json" -target "$CurrentLocation\vscode\Library\Application Support\Code\User\keybindings.json"

Write-Host "Config VSCode snippets"
ConfigApp -path "$env:USERPROFILE\AppData\Roaming\Code\User\snippets" -target "$CurrentLocation\vscode\Library\Application Support\Code\User\snippets"

Write-Host "Config VSCodeVim"
ConfigApp -path "$env:USERPROFILE\.vscodevimrc" -target $CurrentLocation\vscode\.vscodevimrc

Write-Host "Config IdeaVim"
ConfigApp -path "$env:USERPROFILE\.ideavimrc" -target $CurrentLocation\ideavim\.config\.ideavimrc

Write-Host "Config Powershell"
ConfigApp -path "$env:USERPROFILE\Documents\PowerShell" -target $CurrentLocation\powershell\

# Write-Host "Config WezTerm"
# ConfigApp -path ~\.config\wezterm" -target $CurrentLocation\wezterm\.config\wezterm\

Write-Host "Config Alacritty"
ConfigApp -path "$env:USERPROFILE\.config\alacritty" -target $CurrentLocation\alacritty\.config\alacritty
ConfigApp -path "$env:USERPROFILE\AppData\Roaming\alacritty" -target $CurrentLocation\alacritty\.config\alacritty

Write-Host "Config Git"
ConfigApp -path "$env:USERPROFILE\.config\git" -target $CurrentLocation\git\.config\git\

Write-Host "Config Starship"
ConfigApp -path "$env:USERPROFILE\.config\starship.toml" -target $CurrentLocation\starship\.config\starship.toml

Write-Host "Config WSL"
ConfigApp -path "$env:USERPROFILE\.wslconfig" -target $CurrentLocation\wsl\.wslconfig