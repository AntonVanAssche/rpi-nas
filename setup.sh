#!/bin/bash

# Main install script

RELEASE="$(lsb_release -is)"

# Script
cd $HOME

source ./rpi-nas/utils.sh

# Check if OS is supported (Raspbian, Ubuntu, Debian)
if [[ $RELEASE == "Raspbian" || $RELEASE == "Ubuntu" || $RELEASE == "Debian" ]]; then
   message info "$RELEASE is supported!"
else
   message error "$RELEASE is not supported."
   exit 1
fi

message quest "Press enter to begin installation (automatically install after 10s):"
read -t10

ASK_FOR_SUDO

message quest "Is this the first or second time you run the script? [first/second]"
read -p " " RUN_TIME
   if [[ $RUN_TIME = "first" ]] ; then
      
	  #Install NECESSARY packages
	  source ./rpi-nas/packages.sh

   elif [[ $RUN_TIME = "second" ]] ; then

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

	else
		message error "Unknown option: $RUN_TIME"
		exit 22

	fi

REBOOT
