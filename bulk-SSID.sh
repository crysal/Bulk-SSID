#!/bin/bash
#if it's your first time running this script you most likely would need to run the --install to get the dependencies
if  [ "$1" == "--install" ]
then
	wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2020.2_all.deb
	apt-get install ./kali-archive-keyring_2020.2_all.deb --assume-yes
	apt-get install mdk3 macchanger --assume-yes
	rm ./kali-archive-keyring_2020.2_all.deb
	echo -e "to activate when powered on\nput this in crontab -e \n@reboot sudo /./home/pi/Bulk-SSID/bulk-ssid.sh"
	exit
else
	airmon-ng start wlan0
	mdk3 wlan0mon b -a -f /home/pi/Bulk-SSID/wordlist.txt
fi
