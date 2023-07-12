#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sudo='sudo -E '
alias pls='sudo -E $(history -p !!)'
if [[ $TERM == xterm-kitty ]]
then
    alias ssh='kitty +kitten ssh'
    alias diff='kitty +kitten diff'
    alias icat='kitty +kitten icat'
fi

# Enable git bash completion
. /usr/share/git/completion/git-completion.bash

# Customize bash prompt
PS1='\[\e[1;31m\] \u\[\e[34m\] \w\[\e[32m\] $\[\e[0m\] '
