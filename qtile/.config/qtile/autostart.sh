#!/bin/bash

picom --config ~/.config/picom/picom.conf &
lxpolkit &
light-locker &
xrdb ~/.Xresources
nitrogen --restore

nm-applet &
pasystray &
blueman-applet &

