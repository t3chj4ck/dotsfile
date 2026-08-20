num=$(vmstat 1 2 | tail -n1 | awk '{print 100 - $15 "%"}')
echo "$num"
