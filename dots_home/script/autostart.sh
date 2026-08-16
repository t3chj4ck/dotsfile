#!/bin/bash


# start up
mako &
fcitx5 &
xrdb -merge ~/.Xresources &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
~/script/swaybg_startup.sh &
udiskie &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots XDG_MENU_PREFIX=arch- &
swayidle -w timeout 600 'loginctl lock-session' before-sleep 'loginctl lock-session' lock 'swaylock -f -c 000000 --indicator-idle-visible' &
