#!/bin/bash

if [ $(pgrep swayidle) ]
then
    $HOME/.config/.scripts/screensaver.sh
else
    choice=$(echo -e "900" | bemenu -b)
    $HOME/.config/.scripts/screensaver.sh $choice
fi
