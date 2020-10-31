# jalc

- [中文版](./README-CN.md)

> jalc is short for jsycdut's arch linux configuration

These are my dotfiles, including `bash vim tmux` and some other config files, they are orgnized in diffrent level of folders. If you wanna more details on specific topic, follow the links mentioned below.

```bash
[corona@cas github]$ tree -aL 2 jalc
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

**How to use?**

Follow the constructions below and you will get all the config files ready, if you take a glance at the `deploy.sh` and some other readme files, you will know how these files work.

```bash
$ git clone https://github.com/jsycdut/jalc
$ cd jalc
$ bash deploy.sh
```

## screenshots

The desktop of my arch linux, it has dwm installed as it's window manager, and use Luke Smith's [Simple Terminal](https://github.com/LukeSmithxyz/st).

![desktop](https://raw.githubusercontent.com/jsycdut/photos/master/arch-linux/arch-with-dwm.png)

The screenshots below are shot in the iterm2 of my Macbook Pro 2015 over ssh connection to my arch linux. I prefer neovim to vim, but the config files may work with vim8+ (I didn't try it). See my neovim configuration explaintion [here](./.config/nvim/README.md) for more details.

![nvim-screenshot](https://raw.githubusercontent.com/jsycdut/photos/master/vim/nvim-show.jpeg)

Tmux is the real friend of terminal users like me, it helps me out of bunch of messy windows and saves me a lot of time, see tmux configuration explaintion [here](./.config/tmux/README.md)

![tmux screen shot](https://raw.githubusercontent.com/jsycdut/photos/master/tmux/tmux.png)

Feel free to open issues if you have any puzzles.
