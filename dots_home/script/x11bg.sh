#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/wallpaper"

view_and_select() {
	tmp_file="$HOME/Pictures/wallpaper/tmp_file"
	touch "$tmp_file"
	kitty -e yazi "$WALL_DIR" --chooser-file="$tmp_file"
	file_path=$(cat $tmp_file)
}

wallpaper() {
	if [[ ${file_path##*.} == gif ]]; then
		mpv --wid=0 --loop --no-audio --really-quiet "$file_path"
	else
		feh --bg-fill "$file_path"
	fi
}

pkill mpv


view_and_select
wallpaper
