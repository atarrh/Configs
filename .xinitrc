#!/bin/sh
# 
# ~/.xinitrc
#
# Executed by startx
# 

# Merge custom X resources
xrdb -merge "${HOME}/.Xresources"

# Run font config? Don't know if needed.
# Ok, figured some stuff out. Fonts are a bitch.

# Run handmade script to get bitmapped fonts working.
# fc-cache -vf ~/.fonts
# ~/scripts/fonts

# Get flux up and running
# ~/scripts/xflux -l 42.35 -g 71.06

# Set background
feh --bg-scale ~/wallp.png &

# Make sure MPD is running
mpd &


# Start the Window Manager
exec xmonad


