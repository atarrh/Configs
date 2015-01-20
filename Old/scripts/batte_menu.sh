

TIMES=`upower -d | grep time | awk -F ":" '{print $2}' | sed 's/^ *//g'`
STATE=`upower -d | grep state | awk '{print $2}'`
CHARGE=`upower -d | grep percentage | awk '{print $2}' | cut -f1 -d '.'`


(echo "$STATE"; \
	echo "$TIMES left"; \
	sleep 15) | dzen2 -sa center -x 1300 -y 25 -w 125 -l 1 \
	-e 'onstart=uncollapse;button1=exit;button3=exit' &

#sed 's/ *$//g'

#(echo " ^fg($highlight)Battery"; echo " ^fg()$batstatus"; echo "
#^fg($highlight)$battime ^fg()left"; sleep 15) | dzen2 -fg $foreground -bg
#$background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e
#'onstart=uncollapse,hide;button1=exit;button3=exit'




