#! /bin/bash

# systemctl
alias ss="sudo systemctl"
alias stop="sudo systemctl stop"
alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias restart="sudo systemctl restart"

# paths
alias 2..='cd ../../'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias 6..='cd ../../../../../..'

# tools
alias e='nvim'
alias f='fzf'
alias r='ranger'
alias t='tmux new -n github -s workspace -c "$HOME/github" "nvim"\; split-window -c "$HOME/github" -v -p 20 \; split-window -c "#{pane_current_path}" -h'
alias vim='nvim'

# auto fullscreen for gnome-terminal
alias gnome-terminal='gnome-terminal --full-screen'

# variables
export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"
export EDITOR="vim"
export TERM="xterm-256color"
export PATH=$PATH:"$HOME/.$USER-bin"
