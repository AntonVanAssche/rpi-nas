#!/bin/bash

echo -e "[i] ${cyan}Updating system cache...${reset}"
	sudo apt update &> /null/dev
	sudo apt upgrade -y &> /null/dev

echo -e "[i] ${cyan}Installing wget & curl...${reset}"
	sudo apt install wget curl -y &> /dev/null

echo -e "[i] ${cyan}Installing htop...${reset}"
	sudo apt install htop -y &> /dev/null

echo -e "[i] ${cyan}Installing vim...${reset}"
	sudo apt install vim -y &> /dev/null

echo -e "[i] ${cyan}Installing LSDeluxe ...${reset}"
        wget -q https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb
        sudo apt install ./lsd_0.18.0_amd64.deb -y &> /dev/null

echo -e "[i] ${cyan}Installing nnn (file manager for terminal) ...${reset}"
        wget -q https://github.com/jarun/nnn/releases/download/v3.5/nnn_3.5-1_ubuntu20.04.amd64.deb
        sudo apt install ./nnn_3.5-1_ubuntu20.04.amd64.deb -y &> /dev/null

echo -e "[i] ${cyan}Installing Nerdfonts (This can take a while)...${reset}"
        git clone https://github.com/ryanoasis/nerd-fonts
	sudo chmod +x ./nerd-fonts/install.sh
	source ./nerd-fonts/install.sh

echo -e "[i] ${cyan}Installing SATA-hat software...${reset}"
	wget -q https://rock.sh/get-rockpi-sata
	sudo chmod +x get-rockpi-sata
	source ./get-rockpi-sata
