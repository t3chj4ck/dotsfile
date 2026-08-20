#!/bin/bash

ip monitor link | while read -r _; do
    pkill -RTMIN+10 someblocks
done
