# jalc

- [中文版](./README-CN.md)

> jalc means jsycdut's arch linux configuration

I'm an arch linux user. This repo contains all my config files, include `vim, tmux and my other configs` aka `dotfiles`, most of them are stored inside of `.config` folder. I've seen lots of instersting configs and I `steal` ideas from them, now it's time to share mine.

## screenshots

![desktop](https://raw.githubusercontent.com/jsycdut/photos/master/arch-linux/arch-with-dwm.png)

## contents

- [vim](#vim)
- [tmux](#tmux)

the config files are orgnized as below

```bash
[corona@cas jalc]$ tree -aL 2 .
.
├── .bashrc
├── .config
│   ├── aliases # command alias
│   ├── colorscheme # gruvbox colorscheme for iterm2
│   ├── envs # system environment variables
│   ├── misc # miscellaneous items
│   ├── nvim # nvim config files
│   ├── ranger # ranger, a command line file manager
│   ├── tmux # tmux config files
│   └── wall.png # wallpaper
├── deploy.sh # it copys all these config files to your $HOME
├── .local # some scripts I use
│   ├── abs
│   ├── bin
│   └── tools
├── README-CN.md
├── README.md
└── .Xmodmap # keycode remapping
```

### vim

```bash
[corona@cas .config]$ tree nvim/
nvim/
├── get-vim-plug.sh # it will download vim-plug as a plugin manager
├── init.vim # load all other configs in rc folder
└── rc # runtime config
    ├── 01-essential.vim # the backbone configuration
    ├── 02-plugins.vim # declare all my plugins here
    ├── 03-NERDTree.vim # specific configuration for plugins
    ├── 04-coc.vim
    ├── 05-fzf.vim
    ├── 06-close-tag.vim
    ├── 07-goyo.vim
    ├── 08-ale.vim
    ├── 09-bookmarks.vim
    ├── 10-tldr.vim
    ├── 11-rnvimr.vim
    ├── 12-git-gutter.vim
    ├── 13-ag.vim
    ├── 14-pymode.vim
    └── 99-misc.vim
```
Oh~ time to show off my vim screenshot. Wanna more details or asciinema screen record? see [nvim conf readme](./.config/nvim/README.md)

![nvim-screenshot](https://raw.githubusercontent.com/jsycdut/photos/master/vim/nvim-show.jpeg)

### tmux
