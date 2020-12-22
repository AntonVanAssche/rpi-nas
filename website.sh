#!/bin/bash

# Cloning git repo
git clone git@gitlab.com:sudo_TuX/tuinen_raf_vranken.git

# Moving tuinen_raf_vranken/ to /var/www/html/tuinen_raf_vranken/
sudo mv tuinen_raf_vranken/ /var/www/html/tuinen_raf_vranken/

# Setting correct permissions
sudo chown -R root:root /var/www/html/tuinen_raf_vranken/

# restart apache(2)
sudo systemctl restart apache2
