#! /bin/bash

c1="#808080"
c2="#6d6d6d"
#c3="#d8aba5"
#c4="#a5abd8"
c3="#898989"
c4="#898989"
c5="#ababab"

_todo() {
        lines="$(sed = ~/.todo | sed 'N;s/\n/ /' | awk -F " " '{print $1}' | sed -n '$p')"
        if [ "$lines" = "" ]; then
                echo "^[right;$c1;- ] ^s[right;$c2;TODO ](1;spawn;~/bin/d-todo) ^s[right;$c5;nothing on list ](1;spawn;~/bin/d-todo)"
        elif [ "$lines" = "1" ]; then
                echo "^s[right;$c1; ] ^s[right;$c2;TODO ](1;spawn;~/bin/d-todo) ^s[right;$c3;$lines ] ^s[right;$c5;thing to do ](1;spawn;~/bin/d-todo)"
        else
                echo "^s[right;$c1; ] ^s[right;$c2;TODO ](1;spawn;~/bin/d-todo) ^s[right;$c3;$lines ] ^s[right;$c5;things to do ](1;spawn;~/bin/d-todo)"
        fi
}


_date() {
    day="$(date +"%a")"
    dte="$(date +"%d/%m")"
    tme="$(date +"%H:%M")"	
    echo "^s[right;$c1; ] ^s[right;$c2;$day ](1;spawn;~/bin/d-date)  ^s[right;$c3;$dte ](1;spawn;~/bin/d-date) ^s[right;$c4;$tme ](1;spawn;~/bin/d-date)"
    
}


_memory() {
    memory_free=`free -m | grep "buffers/" | awk {'print $3MB'}`
    echo "^s[right;$c1; ] ^s[right;$c2;MEM ] ^s[right;$c3;$memory_free MB ] ^s[right;$c5;used ] ^s[right;$c1;::]"
    
}


_mpd() {
	if [ "`mpc 2>&1 | wc -l`" -gt "1" ]; then
		artist=`mpc current -f %artist%`
		title=`mpc current -f %title%`
		if [ "`mpc | grep "^\[paused\]"`" != "" ]; then
			echo "^s[right;$c2; PAUSED ](1;spawn;~/bin/d-music) ^s[right;$c3;$title ](1;spawn;~/bin/d-music) ^s[right;$c5;by ](1;spawn;~/bin/d-music) ^s[right;$c4;$artist ](1;spawn;~/bin/d-music)"
		else
			echo "^s[right;$c2; PLAYING ](1;spawn;~/bin/d-music) ^s[right;$c3;$title ](1;spawn;~/bin/d-music) ^s[right;$c5;by ](1;spawn;~/bin/d-music) ^s[right;$c4;$artist ](1;spawn;~/bin/d-music)"
	fi
	else
		echo "^s[right;$c2; MPD ](1;spawn;~/bin/d-music) ^s[right;$c5;[stopped\] ](1;spawn;~/bin/d-music)"
	fi
}


_battery() {
    bat_percent=`acpi | awk -F " " '{print $4}' | cut -d "," -f 1 $1`
    bat_acpi=`cat /sys/class/power_supply/BAT0/status`
    if [ "$bat_acpi" == "Full" ]; then
	echo "^s[right;$c1; ] ^s[right;$c2;BAT ](1;spawn;~/bin/d-hardware) ^s[right;$c5;is ](1;spawn;~/bin/d-hardware) ^s[right;$c3;charged ](1;spawn;~/bin/d-hardware)"
    else
	    if [ "$bat_acpi" = "Discharging" ]; then
		bat_state="^s[right;$c5;is ](1;spawn;~/bin/d-hardware) ^s[right;$c3;discharging ](1;spawn;~/bin/d-hardware) ^s[right;$c5;@ ](1;spawn;~/bin/d-hardware)"
	    elif [ "$bat_acpi" = "Charging" ]; then
		bat_state="^s[right;$c5;is ](1;spawn;~/bin/d-hardware) ^s[right;$c3;charging ](1;spawn;~/bin/d-hardware) ^s[right;$c5;@ ](1;spawn;~/bin/d-hardware)"
	    elif [ "$bat_acpi" = "Unknown" ]; then
		bat_state="^s[right;$c5;is being silly @ ](1;spawn;~/bin/d-hardware)"
	    fi
	echo "^s[right;$c1; ] ^s[right;$c2;BAT ](1;spawn;~/bin/d-hardware) $bat_state ^s[right;$c4;$bat_percent ](1;spawn;~/bin/d-hardware)"
    fi
}


TIMING=1
 
statustext()
{
	wmfs -c status "bar $(_mpd) $(_todo) $(_date) $(_battery)"
}

while true ; do
	statustext
	sleep $TIMING
done
