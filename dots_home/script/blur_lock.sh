#!/bin/bash

if pgrep -x "swaylock" > /dev/null; then
    exit 0
fi

IMAGE=/tmp/swaylock_bg.png

grim - | convert - -blur 0x8 "$IMAGE"

swaylock -i "$IMAGE"

rm "$IMAGE"
