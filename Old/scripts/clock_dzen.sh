#!/bin/bash



source $(dirname $0)/config.sh



DATE=$(date +"%a %D")
TIME=$(date +"%I:%M %P")



TRI="^fg($color6)^i($HOME/.xmonad/icns/tri_20.xbm)^fg()^bg()"
CAL="^i($HOME/.xmonad/icns/calendar.xbm)"
CLO="^i($HOME/.xmonad/icns/clock.xbm)"

echo "$TRI^bg($color6) $CLO $TIME | $CAL $DATE  "











