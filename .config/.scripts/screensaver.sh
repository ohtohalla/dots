#!/bin/bash

if [ $(pgrep swayidle) ]
then
    kill $(pgrep swayidle)
    notify-send "screensaver disabled"
else
    tout=900
    if [ $1 ]
    then
        tout=$1
    fi
    swayidle -w timeout $tout 'swaymsg output "*" dpms off' \
        resume 'swaymsg output "*" dpms on' 2>1&
    notify-send "screensaver enabled"
fi
