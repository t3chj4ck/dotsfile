#!/bin/bash

CITY=liaocheng

while true; do
	result=$(curl -s -f "wttr.in/${CITY}?format=%c+%t&m" 2>/dev/null)
	if [ $? -eq 0 ] && [ -n "$result" ]; then
		echo " $CITY $result "
		break
	fi
	sleep 1
done
