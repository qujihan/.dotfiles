 #-------------------------------   Set Proxy BEGIN   -------------------------------
$Env:http_proxy = "http://127.0.0.1:7890";
$Env:https_proxy = "http://127.0.0.1:7890"
#-------------------------------   Set Proxy END     -------------------------------


#-------------------------------   Set Alias BEGIN   -------------------------------
Set-Alias -Name vi -Value nvim 
function ee {exit}
function cl {clear}
function ser {ssh qujihan@121.48.161.203}
#-------------------------------   Set Alias END     -------------------------------



# 设置使用 cmu 命令打开 docker cmu 项目
function cmu {docker start cmu && docker exec -it cmu /bin/bash} 

