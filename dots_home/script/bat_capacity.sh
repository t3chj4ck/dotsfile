#!/bin/bash

d=/sys/class/power_supply/BAT0

read -r capacity < "$d/capacity" || exit 0
read -r status < "$d/status" || exit 0

case "$status" in
    Discharging)
        read -r energy < "$d/energy_now" || exit 0
        read -r power < "$d/power_now" || exit 0
        remaining=$energy
        ;;
    Charging)
        read -r energy < "$d/energy_now" || exit 0
        read -r full < "$d/energy_full" || exit 0
        read -r power < "$d/power_now" || exit 0
        remaining=$((full - energy))
        ;;
    *)
        printf '%s%%\n' "$capacity"
        exit 0
        ;;
esac

if (( power <= 0 || remaining <= 0 )); then
    printf '%s%%\n' "$capacity"
    exit 0
fi

minutes=$((remaining * 60 / power))

printf '%s%% %dh%02dm\n' \
    "$capacity" "$((minutes / 60))" "$((minutes % 60))"
