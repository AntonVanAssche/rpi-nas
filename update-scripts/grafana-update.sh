#!/bin/bash

PROMETHEUS_VERSION="2.33.4"
NODE_EXPORTER_VERSION="1.3.1"

# Abort if error.
set -e

sudo apt update && sudo apt upgrade -y

wget https://github.com/prometheus/prometheus/releases/download/v"$PROMETHEUS_VERSION"/prometheus-"$PROMETHEUS_VERSION".linux-armv7.tar.gz
wget https://github.com/prometheus/node_exporter/releases/download/v"$NODE_EXPORTER_VERSION"/node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7.tar.gz

tar -xvf prometheus-"$PROMETHEUS_VERSION".linux-armv7.tar.gz
tar -xvf node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7.tar.gz

rm -rf prometheus-"$PROMETHEUS_VERSION".linux-armv7.tar.gz node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7.tar.gz

sudo systemctl stop grafana-server prometeus.service node_exporter.service

sudo rm -rf /usr/sbin/prometheus /usr/sbin/node_exporter

sudo mv prometheus-"$PROMETHEUS_VERSION".linux-armv7/ prometheus/
sudo mv node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7/ node_exporter/

sudo mv prometheus/ /usr/sbin/
sudo mv node_exporter/ /usr/sbin/

sudo cp -r ./configs/prometeus.yml /usr/sbin/prometheus/

sudo systemctl daemon-reload
sudo systemctl start grafana-server prometheus.service node_exporter.service
sudo systemctl status grafana-server prometheus.service node_exporter.service

echo "All done"
