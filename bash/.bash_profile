#
# ~/.bash_profile
#

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export PATH=$PATH:$HOME/.local/bin

export EDITOR=nvim

export XINITRC=${XDG_CONFIG_HOME}/X11/xinitrc
export XSERVERRC=${XDG_CONFIG_HOME}/X11/xserverrc
export XAUTHORITY=${XDG_RUNTIME_DIR}/Xauthority
export HISTFILE=${XDG_STATE_HOME}/bash_history
export GNUPGHOME=${XDG_DATA_HOME}/gnupg
export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z ${DISPLAY} && ${XDG_VTNR} -eq 1 ]] && exec startx
