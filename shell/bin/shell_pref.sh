#! /bin/bash

# systemctl
alias ss="sudo systemctl"
alias stop="sudo systemctl stop"
alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias restart="sudo systemctl restart"

# paths
alias ..='cd ..'
alias 2..='cd ../../'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias 6..='cd ../../../../../..'

# tools
alias e='nvim'
alias f='fzf'
alias r='ranger'
alias t='tmux new -n github -s workspace'
alias vim='nvim'

# auto fullscreen for gnome-terminal
alias gnome-terminal='gnome-terminal --full-screen'

# variables
export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"

export EDITOR="nvim"
export TERM="st-256color"
export PATH=$PATH:"$HOME/.$USER-bin"

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$PATH:$HOME/.local/bin

# for idea weird blank screen
export _JAVA_AWT_WM_NONREPARENTING=1

# export PS1="\e[0;31m[\e[0m\e[1;36m\u\e[0m\e[1;32m@\e[0m\e[1;33m\h\e[0m \e[3;35m\W\e[0m\e[1;31m]\e[0m\$\e[0m "
export PS1="\e[0;31m[\e[0m\e[1;36m\u\e[0m\e[1;32m@\e[0m\e[1;33m\h\e[0m\e[1;31m]\e[0m\$\e[0m "
