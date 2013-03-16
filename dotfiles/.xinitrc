#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp ~/.fonts
xset fp rehash
fc-cache
xset b 0 0 0
compton -f -D5 &  # -t-2 -l-2 -r0 -o.55 &
urxvtd&
#unclutter&

exec wmfs -C ~/.config/wmfs1/wmfsrc
#~/bin/wmfs2
#exec awesome -c ~/.config/awesome/rc.lua
