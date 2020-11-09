# jalc

- [English Version](./README.md)

> jalc means jsycdut's arch linux configuration

## 内容一览

```bash
[corona@cas github]$ tree -aL 2 jalc
.
├── .bashrc
├── .config
│   ├── aliases # 命令别名
│   ├── colorscheme # 适用于iterm2的gruvbox配色文件
│   ├── envs # 系统变量
│   ├── misc # 杂乱的配置项
│   ├── nvim # nvim 配置文件
│   ├── ranger # 命令行文件管理器ranger的配置文件
│   ├── tmux # tmux 配置文件
│   └── wall.png # 壁纸图片
├── deploy.sh # 负责部署jalc到你的$HOME
├── .local # 某些个人使用的脚本
│   ├── abs
│   ├── bin
│   └── tools
├── README-CN.md
├── README.md
└── .Xmodmap # 键位映射
```

**How to use?**

克隆本项目，执行`deploy.sh`即可，看一看脚本的具体内容会对其工作原理有一个比较好的理解。

```bash
$ git clone https://github.com/jsycdut/jalc
$ cd jalc
$ bash deploy.sh
```

## 截屏

以下是一些我的系统截屏，我主要使用的是tmux + neovim，具体的配置文件可以阅读对应的文件夹下面的README

![desktop](https://raw.githubusercontent.com/jsycdut/photos/master/arch-linux/dwm-screen.png)
![nvim-screenshot](https://raw.githubusercontent.com/jsycdut/photos/master/vim/vim-lsp.png)
