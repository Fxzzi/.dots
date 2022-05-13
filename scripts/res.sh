#!/bin/sh
xset s off &
xset -dpms &
xrandr --verbose --output DP-4 --primary --mode 2560x1440 --rate 169.83 --pos 1920x0 --rotate normal --output DP-2 --mode 1920x1080 --pos 0x180 --rotate normal --rate 74.97
