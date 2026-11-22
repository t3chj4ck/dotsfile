#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/wallpaper"

view_and_select() {
	tmp_file=$(mktemp)
	kitty -e yazi "$WALL_DIR" --chooser-file="$tmp_file"
	file_path=$(cat $tmp_file)
}

wallpaper() {
	if [[ ${file_path##*.} == gif ]]; then
		pkill mpv
		mpv --wid=0 --loop --no-audio --really-quiet "$file_path"
	else
		feh --bg-fill "$file_path"
	fi
}


view_and_select
wallpaper
