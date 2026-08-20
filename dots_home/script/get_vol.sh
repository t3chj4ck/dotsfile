#!/bin/bash
vol_num=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)"%"}')
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if [[ "$vol" == *MUTED* ]]; then
    echo "$vol_num MUTED"
else
    echo "$vol_num"
fi
