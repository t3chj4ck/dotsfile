#!/usr/bin/env bash

if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

if [ -f "$HOME/.xprofile" ]; then
    . "$HOME/.xprofile"
fi





# Start up background processes
snixembed --fork &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# udiskie &
feh --bg-scale "$(cat ~/script/wallpaper_dir)" &
picom -b &
fcitx5 -d &
clipmenud &
v2rayn &
# dwmblocks &
~/script/wifi_monitor.sh &


xinput set-prop "ELAN0677:00 04F3:3196 Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "ELAN0677:00 04F3:3196 Touchpad" "libinput Natural Scrolling Enabled" 1 &


xset s 300 &
xset dpms 305 305 305 &
xss-lock --transfer-sleep-lock -- i3lock -c 000000 -e &
# ~/script/autolock_x11.sh &

exec i3
