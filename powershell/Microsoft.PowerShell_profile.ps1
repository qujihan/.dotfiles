 #-------------------------------   Set Proxy BEGIN   -------------------------------
$Env:http_proxy = "http://127.0.0.1:7890";
$Env:https_proxy = "http://127.0.0.1:7890"
#-------------------------------   Set Proxy END     -------------------------------


#-------------------------------   Set Alias BEGIN   -------------------------------
Set-Alias -Name vi -Value nvim 
Set-Alias -Name pod -Value podman 
Set-Alias -Name cl -Value clear 
function ee {exit}
function ser {ssh qujihan@121.48.161.203}
#-------------------------------   Set Alias END     -------------------------------

Invoke-Expression (&starship init powershell)