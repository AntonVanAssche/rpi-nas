#!/bin/bash

# Main install script

# Colors
bold="\e[1m"
cyan="\e[96m"
red="\e[91m"
reset="\e[0m"
RELEASE="$(lsb_release -is)"

# Script
cd $HOME

# Check if OS is supported (Raspbian, Ubuntu, Debian)
if [[ $RELEASE == "Raspbian" || $RELEASE == "Ubuntu" || $RELEASE == "Debian" ]]; then

    echo
    echo -e "[i] ${cyan}$RELEASE is supported${reset}"

else

    echo
    echo -e "[!] ${red}$RELEASE is not supported${reset}"
    echo
    exit 1

fi

echo -e "[i] ${cyan}This script will setup the pi as a home server ${reset}"
echo

echo -e "[?] ${cyan}Is this the first or second time you run the script?${reset}"
read -p "[first/second] " run_time
	if [[ $run_time = first ]] ; then

		echo

		# Install NECESSARY packages
		source ./rpi-nas/packages.sh
		echo

	elif [[ $run_time = second ]] ; then

		echo

		# Dotfiles setup
		source ./rpi-nas/dotfiles.sh
		echo

		# Static ip setup
		source ./rpi-nas/ip.sh
		echo

		# RAID 5 configuration
		source ./rpi-nas/raid.sh
		echo

		# Samba share setup
		source ./rpi-nas/samba.sh
		echo

		# website setup (Apache required)
		source ./rpi-nas/website.sh
		echo
		
		# Grafana setup (system monitoring)
		source ./rpi-nas/grafana.sh
		echo

		# Pihole setup
		source ./rpi-nas/pihole.sh
		echo

		# Pivpn setup
		source ./rpi-nas/pivpn.sh
		echo

	else
        
		echo
		echo -e "[!] ${red}Script failed to run.${reset}"
		echo -e "[!] ${red}Invalid argument! ${bold}($run_time)${reset}"
		
		# Exit code: invalid argument to exit
		exit 128

	fi

echo -e "[?] ${cyan}Do you want to reboot the system? (recommended)${reset}"
read -p "[y/n] " reboot
	if [[ $reboot = y || $reboot = Y ]] ; then

		sleep 2
		sudo systemctl reboot

    else
		
		echo -e "${cyan}[i] System won't rebooten!${reset}"

	fi
