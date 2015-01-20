#!/bin/bash

XPOS=1350
YPOS=28
WIDTH="300"
LINES="5"

white0="#646a6d"
background="#181512"
foreground="#8c644c"
highlight="#d6c3b6"


kernel="^fg($white0)^i(/$HOME/.xmonad/icns/arch_10x10.xbm)^fg() Kernel ^fg($highlight)$(uname -r)"
packages="^fg($white0)^i(/$HOME/.xmonad/icns/pacman.xbm)^fg() Packages ^fg($highlight)$(dpkg --get-selections | wc -l)"
uptime="^fg($white0)^i(/$HOME/.xmonad/icns/net_up_01.xbm)^fg() Uptime ^fg($highlight)$(uptime | awk '{gsub(/,/,""); print $3}')"


cpu_bar_total=`$HOME/.xmonad/scripts/bar_cpu.sh 0`
cpu0=`$HOME/.xmonad/scripts/bar_cpu.sh 1` && cpu4=`$HOME/.xmonad/scripts/bar_cpu.sh 5`
cpu1=`$HOME/.xmonad/scripts/bar_cpu.sh 2` && cpu5=`$HOME/.xmonad/scripts/bar_cpu.sh 6`
cpu2=`$HOME/.xmonad/scripts/bar_cpu.sh 3` && cpu6=`$HOME/.xmonad/scripts/bar_cpu.sh 7`
cpu3=`$HOME/.xmonad/scripts/bar_cpu.sh 4` && cpu7=`$HOME/.xmonad/scripts/bar_cpu.sh 8`

ramtotal=$(free -m | sed -n "3p" | awk -F " " '{print $4}')
ramused=$(free -m | sed -n "3p" | awk -F " " '{print $3}')

mem_bar=`$HOME/.xmonad/scripts/bar_ram.sh`

# (echo " ^fg($highlight)System"; echo " $kernel"; echo " $packages $uptime"; echo " "; echo " $cpu_bar_0"; echo " $cpu_bar_1"; echo " $cpu_bar_2"; echo " $cpu_bar_3"; echo " $cputemp"; echo " "; echo " $mem_bar"; echo " ^fg($highlight)$ramused MB / $ramtotal MB"; echo " "; echo " $sda_bar"; echo " $sdb_bar"; sleep 10) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'

(	echo "$kernel"; \
	echo "$packages    $uptime"; \
	echo " "; \
	echo "$cpu_bar_total"; \
	echo "$mem_bar"; \
	echo "^fg($highlight)$ramused MB / $ramtotal MB"
	sleep 100) | \
	dzen2 -sa center -fg $foreground -bg $background -x $XPOS -y $YPOS -w $WIDTH -l \
	$LINES -e 'onstart=uncollapse;button1=exit;button3=exit'



#	echo "  $cpu0    $cpu4"; \
#	echo "  $cpu1    $cpu5"; \
#	echo "  $cpu2    $cpu6"; \
#	echo "  $cpu3    $cpu7"; \


