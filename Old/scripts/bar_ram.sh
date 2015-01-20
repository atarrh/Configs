#!/bin/bash

background="#181512"
foreground="#8c644c"
highlight="#d6c3b6"
bar_bg="#454545"
bar_fg="#746c48"
notify="#F39D21"
warning="#D23D3D"


FREE=`free -m | awk 'NR == 3 {gsub(/%/,""); print $3}'`
MAX=`free -m | awk 'NR == 2 {gsub(/%/,""); print $2}'`
PERC=`echo $FREE*100/$MAX | bc`

if [[ $PERC -gt 75 ]]; then
    PERCBAR=`echo -e "$PERC"\
        | dzen2-gdbar -bg $bar_bg -fg $warning -h 2 -w 120`
else
    PERCBAR=`echo -e "$PERC"\
        | dzen2-gdbar -bg $bar_bg -fg $bar_fg -h 2 -w 120 | awk '{print $2}'`
fi

echo "^fg($white0)^i($HOME/.xmonad/icns/mem.xbm)^fg() Total RAM $PERCBAR ^fg($highlight)$PERC%"


