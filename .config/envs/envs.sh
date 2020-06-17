#!/usr/bin/env bash

# proxy
export http_proxy="http://127.0.0.1:8118"
export https_proxy="http://127.0.0.1:8118"

# tools
export EDITOR="nvim"
export TERM="st-256color"

# PATH
export PATH=$PATH:$HOME/.local/bin

# for idea weird blank screen on dmw
export _JAVA_AWT_WM_NONREPARENTING=1