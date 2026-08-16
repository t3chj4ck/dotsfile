#!/bin/bash

# Start up background processes
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
udiskie &
feh --bg-scale "$(cat ~/script/wallpaper_dir)" &
v2rayn &

# Start fcitx5 as daemon
fcitx5 -d &

dwmblocks &


#dwmblcoks signals
~/script/wifi_monitor.sh &
