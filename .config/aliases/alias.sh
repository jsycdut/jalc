#!/usr/bin/env bash

# pacman
alias search="sudo pacman -Ss"
alias install="sudo pacman -S"

# systemctl
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
alias c='clear'
alias d='sudo docker'
alias e='nvim'
alias f='fzf'
alias l='slock'
alias r='ranger'
alias s='sudo shutdown -h now'
alias t='tmux new -n github -s workspace'
alias x='startx'
alias vim='nvim'

# git
alias pull='git pull'
alias merge='git merge'
alias gco='git checkout'
alias fetch='git fetch'

# misc
alias cp='cp -v'
alias rm='rm -v'
alias ls='ls --color=auto'
alias proxy='export http_proxy=http://127.0.0.1:8118 && export https_proxy=http://127.0.0.1:8118'
alias unproxy='unset http_proxy && unset https_proxy'
