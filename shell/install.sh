#!/usr/bin/env bash
CWD=`pwd`

[[ -d $HOME/.$USER-bin || -L $HOME/.$USER-bin ]] && rm -rf $HOME/.$USER-bin
cd $HOME && ln -s $CWD/bin .$USER-bin

echo 'source $HOME/'.$USER'-bin/shell_pref.sh' >> $HOME/.zshrc
echo 'source $HOME/'.$USER'-bin/shell_pref.sh' >> $HOME/.bashrc

cd $CWD
