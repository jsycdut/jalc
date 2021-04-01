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

## 我用到的软件

在下日常使用arch linux（也就浏览网页，写点bug），下面是我常用的一些软件包

1. [arch linux](https://www.archlinux.org/) 轻量灵活的Linux发行版
2. [dwm](https://dwm.suckless.org/) 动态窗口管理器
3. [st](https://st.suckless.org/) 简单终端
4. [tmux](https://github.com/tmux/tmux) 终端多路复用模拟器
5. [ranger](https://github.com/ranger/ranger) 给命令行爱好者的终端文件管理器，基于vim的操作方式
6. [neovim](https://neovim.io/) 基于vim的高度可扩展的文本编辑器
7. [chromium](https://www.chromium.org/chromium-projects) [brave](https://brave.com) 浏览器
8. [zathura](https://pwmt.org/projects/zathura/) 文档浏览器
9. [sxiv](https://github.com/muennich/sxiv) X 窗口环境下的简单图片浏览器
10. [mpv](https://wiki.archlinux.org/index.php/mpv) 媒体播放器
11. [jetbrains-all](https://www.jetbrains.com/products.html#type=ide) jetbrains全家桶
12. [NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager) Network Manager
13. [xbacklight](https://wiki.archlinux.org/index.php/backlight#xbacklight) 笔记本屏幕背光调节

## 截屏

以下是一些我的系统截屏，我主要使用的是tmux + neovim，具体的配置文件可以阅读对应的文件夹下面的README

![desktop](https://raw.githubusercontent.com/jsycdut/photos/master/arch-linux/tmux-screen.png)
![nvim-screenshot](https://raw.githubusercontent.com/jsycdut/photos/master/arch-linux/neovim.png)

同时我也使用emacs，我的个人配置在[这里](https://github.com/jsycdut/emacs.d)
![](https://raw.githubusercontent.com/jsycdut/photos/master/arch-linux/emacs.png)
