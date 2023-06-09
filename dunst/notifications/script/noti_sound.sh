#!/bin/bash
curPercentage=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
substr="${curPercentage::-1}"
echo "$substr"

per=$((substr+0))


paplay --volume=65536 /home/arjit/.config/dunst/sounds/luffy.mp3
