cat "/home/t3chj4ck/nerdfont.txt" | rofi -dmenu -i | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
