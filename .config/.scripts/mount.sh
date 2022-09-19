#!/bin/sh

devices=$(lsblk -rpo "name,type,mountpoint" | awk '$2=="part"&&$3==""{printf "%s\n",$1}')
dev=$(echo "$devices" | bemenu -b -l 10 --fn Hack12)
mountpoint=$(ls /media/ | bemenu -b -l 10 --fn Hack12)

sudo -A mount $dev /media/$mountpoint

