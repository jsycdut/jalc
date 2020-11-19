#!/usr/bin/env bash
# inspired by  https://github.com/joestandring/dwm-bar.git
# just use some command to get desired info string and put them 
# into the dwm bar in the top right corner

LOC=$(readlink -f "$0")
SCRIPT_DIR="$LOC/funcs"

for script in $SCRIPT_DIR; do
  if [[ -x $script ]]; then
    . $SCRIPT_DIR/script
  fi
done

#while :; do
#  xsetroot -name $bar_content
#  sleep 5
#done
