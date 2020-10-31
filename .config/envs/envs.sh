#!/usr/bin/env bash

# proxy
# export http_proxy="http://127.0.0.1:8118"
# export https_proxy="http://127.0.0.1:8118"

# tools
export EDITOR="nvim"
export TERM="st-256color"

# PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/ide/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# for idea weird blank screen on dmw
export _JAVA_AWT_WM_NONREPARENTING=1

# for blurred font
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
