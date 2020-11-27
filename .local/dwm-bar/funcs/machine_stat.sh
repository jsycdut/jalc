#!/bin/bash

# read /sys/class/power_supply/BAT0/status for battery charing or not
# read /sys/class/power_supply/BAT0/capacity for battery capacity
# sometimes you need to read /sys/class/power_supply/BAT0/capacity for battery capacity
# 
# use xbacklight to fetch backlight information
# use amixer for sound speaker status
# just some simple string combination, dont worry

function machine_state() {
  battery_status="$(cat /sys/class/power_supply/BAT0/status | tr [:lower:] [:upper:])"
  if [[ "CHARGING" == "$battery_status" ]]; then
    battery_status='🔺'
  else
    battery_status='🔻'
  fi
  battery_status="$battery_status$(cat /sys/class/power_supply/BAT0/capacity)"
  brightness_status="💡$(printf "%.0f\n" $(xbacklight))"
  sound_status="🔔$(amixer get Master | tail -n 1 | sed -r "s/.*\[(.*)%\].*/\1/")"
  printf "%s %s %s\n" $battery_status $brightness_status $sound_status
}
