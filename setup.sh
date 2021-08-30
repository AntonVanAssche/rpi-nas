#!/bin/bash

# Main install script

# Abort if error.
set -e

DIR="$HOME/rpi-nas"

ROCK_PI_CHECK="/usr/bin/rockpi-sata/"

# Script
cd $HOME

source ./$DIR/install-scripts/utils.sh

message quest "Press enter to begin installation (automatically install after 10s):"
read -t10

ASK_FOR_SUDO

if [ ! -d "$ROCK_PI_CHECK" ]; then

   #Install NECESSARY packages
   source ./$DIR/install-scripts/packages.sh

elif [ -d "$ROCK_PI_CHECK" ]; then

   # Static ip setup
   source ./$DIR/install-scripts/ip.sh
   
   # RAID 5 configuration
   source ./$DIR/install-scripts/raid.sh

   # Samba share setup
   source ./$DIR/install-scripts/samba.sh

   # Grafana setup (system monitoring)
   source ./$DIR/install-scripts/grafana.sh

   # Pihole setup
   source ./$DIR/install-scripts/pihole.sh

   # Pivpn setup
   source ./$DIR/install-scripts/pivpn.sh

fi

REBOOT
