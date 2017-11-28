#!/usr/bin/env bash

case "${GTK_IM_MODULE}" in
  "ibus")
    /usr/bin/ibus &;;
  "fcitx")
    /usr/bin/fcitx &;;
esac

