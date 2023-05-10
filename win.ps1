function ForceDelete {
    [CmdletBinding()]
    param(
        [string] $path
    )
    Remove-Item -Force -Recurse $path
}

function TouchSymbolicLink{
    [CmdletBinding()]
    param(
        [string] $path,
        [string] $target
    )
    New-Item -Path $path -ItemType Junction  -Target $target  
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
Write-Host "Config Rime"
ConfigApp -path ~\AppData\Roaming\Rime -target $CurrentLocation\rime\Library\Rime
Write-Host "Config Powershell"
ConfigApp -path ~\Documents\PowerShell -target $CurrentLocation\powershell\
Write-Host "Config Neovim"
ConfigApp -path ~\AppData\Local\nvim -target $CurrentLocation\neovim\.config\nvim\
Write-Host "Config WezTerm"
ConfigApp -path ~\.config\wezterm -target $CurrentLocation\wezterm\.config\wezterm\
Write-Host "Config Git"
ConfigApp -path ~\.config\git -target $CurrentLocation\git\.config\git\
