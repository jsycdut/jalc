#!/bin/bash

set -x

# read /sys/class/power_supply/BAT0/status for battery charing or not
# read /sys/class/power_supply/BAT0/capacity for battery capacity
# sometimes you need to read /sys/class/power_supply/BAT0/capacity for battery capacity
# 
# use xbacklight to fetch backlight information
# use amixer for sound speaker status
# just some simple string combination, dont worry

function machine_state() {
  local battery_file
  local battery_capacity
  local battery_display_str
  local battery_status="⚡"
  local battery_candidate1=/sys/class/power_supply/BAT0/
  local battery_candidate2=/sys/class/power_supply/BAT1/
  [[ -d $battery_candidate1 ]] && battery_file=$battery_candidate1
  [[ -d $battery_candidate2 ]] && battery_file=$battery_candidate2
  if [[ -n $battery_file ]]; then
    battery_status="$(cat $battery_file/status | tr [:lower:] [:upper:])"
    [[ "CHARGING" == "$battery_status" ]] && battery_status='🔺' || battery_status='🔻'
    battery_capacity=$(cat $battery_file/capacity)
    battery_display_str="$battery_status""$battery_capacity"
  else
    battery_display_str=$battery_status
  fi

  brightness_status="💡$(printf "%.0f\n" $(xbacklight))"
  sound_status="🔔$(amixer get Master | tail -n 1 | sed -r "s/.*\[(.*)%\].*/\1/")"

  printf "%s %s %s\n" $battery_display_str $brightness_status $sound_status
}

machine_state
