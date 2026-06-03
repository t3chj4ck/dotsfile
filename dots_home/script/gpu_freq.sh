#!/bin/bash
echo -n "$(cat /sys/class/drm/card1/device/gpu_busy_percent)% "
cat /sys/class/drm/card1/device/hwmon/hwmon*/freq1_input | awk '{print $1/1000000 "MHz"}'
