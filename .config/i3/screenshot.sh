#!/bin/sh

scrot "$@" -e 'mv $f ~/Pictures/' \
&& notify-send -a 'screenshot.sh' -i camera-photo 'Say, cheese!' 'Screenshot has been saved to Pictures.'

