#!/bin/bash


# start up
mako &
fcitx5 &
xrdb -merge ~/.Xresources &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
wl-paste --type text --watch cliphist store -db-path /tmp/ &
~/script/swaybg_startup.sh &
udiskie &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots XDG_MENU_PREFIX=arch- &
hypridle &
~/script/wifi_monitor.sh &


mkfifo /tmp/kwm_status 2>/dev/null
someblocks -p > /tmp/kwm_status &
