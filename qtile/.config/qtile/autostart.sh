#!/bin/bash

#for screen in $(xrandr | awk '/\<connected\>.*\<3840x/ {print $1}'); do
#    xrandr --output $screen --scale 0.85x0.85
#done

picom --config ~/.config/picom/picom.conf &
lxpolkit &
light-locker &
xrdb ~/.Xresources
nitrogen --restore

nm-applet &
pasystray &
blueman-applet &

