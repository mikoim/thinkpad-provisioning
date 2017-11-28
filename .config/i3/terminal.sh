#!/usr/bin/env bash

if hash alacritty 2>/dev/null; then
  alacritty "$@"
elif hash terminator 2>/dev/null; then
  terminator "$@"
elif hash gnome-terminal 2>/dev/null; then
  gnome-terminal "$@"
elif hash uxterm 2>/dev/null; then
  uxterm "$@"
elif hash xterm 2>/dev/null; then
  xterm "$@"
else
  notify-send "terminal.sh" "Favorite terminal emulators not found."
fi
