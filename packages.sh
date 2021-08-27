#!/bin/bash

message info "Updating system cache..."
	sudo apt update &> /dev/null
	sudo apt upgrade -y &> /dev/null

message info "Installing wget & curl..."
	sudo apt install wget curl -y &> /dev/null

message info "Installing htop..."
	sudo apt install htop -y &> /dev/null

message info "Installing vim..."
	sudo apt install vim -y &> /dev/null

message info "Installing SATA-hat software..."
	wget -q https://rock.sh/get-rockpi-sata -P rpi-nas/get-rockpi-sata/
	sudo chmod +x rpi-nas/get-rockpi-sata/get-rockpi-sata
	source ./rpi-nas/get-rockpi-sata/get-rockpi-sata
    sudo mv config_files/rockpi-sata.conf /etc/
    sudo chown root:root /etc/rockpi-sata.conf
