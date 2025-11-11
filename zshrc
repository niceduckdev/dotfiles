# prompt
setopt prompt_subst
PS1='$(basename "$PWD")$(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo " ($(git symbolic-ref --short HEAD 2>/dev/null))") -> '
clear

# aliases
alias ls="eza -l"
alias tree="eza --tree"
alias vim="nvim"
alias fzf="fzf --bind 'alt-j:down,alt-k:up'"
alias fcd="find . -type d | fzf"
alias poweroff="systemctl poweroff"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# keybindings
bindkey "^[[3~" delete-char
bindkey "^[h" backward-char
bindkey "^[j" down-line-or-history
bindkey "^[k" up-line-or-history
bindkey "^[l" forward-char

# open file picker
open_finder() {
    cd "$(find $(pwd) -type d | fzf)" || return
    zle reset-prompt
}

zle -N open_finder
bindkey "^P" open_finder

# history
HISTFILE=$HOME/.zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

# zcomp file dump
export ZSH_COMPDUMP=$HOME/.zsh/.zcompdump-$HOST

# tty autostart
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	export XCURSOR_SIZE=32
	exec startx $(which bspwm)
fi
