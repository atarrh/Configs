#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.

current() {
    whoami
    echo @
    uname -n
    echo ">"
}

clock() {
    date +"%a %b %-d, %-I:%M %p"
}

battery() {
    BAT0C=/sys/class/power_supply/BAT0/capacity
    BAT0S=/sys/class/power_supply/BAT0/status

    BAT1C=/sys/class/power_supply/BAT1/capacity
    BAT1S=/sys/class/power_supply/BAT1/status

    (test "`cat $BAT0S`" = "Charging" && echo -n '+') || (test "`cat $BAT0S`" = "Discharging" && echo -n '-') || (echo -n '~')
    sed -n p $BAT0C

    (test "`cat $BAT1S`" = "Charging" && echo -n '+') || (test "`cat $BAT1S`" = "Discharging" && echo -n '-') || (echo -n '~')
    sed -n p $BAT1C

}

volume() {
    amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p' | uniq
}

groups() {

    # First determine which windows are open;
    # reomve extraneous information and split by newlines.
    wins=`xprop -root _NET_CLIENT_LIST_STACKING`
    wins=`echo ${wins#*# } | tr -d " " | tr "," "\n"`

    # Determine current and total number of windows
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    # for each workspace s that is less than the current
    for s in `seq 0 $((cur - 1))`; do

        found=""

        # for each window w that exists
        for w in $wins; do

            # g is the group/workspace that w exists in
            g=`xprop -id $w _NET_WM_DESKTOP | awk '{print $3}'`

            # if window w is in workspace s
            if [ $g == $s ]
              then
                line="${line}\f6x\f9 "
                found="true"
                break
            fi
        done

        # if length of found is zero (if nothing was found)
        if [ -z $found ]; then line="${line}o "; fi
    done

    # Add symbol for current workspace
    line="${line}\f3@\f9"

    for s in `seq $((cur + 1)) $((tot - 1))`; do
        found=""
        for w in $wins; do
            g=`xprop -id $w _NET_WM_DESKTOP | awk '{print $3}'`
            if [ $g == $s ]
              then
                line="${line} \f6x\f9"
                found="true"
                break
            fi
        done

        if [ -z $found ]; then line="${line} o"; fi
    done

    echo $line
}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf="\l\f9  $(current)"
    buf="${buf} \c> $(groups) <"
    # buf="${buf} BAT: $(battery) |"
    buf="${buf}\r< CLK: $(clock)"
    # buf="${buf} VOL: $(volume)%% }"
    echo $buf

    # use `nowplaying scroll` to get a scrolling output!
    sleep 1 # The HUD will be updated every second
done
