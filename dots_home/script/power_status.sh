#!/bin/sh
POWER=$(cat /sys/class/power_supply/BAT0/power_now)

POWER=$(echo "scale=2;$POWER / 1000000" | bc)

echo "[󱟤 ${POWER}W]"
