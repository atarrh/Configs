

white0="#646a6d"
wonkers="#d0d0d0"
foreground="#8c644c"
bar_bg="#454545"




DIVIDE="^fg($wonkers)----------^fg()"
PERC=`mpc | awk 'NR == 2 {gsub(/[()%]/,""); print $4}'`
PERCBAR=`echo "$PERC" \
	| dzen2-gdbar -bg $bar_bg -fg $foreground -h 1 -w 150 | awk '{print $2}'`


PREV_ICO="^i($HOME/.xmonad/icns/prev.xbm)"
PLPA_ICO="^i($HOME/.xmonad/icns/playpause.xbm)"
NEXT_ICO="^i($HOME/.xmonad/icns/next.xbm)"

PREV_ACT="^ca(1, ncmpcpp prev) $PREV_ICO ^ca()"
PLPA_ACT="^ca(1, ncmpcpp toggle) $PLPA_ICO ^ca()"
NEXT_ACT="^ca(1, ncmpcpp next) $NEXT_ICO ^ca()"


BUTTONS="^fg($white0)$PREV_ACT $PLPA_ACT $NEXT_ACT^fg()"




(echo "Music"; \
	echo "$DIVIDE"; \
	echo "$BUTTONS"; \
	echo "$PERCBAR"; \
	echo "$PERC"; \
	sleep 15) | dzen2 -x 1200 -y 25 -w 200 -l 5 \
	-e 'onstart=uncollapse;button1=exit;button3=exit' & 

# -sa center





#(echo "^fg($highlight)Music"; echo
#"^ca(1,/home/sunn/.xmonad/scripts/dzen_lyrics.sh) $track^ca()"; echo "
#^ca(1,/home/sunn/.xmonad/scripts/dzen_artistinfo.sh)^fg()$artist^ca()";echo "
#^ca(1,/home/sunn/.xmonad/scripts/dzen_albuminfo.sh)^fg()$album^ca()"; echo " ";

#echo " ^ca(1, ncmpcpp prev) ^fg($white0)^i(/home/sunn/.xmonad/dzen2/prev.xbm)
#^ca() ^ca(1, ncmpcpp pause) ^i(/home/sunn/.xmonad/dzen2/pause.xbm) ^ca() ^ca(1,
#ncmpcpp play) ^i(/home/sunn/.xmonad/dzen2/play.xbm) ^ca() ^ca(1, ncmpcpp next)
#^i(/home/sunn/.xmonad/dzen2/next.xbm) ^ca()"; echo " "; echo $percbar; sleep 15)
#| dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l
#$LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit' & 
















