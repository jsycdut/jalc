#!/usr/bin/env bash

set -e

#################### folders
# copy everything in .config to $HOME/.config
[[ ! -d $HOME/.config ]] && mkdir $HOME/.config
for conf in .config/*; do
    [[ -f $conf ]] && cp $conf $HOME/.config || cp -r $conf $HOME/.config
done

# copy everything in .local to $HOME/.local
[[ ! -d $HOME/.local/ ]] && mkdir $HOME/.local
for ll in .local/*; do
    [[ -f $ll ]] && cp $ll $HOME/.local || cp -r $ll $HOME/.local
done

################### regular files
regular_file_list=(
.bashrc
)

for regular_file in ${regular_file_list[*]}; do
  cp $regular_file $HOME
done
