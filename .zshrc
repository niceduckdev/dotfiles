PROMPT="%n@%m -> "

alias ls="eza -l"
alias npm="source ~/.nvm/nvm.sh && npm"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

cd /home/kaj

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
