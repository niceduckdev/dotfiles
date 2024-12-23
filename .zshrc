####################
###    PROMPT    ###
####################
PS1="%n@%m (%1d) -> "
clear

#####################
###    ALIASES    ###
#####################
alias ls="eza -l"
alias tree="eza --tree"
alias vim="nvim"

#######################
###    SHORTCUTS    ###
#######################
alias dotfiles="cd $HOME/dotfiles"
alias school="cd $HOME/school"
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
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

####################
###    STARTX    ###
####################
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx $(which i3)
fi
