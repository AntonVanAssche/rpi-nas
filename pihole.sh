#!/bin/bash

# Download pihole installer into rpi-nas/pihole/index.html
wget https://install.pi-hole.net -P rpi-nas/pihole/

# Execute installer
source ./rpi-nas/pihole/index.html

sudo mv rpi-nas/config_files/lighttpd.conf /etc/lighttpd/lighttpd.conf
sudo chmod 644 /etc/lighttpd/lighttpd.conf
sudo chown root:root /etc/lighttpd/lighttpd.conf
sudo sudo service lighttpd restart

echo -e "[i] ${cyan}You are now able to access the pi-hole administrative interface at http://192.168.0.100:70/admin ${reset}"
