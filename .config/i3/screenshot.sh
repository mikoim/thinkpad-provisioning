#!/bin/sh

scrot "$@" -e 'mv $f ~/Pictures/' \
&& notify-send -a 'screenshot.sh' -i camera-photo -t 1000 'Say, cheese!' 'Screenshot has been saved to Pictures.'

