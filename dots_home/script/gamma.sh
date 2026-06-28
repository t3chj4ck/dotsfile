#!/bin/bash

TEMP_FILE="/tmp/current_color_temp"
STEP=500
MIN_TEMP=2500
MAX_TEMP=6500

if [ ! -f "$TEMP_FILE" ]; then
	echo "6500" >"$TEMP_FILE"
fi

CURRENT_TEMP=$(cat "$TEMP_FILE")

if [ "$1" == "up" ]; then
	NEW_TEMP=$((CURRENT_TEMP + STEP))
elif [ "$1" == "down" ]; then
	NEW_TEMP=$((CURRENT_TEMP - STEP))
else
	exit 1
fi

if [ $NEW_TEMP -gt $MAX_TEMP ]; then NEW_TEMP=$MAX_TEMP; fi
if [ $NEW_TEMP -lt $MIN_TEMP ]; then NEW_TEMP=$MIN_TEMP; fi

echo "$NEW_TEMP" >"$TEMP_FILE"

pkill gammastep

gammastep -O "$NEW_TEMP" &
notify-send "gamma ${NEW_TEMP}K"
