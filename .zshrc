# prompt
PS1="%n@%m (%1d) -> "

# aliases
alias ls="eza -l -a"
alias vim="nvim"

alias dotfiles="cd $HOME/dotfiles"
alias school="cd $HOME/school/periode-2"
alias chiro="cd $HOME/chiro"

# set neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# fix zsh keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kaj/downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/kaj/downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kaj/downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/kaj/downloads/google-cloud-sdk/completion.zsh.inc'; fi

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# autostart
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	$HOME/start.sh
fi
