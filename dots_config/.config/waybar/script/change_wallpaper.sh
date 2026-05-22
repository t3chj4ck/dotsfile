#!/bin/bash

dir=/home/t3chj4ck/Pictures/wallpaper
images=($(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \)))

#creat index num
script_dir=$(dirname "$0")
images_index="$script_dir/images_index"
if [ -s "$images_index" ]; then
  img_num=$(cat "$script_dir/images_index")
else
  img_num=0
  echo "$img_num" >"$images_index"
fi

# size=$(identify -format "%[fx:w/h]" ${images[$img_num]})
# echo $size
#
# if [[ "$size" != "1.6" ]]; then
#   magick ${images[$img_num]} -gravity center -crop 16:10 ${images[$img_num]}
# else
#   echo "true"
# fi

#change hyprpaper
# pkill hyprpaper
# sed -i "s|^ *preload *=.*|preload = $using_wpp|" /home//blackj4ck/.config/hypr/hyprpaper.conf

# sed -i "s|^ *wallpaper *=.*|wallpaper = ,$using_wpp|" /home/blackj4ck/.config/hypr/hyprpaper.conf

# sleep 0.5
# hyprpaper &

#www
awww img ${images[$img_num]} --transition-type outer --transition-pos 0.854,0.977 --transition-duration 1.5 --transition-fps 60

#hyprlock
# sed -i "s|^ *path *=.*|    path = ${images[$img_num]} |" /home/blackj4ck/.config/hypr/hyprlock.conf

#change sddm background
# cp ${images[$img_num]} /usr/share/sddm/themes/breeze/background.jpg

##change grub theme by sudo
#cp $using_wpp /boot/grub/themes/bigsur/background.png

#save index num
img_num=$((img_num + 1))
echo "$img_num" >"$images_index"

#check if out of bounds
if [ "$img_num" -ge "${#images[@]}" ]; then
  img_num=0
  echo "$img_num" >"$images_index"
fi

exit
