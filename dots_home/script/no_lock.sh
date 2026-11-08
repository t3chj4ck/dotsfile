#!/bin/bash 

rep(){
	if [ "$(playerctl status 2>/dev/null)" = "Playing" ]; then
		xset s reset
	fi
}


while true; do
	rep
	sleep 30
done
