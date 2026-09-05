#!/usr/bin/env bash
home=$HOME
foot yazi $home/Pictures/wallpaper/ --chooser-file=$home/script/wallpaper_dir


wallpaper=$(cat $home/script/wallpaper_dir)

if [ -f $home/script/wallpaper_dir ]; then
	pkill swaybg
	swaybg -i $wallpaper
fi
