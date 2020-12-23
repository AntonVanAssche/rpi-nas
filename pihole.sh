#!/bin/bash

# Download pihole installer into rpi-nas/pihole/index.html
wget https://install.pi-hole.net -P rpi-nas/pihole/index.html

# Execute installer
source ./rpi-nas/pihole/index.html