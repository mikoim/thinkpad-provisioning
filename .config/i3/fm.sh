#!/usr/bin/env bash

if hash spacefm 2>/dev/null; then
  spacefm "$@"
elif hash pcmanfm 2>/dev/null; then
  pcmanfm "$@"
elif hash nautilus 2>/dev/null; then
  nautilus "$@"
else
  notify-send "fm.sh" "Favorite file managers not found."
fi
