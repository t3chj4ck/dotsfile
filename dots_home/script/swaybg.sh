#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/wallpaper"
CACHE_DIR="$HOME/.cache/awww_rofi_thumbs"

mkdir -p "$CACHE_DIR"

selected=$(
	find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | while read -r img; do
		basename=$(basename "$img")
		thumb="$CACHE_DIR/${basename}.png"
		#thumb
		if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
			magick "$img" -resize 320x180^ -gravity center -extent 320x180 "$thumb"
		fi

		printf "%s\0icon\x1f%s\n" "$basename" "$thumb"
	done | wofi --dmenu -show-icons "wallpaper"
)

if [ -n "$selected" ]; then
	swaybg -i "$WALL_DIR/$selected" -m fill &
	echo "$WALL_DIR/$selected" > ~/script/wallpaper_dir 
fi
