#!/bin/bash

function machine_state() {
  battery_left=$(cat /sys/class/power_supply/BAT0/capacity)
  battery_status=$(cat /sys/class/power_supply/BAT0/status) | tr '[:lower:]' '[:upper:]'
  if [[ "DISCHARGING" == "$battery_status" ]]; then
    battery_status='🔻'
  else
    battery_status='🔺'
  fi
  battery_str="$battery_status$battery_left"
  brightness=$(printf "%.0f\n" $(xbacklight))
  sound=$(amixer get Master | tail -n 1 | sed -r "s/.*\[(.*)%\].*/\1/")
  printf "%s%s%s%s%s\n" "$battery_str" " " "🔔$sound" " " "💡$brightness"
}
