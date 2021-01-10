#!/bin/bash

echo -e "[i] ${cyan}Updating system cache...${reset}"
	sudo apt update &> /dev/null
	sudo apt upgrade -y &> /dev/null

echo -e "[i] ${cyan}Installing wget & curl...${reset}"
	sudo apt install wget curl -y &> /dev/null

echo -e "[i] ${cyan}Installing htop...${reset}"
	sudo apt install htop -y &> /dev/null

echo -e "[i] ${cyan}Installing vim...${reset}"
	sudo apt install vim -y &> /dev/null

echo -e "[i] ${cyan}Installing SATA-hat software...${reset}"
	wget -q https://rock.sh/get-rockpi-sata -P rpi-nas/get-rockpi-sata/
	sudo chmod +x rpi-nas/get-rockpi-sata/get-rockpi-sata
	source ./rpi-nas/get-rockpi-sata/get-rockpi-sata
    sudo mv config_files/rockpi-sata.conf /etc/
    sudo chown root:root /etc/rockpi-sata.conf
