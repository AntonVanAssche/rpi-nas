#!/bin/bash

# Colors
cyan="\e[96m"
red="\e[91m"
reset="\e[39m"

cd $HOME
echo -e "[i] ${cyan}This script will setup the pi as a home server ${reset}"
echo

echo -e "[?] ${cyan}Is this the first or second time you run the script?${reset}"
read -p "[first/second]" run_time
        if [[ $run_time = first ]] ; then

		# Install NECESSARY packages
		source ./NAS/packages.sh
		echo

	elif [[ $run_time = second ]] ; then
		# Dotfiles setup
		source ./NAS/dotfiles.sh
		echo

		# Static ip setup
		source ./NAS/ip.sh
		echo

		# RAID 5 configuration
		source ./NAS/raid.sh
		echo

		# Samba share setup
		source ./NAS/samba.sh
		echo

		# Nextcloud setup
		source ./NAS/nextcloud.sh
		echo

		# website setup (APache2 required)
		source ./website.sh
		echo
		
		# Grafana setup (system monitoring)
		source ./NAS/grafana.sh
		echo

	else
        
		echo -e "[!]${red} $run_time is not a valid option!${reset}"
		exit 128
	fi

echo -e "[?] ${cyan}Do you want to reboot the system? (recommended)${reset}"
read -p "[y/n] " reboot
	if [[ $reboot = y || $reboot = Y ]] ; then
		sleep 2
		sudo systemctl reboot
        elif [[ $reboot = n || $reboot = N ]] ; then
		echo -e "${cyan}[i] System won't rebooten!${reset}"
	fi
