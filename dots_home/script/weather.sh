#!/bin/bash

while true; do
	result=$(curl -s -f "wttr.in/yekaterinburg?format=%c+%t&m" 2>/dev/null)
	if [ $? -eq 0 ] && [ -n "$result" ]; then
		echo " $result "
		break
	fi
	sleep 1
done
