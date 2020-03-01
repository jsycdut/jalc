#!/usr/bin/env bash
CWD=`pwd`

[[ -e $HOME/.shell_pref || -L $HOME/.shell_pref ]] && rm $HOME/.shell_pref

cd $HOME && ln -s $CWD/shell_pref.sh .shell_pref.sh

echo 'source $HOME/.shell_pref.sh' >> $HOME/.zshrc
cd $CWD
