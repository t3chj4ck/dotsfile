#/bin/bash
swaymsg -t get_tree | jq -r '.. | select(.type? == "con" or .type? == "floating_con") | select(.focused == true).name'
