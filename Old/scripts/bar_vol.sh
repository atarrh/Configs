#!/bin/bash


AMASTER=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $4}'`
ASTAT=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $6}'`
ICON=""

if [[ $ASTAT = "on" ]]; then

     ICON="spkr_01.xbm"
     PERCBAR=`echo "$AMASTER"\
                 | dzen2
else
    ICON="spkr_02.xbm"
    PERCBAR=`echo 0 \
                | gdbar -bg $bar_bg -fg $bar_fg -h 1 -w 50`
fi

ICON='^i(/$HOME/.xmonad/icns/'"$ICON)"
echo "$ICON $PERCBAR"




