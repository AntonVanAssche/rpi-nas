#!/bin/bash

# Download pihole installer into rpi-nas/pihole/index.html
wget https://install.pi-hole.net -P rpi-nas/pihole/

# Execute installer
source ./$DIR/pihole/index.html

sudo mv $DIR/configs/lighttpd.conf /etc/lighttpd/lighttpd.conf
sudo chmod 644 /etc/lighttpd/lighttpd.conf
sudo chown root:root /etc/lighttpd/lighttpd.conf
sudo sudo service lighttpd restart

message info "You are now able to access the pi-hole administrative interface at http://192.168.0.100:70/admin"
