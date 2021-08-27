#!/bin/bash

# Main install script

ROCK_PI_CHECK="/usr/bin/rockpi-sata/"

# Script
cd $HOME

source ./rpi-nas/utils.sh

message quest "Press enter to begin installation (automatically install after 10s):"
read -t10

ASK_FOR_SUDO

if [ ! -d "$ROCK_PI_CHECK" ]; then

   #Install NECESSARY packages
   source ./rpi-nas/packages.sh

elif [ -d "$ROCK_PI_CHECK" ]; then

   # Static ip setup
   source ./rpi-nas/ip.sh
   
   # RAID 5 configuration
   source ./rpi-nas/raid.sh

   # Samba share setup
   source ./rpi-nas/samba.sh

   # Grafana setup (system monitoring)
   source ./rpi-nas/grafana.sh

   # Pihole setup
   source ./rpi-nas/pihole.sh

   # Pivpn setup
   source ./rpi-nas/pivpn.sh

fi

REBOOT
