#!/bin/bash

nmcli device monitor wlp2s0 |
while IFS= read -r _; do
    pkill -RTMIN+10 -x i3blocks
done
