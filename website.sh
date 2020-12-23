#!/bin/bash

# Cloning git repo
git clone git@gitlab.com:sudo_TuX/tuinen_raf_vranken.git rpi-nas/website/

# Moving tuinen_raf_vranken/ to /var/www/html/tuinen_raf_vranken/
sudo mv rpi-nas/website/ /var/www/html/website/

# Setting correct permissions
sudo chown -R root:root /var/www/html/website/

# restart apache(2)
sudo systemctl restart apache2
