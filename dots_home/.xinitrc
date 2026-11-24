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
# feh --bg-scale "$(cat ~/script/wallpaper_dir)" &
# picom -b &
fcitx5 -d &
clipmenud &
# dwmblocks &
~/script/wifi_monitor.sh &
~/script/no_lock.sh &
# nm-applet &
# blueman-applet &
io.github._2dust.v2rayN &
autotiling &




wallpaper(){
	file_path=$(cat "$HOME/Pictures/wallpaper/tmp_file")
	if [[ ${file_path##*.} == gif ]]; then
		mpv --wid=0 --loop --no-audio --really-quiet "$file_path"
	else
		feh --bg-fill "$file_path"
	fi
}

wallpaper







xset r rate 200 25
xset s 600 &
xset dpms 605 605 605 &
xss-lock --transfer-sleep-lock -- i3lock -c 000000 -e &



exec i3


