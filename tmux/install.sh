#!/usr/bin/env bash
cwd=`pwd`

[[ -e $HOME/.tmux.conf || -L $HOME/.tmux.conf ]] && rm $HOME/.tmux.conf

cd $HOME
ln -s $cwd/tmux.conf .tmux.conf

cd $cwd
