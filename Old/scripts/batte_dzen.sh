#!/bin/bash

source $(dirname $0)/config.sh

TIMES=`upower -d | grep time | awk -F ":" '{print $2}'`
STATE=`upower -d | grep state | awk '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//'`
CHARGE=`upower -d | grep percentage | awk '{print $2}' | cut -f1 -d '.'`


#ICON="^i($HOME/.xmonad/icns/battery90.xbm)"

#color="^fg($notify)"


if [[ $CHARGE -lt 10  ]]; then
	ICON="^i($HOME/.xmonad/icns/bat_empty_01.xbm)"
	color="^fg($warning)"
	if [ $STATE != "charging" ]; then
		notify-send "Warning, battery level below 10 percent" -u critical -t 3
	fi
else

	if   [[ $CHARGE -lt 20 ]]; then
		ICON="^i($HOME/.xmonad/icns/battery20.xbm)"
		color="^fg($notify)"
	elif [[ $CHARGE -lt 30 ]]; then
		ICON="^i($HOME/.xmonad/icns/battery30.xbm)"
		color="^fg($notify)"
	elif [[ $CHARGE -lt 40 ]]; then
		ICON="^i($HOME/.xmonad/icns/battery40.xbm)"
		color="^fg($notify)"
	elif [[ $CHARGE -lt 50 ]]; then
		ICON="^i($HOME/.xmonad/icns/battery50.xbm)"
		color=""
	elif [[ $CHARGE -lt 60 ]]; then
		ICON="^i($HOME/.xmonad/icns/battery60.xbm)"
		color=""
	elif [[ $CHARGE -lt 70 ]]; then
		ICON="^i($HOME/.xmonad/icns/battery70.xbm)"
		color=""
	elif [[ $CHARGE -lt 80 ]]; then
		ICON="^i($HOME/.xmonad/icns/battery80.xbm)"
		color=""
	else
		ICON="^i($HOME/.xmonad/icns/battery90.xbm)"
		color=""
	fi

fi

echo "$color$ICON $CHARGE%"


