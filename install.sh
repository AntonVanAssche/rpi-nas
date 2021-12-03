#!/bin/bash

# Main install script

# Abort if error.
set -e

dir="$(pwd)"

date=$(date +"%d-%m-%Y")
time=$(date +"%T")

lofDir="$dir/log"
logFile="$lofDir/$date-$time.log"

# Create the LOG_dir if no exists.
mkdir -p $logDir

rockPiCheck="/usr/bin/rockpi-sata/"

# Script
cd $HOME

source $dir/install-scripts/utils.sh

osCheck

function main() {

   message quest "Press enter to begin installation (automatically install after 10s):"
   read -t10

   askForSudo

   if [ ! -d "$rockPiCheck" ]; then

      #Install NECESSARY packages
      source $dir/install-scripts/packages.sh

   elif [ -d "$rockPiCheck" ]; then

      # Static ip setup
      source $dir/install-scripts/ip.sh
   
      # RAID 5 configuration
      source $dir/install-scripts/raid.sh

      # Samba share setup
      source $dir/install-scripts/samba.sh

      # Grafana setup (system monitoring)
      source $dir/install-scripts/grafana.sh

      # Pihole setup
      source $dir/install-scripts/pihole.sh

      # Pivpn setup
      source $dir/install-scripts/pivpn.sh

   fi

   rebootSystem

}

main 2>&1 | tee -a "$logFile"
