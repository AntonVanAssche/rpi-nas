#!/bin/bash

# Nextcloud version
NEXTCLOUD_VERSION='20.0.4'

echo -e "[i] ${cyan}Updating system cache...${reset}"
        sudo apt update &> /dev/null

echo -e "[i] ${cyan}Installing nextcloud...${reset}"
	echo -e "[i] ${cyan}Installing necessary packages...${reset}"
		sudo apt install -y apache2 mariadb-server libapache2-mod-php &> /dev/null
		sudo apt install -y php-gd php-json php-mysql php-curl php-mbstring php-intl php-imagick php-xml php-zip &> /dev/null

	cd /var/www/html
	sudo wget https://download.nextcloud.com/server/releases/nextcloud-$NEXTCLOUD_VERSION.zip
	sudo unzip nextcloud-$NEXTCLOUD_VERSION.zip
	sudo chmod -R 750 nextcloud
	sudo chown -R www-data:www-data nextcloud
	cd $HOME
