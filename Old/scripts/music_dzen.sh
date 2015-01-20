#!/bin/bash

source $(dirname $0)/config.sh

playing=$(mpc current)

icon="^i($HOME/.xmonad/icns/tri_20_out.xbm)"



if [ -z $playing ]
then
	# make colors darker
	pretty="<"
	pretty2=""
	playing="None Playing"
else
	# echo "$playing"
	pretty="^fg($color1)<^fg($color2)<^fg($color3)<^fg()"
	pretty2="^fg($color4)<^fg()"
fi

echo "$icon$pretty $playing $pretty2" 


