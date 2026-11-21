#!/bin/bash

rep(){
    if playerctl -a status 2>/dev/null | grep -qx "Playing"; then
        xset s reset
    fi
}

while true; do
    rep
    sleep 30
done
