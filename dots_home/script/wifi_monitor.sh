#!/bin/bash

SIGNAL_NUM=3

ip monitor link | while read -r _; do
    pkill -RTMIN+${SIGNAL_NUM} dwmblocks
done
