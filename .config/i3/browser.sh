#!/usr/bin/env bash

if hash google-chrome 2>/dev/null; then
  google-chrome "$@"
elif hash chromium 2>/dev/null; then
  chromium "$@"
elif hash firefox 2>/dev/null; then
  firefox "$@"
else
  notify-send "browser.sh" "Favorite browsers not found."
fi
