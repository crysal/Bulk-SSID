# Bulk-SSID
A way to advertise a list of SSID's.- buildt for Raspberry PI Zero W, can be used with most linux distros

## Install & Auto start
0. Download the git

  `git clone https://github.com/crysal/Bulk-SSID`
  `chmod +x Bulk-SSID/bulk-SSID.sh`

1. Run the install script

`./bulk-SSID.sh --install` This should most likely install all the things you need.

_If you are reading this in the far future you might need to edit the **kali-archive-keyring_2020.2_all.deb** to what ever is the newest at https://http.kali.org/kali/pool/main/k/kali-archive-keyring/_

2. Add script to crontab 

do `crontab -e` and add `@reboot /./home/pi/Bulk-SSID/bulk-ssid.sh` replacing the path to where you store your script.

## Changing to fit your needs
if you are running an external or strange Wireless adapter, get its name from `iwconfig` and replace `wlan0` in the script with your value.

the same for the wordlist, change the script to point at your wordlist. The wordlist is just what ever you want the SSIDs to be named,, each line has to be uniqe so put a number at the end or something
