#!/usr/bin/env bash

if [ "$(hostname -s)" == "namako" ]; then
  echo "mother ship"
  # xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-4 --primary --mode 1920x1080 --pos 0x0 --rotate normal &
  feh --random --bg-max ~/Pictures/* &
  compton -b --opacity-rule '100:window_type = "dock" && class_g = "i3bar"' &
  dropbox start &
  /opt/dunst/bin/dunst &
  "$HOME/.config/i3/gpu-detect.fish" &
  "$HOME/.config/i3/im.sh" &
else
  echo "laptop"
  feh --bg-max "$HOME/Pictures/bg.png" &
  dropbox &
  dunst &
fi

