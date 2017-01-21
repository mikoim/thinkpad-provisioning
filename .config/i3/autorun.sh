#!/bin/sh

xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-4 --primary --mode 1920x1080 --pos 0x0 --rotate normal &
feh --bg-scale "$HOME/Pictures/bg.jpg" &
compton -b --opacity-rule '100:window_type = "dock" && class_g = "i3bar"' &
dropbox start &
wine "$HOME/.wine/drive_c/Program Files (x86)/1Password 4/Agile1pAgent.exe" &

