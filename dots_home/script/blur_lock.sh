#!/bin/bash
IMAGE=/tmp/swaylock_bg.png

grim - | convert - -blur 0x8 "$IMAGE"
swaylock -i "$IMAGE"

rm "$IMAGE"
