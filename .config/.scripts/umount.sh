#!/bin/sh

choices=$(lsblk -rpo "name,type,mountpoint" | awk '$2=="part"&&$2!=""{printf "%s:  %s\n", $1,$3}' | grep /media )
dev=$(echo -e $choices | bemenu -b -l10 --fn Hack12)
dev=$(echo $dev | awk '{print $2}')

sudo -A umount $dev

