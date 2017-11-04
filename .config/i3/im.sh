#!/bin/sh

export PATH=/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

case "${GTK_IM_MODULE}" in
  "ibus")
    ibus-daemon &;;
  "fcitx")
    fcitx &;;
esac

