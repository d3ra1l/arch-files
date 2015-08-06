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
compton -cGbf -D5 -t-4 -l-6 -r3 -e.75 -o.55 --config ~/.compton.conf
nitrogen --restore
xmodmap ~/.xmodmap
mpd;mpdas &
~/bin/./irssi-notify &
amixer -q set Master unmute
amixer -q set Speaker unmute
export LANG=en_US.UTF-8

exec awesome -c ~/.config/awesome/rc.lua >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
