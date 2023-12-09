#!/bin/sh
# Author: github.com/celepharn
# Autostart applications
qutebrowser &
alacritty &
kitty --class ranger ranger &
emacs &
alacritty --class Spotify -e ncspot &
#waybar &
dunst &
/usr/lib/polkit-kde-authentication-agent-1 &
# Hyprland specific stuff
hyprpaper &
hyprctl setcursor capitaine-cursors-light 24 &
