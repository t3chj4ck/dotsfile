#!/bin/bash

CITY=yekaterinburg

while true; do
	result=$(curl -s -f "wttr.in/${CITY}?format=%c+%t&m" 2>/dev/null)
	if [ $? -eq 0 ] && [ -n "$result" ]; then
		echo "$result"
		break
	fi
	echo ""
	sleep 1
done
