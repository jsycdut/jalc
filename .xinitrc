# Load my customized key map
if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

# fcitx input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx 
fcitx &

# for transparent background
xcompmgr &

# wallpaper
xwallpaper --zoom $HOME/wallpapers/wall.png

# status bar
dwm_already_running=$(pgrep -a bash | grep dwm_bar)
[[ -z $dwm_already_running ]] && nohup bash $HOME/.local/dwm-bar/dwm_bar.sh &

# launch dwm
exec dwm
