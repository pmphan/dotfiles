#
# ~/.bash_profile
#

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export PATH=$PATH:$HOME/.local/bin

export GNUPGHOME=${XDG_DATA_HOME}/gnupg
export HISTFILE=${XDG_STATE_HOME}/.bash_history

export EDITOR=nvim

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z ${DISPLAY} && ${XDG_VTNR} -eq 1 ]] && exec startx
