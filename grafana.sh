#!/bin/bash

GRAFANA_VERSION="8.1.2"
PROMETHEUS_VERSION="2.29.1"
NODE_EXPORTER_VERSION="1.2.2"

message info "Installing Grafana-server..."
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_"$GRAFANA_VERSION"_armhf.deb
sudo dpkg -i grafana-enterprise_"$GRAFANA_VERSION"_armhf.deb
rm -rf grafana-enterprise_"$GRAFANA_VERSION"_armhf.deb

message info "Installing Prometheus & node-exporter..."
wget https://github.com/prometheus/prometheus/releases/download/v"$PROMETHEUS_VERSION"/prometheus-"$PROMETHEUS_VERSION".linux-armv7.tar.gz
wget https://github.com/prometheus/node_exporter/releases/download/v"$NODE_EXPORTER_VERSION"/node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7.tar.gz

tar -xvf prometheus-"$PROMETHEUS_VERSION".linux-armv7.tar.gz
tar -xvf node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7.tar.gz

rm -rf prometheus-"$PROMETHEUS_VERSION".linux-armv7.tar.gz node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7.tar.gz

sudo systemctl stop grafana-server

sudo mv prometheus-"$PROMETHEUS_VERSION".linux-armv7/ prometheus/
sudo mv node_exporter-"$NODE_EXPORTER_VERSION".linux-armv7/ node_exporter/

sudo mv prometheus/ /usr/sbin/
sudo mv node_exporter/ /usr/sbin/

sudo cp -r ./configs/prometheus.yml /usr/sbin/prometheus/
sudo cp -r ./services/prometheus.service /etc/systemd/system/prometheus.service
sudo cp -r ./services/node_exporter.service /etc/systemd/system/node_exporter.service

sudo chown -R root:root /usr/sbin/prometheus/ /usr/sbin/node_exporter/ /etc/systemd/system/prometheus.service /etc/systemd/system/node_exporter.service

sudo systemctl daemon-reload
sudo systemctl enable grafana-server prometheus.service node_exporter.service
sudo systemctl start grafana-server prometheus.service node_exporter.service
