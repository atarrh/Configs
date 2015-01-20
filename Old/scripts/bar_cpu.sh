#!/bin/bash

bar_bg="#454545"
bar_fg="#746c48"
background="#181512"
foreground="#8c644c"
highlight="#d6c3b6"



n=$(($1 + 4))
PERC=`mpstat -P ALL 0 | awk '{gsub(//,""); print $4}' | sed -n "$n"p`

if [[ $PERC > 75 ]]; then
    PERCBAR=`echo -e "$PERC"\
        | dzen2-gdbar -bg $bar_bg -fg $warning -h 2 -w 120 | awk '{print $2}'`
else
    PERCBAR=`echo -e "$PERC"\
        | dzen2-gdbar -bg $bar_bg -fg $bar_fg -h 2 -w 120 | awk '{print $2}'`
fi

#ICON=^i($HOME/.xmonad/icns/cpu.xbm)
echo "   ^fg($white0)^i($HOME/.xmonad/icns/cpu.xbm)^fg() Total CPU $PERCBAR ^fg($highlight)$PERC%"



