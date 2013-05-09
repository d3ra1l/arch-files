#!/usr/bin/env bash
# This script prints a string will be evaluated for text attributes (but not shell commands) by tmux. It consists of a bunch of segments that are simple shell scripts/programs that output the information to show. For each segment the desired foreground and background color can be specified as well as what separator to use. The script the glues together these segments dynamically so that if one script suddenly does not output anything (= nothing should be shown) the separator colors will be nicely handled.

# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Mute this statusbar?
mute_status_check "right"

declare -A now_playing
now_playing+=(["script"]="${segments_path}/np_mpd_simple.sh")
#now_playing+=(["script"]="${segments_path}/np_itunes_mac.sh")
#now_playing+=(["script"]="${segments_path}/np_mpd_simple.sh")
#now_playing+=(["script"]="${segments_path}/np_mocp.sh")
#now_playing+=(["script"]="${segments_path}/np_spotify_linux_wine.sh")
#now_playing+=(["script"]="${segments_path}/np_spotify_linux_native.sh")
#now_playing+=(["script"]="${segments_path}/np_spotify_mac.sh")
#now_playing+=(["script"]="${segments_path}/np_rhythmbox.sh")
#now_playing+=(["script"]="${segments_path}/np_banshee.sh")
#now_playing+=(["script"]="${segments_path}/np_audacious.sh")
#now_playing+=(["script"]="${segments_path}/np_lastfm.sh")
#now_playing+=(["script"]="${segments_path}/np_rdio_mac.sh")
#now_playing+=(["script"]="${segments_path}/np_cmus.sh")
if [[ ${now_playing["script"]} ]]; then
	now_playing+=(["foreground"]="red,bold")
	now_playing+=(["background"]="default")
	now_playing+=(["separator"]="")
	register_segment "now_playing"
fi


declare -A battery
battery+=(["script"]="${segments_path}/battery.sh")
battery+=(["foreground"]="green")
battery+=(["background"]="default")
if [ "`mpc 2>&1 | wc -l`" -gt "1" ]; then
   if [ "`mpc | grep "^\[paused\]"`" != "" ]; then
        battery+=(["separator"]="|")
    else
        battery+=(["separator"]="|")
    fi
else
    battery+=(["separator"]="")
fi
battery+=(["separator_fg"]="default")
battery+=(["separator_bf"]="default")
register_segment "battery"

declare -A date_day
date_day+=(["script"]="${segments_path}/date_day.sh")
date_day+=(["foreground"]="magenta")
date_day+=(["background"]="default")
date_day+=(["separator"]="|")
date_day+=(["separator_fg"]="default")
date_day+=(["separator_bg"]="default")
#register_segment "date_day"

declare -A date_full
date_full+=(["script"]="${segments_path}/date_full.sh")
date_full+=(["foreground"]="red")
date_full+=(["background"]="default")
date_full+=(["separator"]="|")
date_full+=(["separator_fg"]="default")
date_full+=(["separator_bg"]="default")
#register_segment "date_full"

declare -A time
time+=(["script"]="${segments_path}/time.sh")
time+=(["foreground"]="blue")
time+=(["background"]="default")
time+=(["separator"]="|")
time+=(["separator_fg"]="default")
time+=(["separator_bg"]="default")

register_segment "time"

# Print the status line in the order of registration above.
print_status_line_right

exit 0
