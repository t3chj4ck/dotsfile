#!/bin/bash

IMAGE=/tmp/swaylock_bg.png

grim - | ffmpeg -i - -vf "boxblur=15:3" -vframes 1 -q:v 2 -y "$IMAGE" 2>/dev/null
swaylock -i "$IMAGE"

rm "$IMAGE"
