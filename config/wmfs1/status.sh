#! /bin/bash

c1="#808080"
c2="#505050"
c3="#808080"
c4="#808080"
c5="#ababab"

_todo() {
	lines="$(sed = ~/.todo | sed 'N;s/\n/ /' | awk -F " " '{print $1}' | sed -n '$p')"
	if [ "$lines" = "" ]; then
		todo="\\$c2\\ TODO \\$c5\\nothing on list "
	elif [ "$lines" = "1" ]; then
		todo="\\$c2\\ TODO \\$c3\\$lines \\$c5\\thing to do "
	else
		todo="\\$c2\\ TODO \\$c3\\$lines \\$c5\\things to do "
	fi
}

_date() {
    day="$(date +"%a")"
    dte="$(date +"%d/%m")"
    tme="$(date +"%H:%M")"	
    date="\\$c2\\ $day \\$c3\\$dte \\$c4\\$tme "
}

#_net() {
#
#}

_memory() {
    memory_free=`free -m | grep "buffers/" | awk {'print $3MB'}`
    memory=" \\$c2\\MEM \\$c3\\$memory_free MB \\$c5\\used "
}

_mpd() {
	if [ "`mpc 2>&1 | wc -l`" -gt "1" ]; then
		artist=`mpc current -f %artist%`
		title=`mpc current -f %title%`
		if [ "`mpc | grep "^\[paused\]"`" != "" ]; then
			mpd_current=" \\$c2\\PAUSED \\$c3\\$title \\$c5\\by \\$c4\\$artist "
		else
			mpd_current=" \\$c2\\PLAYING \\$c3\\$title \\$c5\\by \\$c4\\$artist "
	fi
	else
		mpd_current=" \\$c2\\MPD \\$c5\\[stopped] "
	fi
mpd="$mpd_current"
}

_battery() {
    bat_percent=`acpi | awk -F " " '{print $4}' | cut -d "," -f 1 $1`
    bat_acpi=`cat /sys/class/power_supply/BAT0/status`
    if [ "$bat_acpi" == "Full" ]; then
	battery="\\$c2\\ BAT \\$c5\\is \\$c3\\charged"
    else
	    if [ "$bat_acpi" = "Discharging" ]; then
		bat_state="\\#6b6b6b\\ BAT \\$c5\\is \\$c3\\discharging \\$c5\\@"
	    elif [ "$bat_acpi" = "Charging" ]; then
		bat_state="\\#6b6b6b\\ BAT \\$c5\\is \\$c3\\charging \\$c5\\@"
	    elif [ "$bat_acpi" = "Unknown" ]; then
		bat_state="\\#6b6b6b\\ BAT \\$c5\\is being silly @ "
	    fi
	battery="$bat_state \\$c4\\$bat_percent"
    fi
}
  
statustext() {
    # concat args
    for arg in $@; do
_${arg}
        args="${args} `eval echo '$'$arg`"
    done
wmfs -s 0 "$args"
}

statustext mpd todo date battery
