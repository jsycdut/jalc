#!/usr/bin/env bash

CURRENT_DIR=`pwd`
NVIM_CONFIG_DIR="$HOME/.config/nvim/"
FONT_DIR="$HOME/.local/share/fonts"

# get vim-plug
echo "Downloading and installing vim-plug to $NVIM_CONFIG_DIR"
mkdir -p $NVIM_CONFIG_DIR/autoload
curl -fLo $NVIM_CONFIG_DIR/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# clear
echo "Clean existing links and files"
[[ -e $HOME/.vimrc || -L $HOME/.vimrc ]] && rm $HOME/.vimrc
[[ -e $NVIM_CONFIG_DIR/init.vim || -L $NVIM_CONFIG_DIR/init.vim ]] && rm $NVIM_CONFIG_DIR/init.vim
[[ -e $NVIM_CONFIG_DIR/rc || -L $NVIM_CONFIG_DIR/rc ]] && rm $NVIM_CONFIG_DIR/rc

# link config files
echo "Linking files to current directory"
cd $NVIM_CONFIG_DIR && ln -s ${CURRENT_DIR}/vimrc init.vim && ln -s ${CURRENT_DIR}/rc rc
cd $HOME && ln -s ${CURRENT_DIR}/vimrc .vimrc

# back to current dir
echo "Done, enjoy nvim."
cd $CURRENT_DIR


