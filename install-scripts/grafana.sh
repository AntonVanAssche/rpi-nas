#!/bin/bash

grafanaVersion="8.4.2"
prometheusVersion="2.33.3"
nodeExporterVersion="1.3.1"

message info "Installing Grafana-server..."
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_"$grafanaVersion"_armhf.deb
sudo dpkg -i grafana-enterprise_"$grafanaVersion"_armhf.deb
rm -rf grafana-enterprise_"$grafanaVersion"_armhf.deb

message info "Installing Prometheus & node-exporter..."
wget https://github.com/prometheus/prometheus/releases/download/v"$prometheusVersion"/prometheus-"$prometheusVersion".linux-armv7.tar.gz
wget https://github.com/prometheus/node_exporter/releases/download/v"$nodeExporterVersion"/node_exporter-"$nodeExporterVersion".linux-armv7.tar.gz

tar -xvf prometheus-"$prometheusVersion".linux-armv7.tar.gz
tar -xvf node_exporter-"$nodeExporterVersion".linux-armv7.tar.gz

rm -rf prometheus-"$prometheusVersion".linux-armv7.tar.gz node_exporter-"$nodeExporterVersion".linux-armv7.tar.gz

sudo systemctl stop grafana-server

sudo mv prometheus-"$prometheusVersion".linux-armv7/ prometheus/
sudo mv node_exporter-"$nodeExporterVersion".linux-armv7/ node_exporter/

sudo mv prometheus/ /usr/sbin/
sudo mv node_exporter/ /usr/sbin/

sudo cp -r $dir/configs/prometheus.yml /usr/sbin/prometheus/
sudo cp -r $dir/services/prometheus.service /etc/systemd/system/prometheus.service
sudo cp -r $dir/services/node_exporter.service /etc/systemd/system/node_exporter.service

sudo chown -R root:root /usr/sbin/prometheus/ /usr/sbin/node_exporter/ /etc/systemd/system/prometheus.service /etc/systemd/system/node_exporter.service

sudo systemctl daemon-reload
sudo systemctl enable grafana-server prometheus.service node_exporter.service
sudo systemctl start grafana-server prometheus.service node_exporter.service
