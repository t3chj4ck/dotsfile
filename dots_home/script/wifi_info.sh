#!/bin/bash
SSID=$(nmcli -t -f ACTIVE,SSID dev wifi 2>/dev/null | awk -F: '$1=="yes" {print $2}')

SIGNAL=$(nmcli -t -f ACTIVE,SIGNAL dev wifi 2>/dev/null | awk -F: '$1=="yes" {print $2}')

if [ -n "$SSID" ]; then
    echo "$SSID: $SIGNAL%"
else
    echo "No WIFI"
fi
