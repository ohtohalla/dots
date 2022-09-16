#!/bin/bash

if [ $(pgrep swayidle) ]
then
    /home/gregor/.scripts/screensaver.sh
else
    choice=$(echo -e "900" | bemenu -b)
    /home/gregor/.scripts/screensaver.sh $choice
fi
