####################
###    PROMPT    ###
####################
PS1="%1d -> "
clear

#####################
###    ALIASES    ###
#####################
alias ls="eza -l -a"
alias tree="eza --tree"
alias vim="nvim"
alias fzf="fzf --bind 'alt-j:down,alt-k:up'"
alias fcd="find . -type d | fzf"

#######################
###    SHORTCUTS    ###
#######################
alias dotfiles="cd $HOME/dotfiles"
alias school="cd $HOME/school/semester-2"
alias chiro="cd $HOME/chiro"
alias dev="cd $HOME/dev"

####################
###    NEOVIM    ###
####################
export EDITOR="nvim"
export VISUAL="nvim"

#################
###    ZSH    ###
#################
bindkey "^[[3~" delete-char

bindkey "^[h" backward-char
bindkey "^[j" down-line-or-history
bindkey "^[k" up-line-or-history
bindkey "^[l" forward-char

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx $(which bspwm)
fi
