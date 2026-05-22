#!/bin/sh
POWER=$(cat /sys/class/power_supply/BAT0/power_now)

# 计算功率（单位：W）
POWER=$(echo "scale=2;$POWER / 1000000" | bc)

echo " ${POWER}W"
