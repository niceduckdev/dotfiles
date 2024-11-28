####################
###    PROMPT    ###
####################
PS1="%n@%m (%1d) -> "

#####################
###    ALIASES    ###
#####################
alias ls="eza -l"
alias tree="eza --tree"
alias vim="nvim"
alias top="gotop"

#######################
###    SHORTCUTS    ###
#######################
alias dotfiles="cd $HOME/dotfiles"
alias school="cd $HOME/school/periode-2"
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
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

####################
###    STARTX    ###
####################
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx $(which i3)
fi
