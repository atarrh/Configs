
# Fancy stuff
xsetroot -cursor_name left_ptr
xrdb -merge ~/.Xresources
sh ~/.fehbg &

# Start mpd to enable music playing
mpd &

# Start rxvt-unicode daemon to reduce memory usage
urxvtd -q -o -f

# Start dropbox daemon to sync folders
dropboxd &

# Finally, start a WM/DE
# exec gnome-session
exec xmonad


