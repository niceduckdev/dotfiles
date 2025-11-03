#!/bin/zsh

open_git() {
	remote=${1:-origin}
	url=$(git remote get-url "$remote" 2>/dev/null)

	if [ $? -ne 0 ]; then
		return
	fi

	url=$(echo "$url" | sed -E 's/git@([^:]+):([^\.]+)\.git/https:\/\/\1\/\2/')
	url="${url%.git}"

    (nohup open "$url" &>/dev/null &) &>/dev/null
	zle reset-prompt
}
