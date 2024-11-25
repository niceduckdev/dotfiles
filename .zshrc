# prompt
PS1="%n@%m (%1d) -> "

# aliases
alias ls="eza -l"
alias tree="eza --tree"
alias vim="nvim"
alias vi="nvim"

# shortcuts
alias dotfiles="cd $HOME/dotfiles"
alias school="cd $HOME/school/periode-2"
alias chiro="cd $HOME/chiro"
alias dev="cd $HOME/dev"

# set neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# fix zsh keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# google cloud cli
if [ -f '/home/kaj/downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/kaj/downloads/google-cloud-sdk/path.zsh.inc'; fi

if [ -f '/home/kaj/downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/kaj/downloads/google-cloud-sdk/completion.zsh.inc'; fi

# auto start xfce
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
# 	startxfce4
# fi
