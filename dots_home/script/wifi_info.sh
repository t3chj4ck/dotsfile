#!/bin/bash
wifi_info=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi 2>/dev/null | awk -F: '$1=="yes" {print $2, $3"%"}')

if [ -n "$wifi_info" ]; then
    echo "[󰀂 $wifi_info]"
else
    echo "[󰀂 no wifi]"
fi
