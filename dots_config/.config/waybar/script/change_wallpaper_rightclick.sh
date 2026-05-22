n=$(cat /home/t3chj4ck/.config/waybar/script/images_index)

if [ $n -eq 0 ]; then
    n=$(find /home/t3chj4ck/Pictures/wallpaper -maxdepth 1 -type f | wc -l)
    n=$((n - 2))
    echo $n > /home/t3chj4ck/.config/waybar/script/images_index
    /home/t3chj4ck/.config/waybar/script/change_wallpaper.sh &
    exit 0
fi

if [ $n -eq 1 ]; then
    n=$(find /home/t3chj4ck/Pictures/wallpaper -maxdepth 1 -type f | wc -l)
    n=$((n - 1))
    echo $n > /home/t3chj4ck/.config/waybar/script/images_index
    /home/t3chj4ck/.config/waybar/script/change_wallpaper.sh &
    exit 0
fi

if [ $n -ge 2 ]; then
    n=$((n - 2))
    echo $n > /home/t3chj4ck/.config/waybar/script/images_index
    /home/t3chj4ck/.config/waybar/script/change_wallpaper.sh &
fi

