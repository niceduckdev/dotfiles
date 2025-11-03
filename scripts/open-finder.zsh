#!/bin/zsh

open_finder() {
    cd "$(find $(pwd) -type d | fzf)" || return
    zle reset-prompt
}
