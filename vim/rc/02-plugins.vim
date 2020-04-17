"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim插件配置 使用 vim-plug作为插件管理器
" 查看https://github.com/junegunn/vim-plug进行安装
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'ryanoasis/vim-devicons'    "文档图标

Plug 'preservim/nerdtree' " 目录插件

Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "NERDTree文件类型语法高亮

Plug 'scrooloose/syntastic'      "语法检测，保存代码时检验语法错误

Plug 'junegunn/goyo.vim' "goyo  centerlize your vitextm

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'PotatoesMaster/i3-vim-syntax' " i3 syntax highlight

Plug 'Chiel92/vim-autoformat' " 自动代码格式化插件

Plug 'tpope/vim-fugitive' " git plugin for vim, by tpope

Plug 'tpope/vim-surround' " surround content with quotes or something, another plugin by tpope

" combined
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'

Plug 'majutsushi/tagbar' " using ctag files to show the encapsulation of the code file, like out line in eclipse or strcture in Intellij

Plug 'itchyny/lightline.vim' " status bar, like vim airline

"Plug 'vim-airline/vim-airline' " vim air-line, classic airline status bar

Plug 'mhinz/vim-startify' " fancy start screen for vim

Plug 'jiangmiao/auto-pairs' " auto pairs, for better pairs edit experience, this is amazing

Plug 'alvan/vim-closetag' " close tags for me

Plug 'junegunn/vim-easy-align' "for align

Plug 'lervag/vimtex' " for tex file and it's align

"补全插件，最后选用了coc
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'ycm-core/YouCompleteMe'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'MattesGroeger/vim-bookmarks'

Plug 'wlemuel/vim-tldr' "TL;DR vim client

" used to be using this, but I got easymotion for better experience
" Plug 'justinmk/vim-sneak' "The missing motion for Vim, by justinmk, neovim maintainer
Plug 'easymotion/vim-easymotion'

Plug 'airblade/vim-gitgutter' "side bar for git changes

Plug 'rking/ag.vim'  "The vim front for silver searcher

call plug#end()
