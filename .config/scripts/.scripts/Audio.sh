#!/bin/zsh
device=$(echo -e "Headset\nLautsprecher" | bemenu -p  "Audioausgabe" --fn Hack12 -l 10 -b )

if [ "$device" = "Headset" ]
then
	pactl set-card-profile alsa_card.usb-Kingston_HyperX_7.1_Audio_00000000-00 output:analog-stereo+input:analog-stereo;
	pactl set-card-profile alsa_card.pci-0000_00_1b.0 off
elif [ "$device" = "Lautsprecher" ]
then
	pactl set-card-profile alsa_card.pci-0000_00_1b.0 output:analog-stereo+input:analog-stereo;
	pactl set-card-profile alsa_card.usb-Kingston_HyperX_7.1_Audio_00000000-00 off
fi




