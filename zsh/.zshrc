#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Theme and plugins                                                           │
#│  brew install romkatv/powerlevel10k/powerlevel10k                            │ 
#│  brew install zsh-autosuggestions zsh-syntax-highlighting zsh-completions    │
#╰──────────────────────────────────────────────────────────────────────────────╯
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/zsh-git-prompt/zshrc.sh
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
# You may also need to force rebuild `zcompdump`: rm -f ~/.zcompdump; compinit
if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
fi


#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Config theme and UI                                                         │  
#╰──────────────────────────────────────────────────────────────────────────────╯
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
PROMPT='%B%m%~%b$(git_super_status) %# '

#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Clash proxy                                                                 │  
#╰──────────────────────────────────────────────────────────────────────────────╯
export https_proxy=http://127.0.0.1:7890 
export http_proxy=http://127.0.0.1:7890 
export all_proxy=socks5://127.0.0.1:7890


#╭──────────────────────────────────────────────────────────────────────────────╮
#│  Alias                                                                       │  
#╰──────────────────────────────────────────────────────────────────────────────╯
alias vi="nvim"
alias ndev="nvim +\"set rtp+=./\""
# alias vim="nvim"
alias ee="exit"
alias cl="clear"
alias la="ls -a"
alias ll="ls -l"
alias ser="ssh qujihan@121.48.161.203"
