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
ConfigApp -path ~\AppData\Roaming\Code\User\keybindings.json -target "$CurrentLocation\vscode\Library\Application Support\Code\User\keybindings.json"
Write-Host "Config VSCode snippets"
ConfigApp -path ~\AppData\Roaming\Code\User\snippets -target "$CurrentLocation\vscode\Library\Application Support\Code\User\snippets"
Write-Host "Config VSCodeVim"
ConfigApp -path ~\.vscodevimrc -target $CurrentLocation\vscode\.config\.vscodevimrc
Write-Host "Config IdeaVim"
ConfigApp -path ~\.ideavimrc -target $CurrentLocation\ideavim\.config\.ideavimrc
Write-Host "Config Powershell"
ConfigApp -path ~\Documents\PowerShell -target $CurrentLocation\powershell\
Write-Host "Config Neovim"
ConfigApp -path ~\AppData\Local\nvim -target $CurrentLocation\neovim\.config\nvim\
Write-Host "Config WezTerm"
ConfigApp -path ~\.config\wezterm -target $CurrentLocation\wezterm\.config\wezterm\
Write-Host "Config Git"
ConfigApp -path ~\.config\git -target $CurrentLocation\git\.config\git\
Write-Host "Config Starship"
ConfigApp -path ~\.config\starship.toml -target $CurrentLocation\starship\.config\starship.toml
