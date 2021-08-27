#!/bin/bash

# Versions
VERSION_GRAFANA='7.3.6'
VERSION_PROMETHEUS='2.24.0'
VERSION_NODE_EPORTER='1.0.1'

message info "Installing grafana/prometheus..."
message info "Updating system cache..." ; sudo apt update &> /dev/null

# Prometheus install
echo
message info "Installing prometheus..."
	wget https://github.com/prometheus/prometheus/releases/download/v$VERSION_PROMETHEUS/prometheus-$VERSION_PROMETHEUS.linux-armv7.tar.gz
	tar xfz prometheus-$VERSION_PROMETHEUS.linux-armv7.tar.gz
	rm -rf prometheus-$VERSION_PROMETHEUS.linux-armv7.tar.gz
	sudp mv prometheus-$VERSION_PROMETHEUS.linux-armv7/ /usr/sbin/prometheus/
	sudo cp -r rpi-nas/config_files/prometheus.service /etc/systemd/system/
	sudo cp -r rpi-nas/config_files/prometheus.yml /usr/sbin/prometheus/
    sudo chown -R root:root /usr/sbin/prometheus/
    sudo chown -R root:root /etc/systemd/system/prometheus.service
	sudo systemctl daemon-reload
	sudo systemctl start prometheus
	sudo systemctl status prometheus
	sudo systemctl enable prometheus

# Grafana install
echo
message info "Installing grafana..."
	wget https://dl.grafana.com/oss/release/grafana-$VERSION_GRAFANA.linux-armv7.tar.gz
	tar xfz grafana-$VERSION_GRAFANA.linux-armv7.tar.gz
	rm -rf grafana-$VERSION_GRAFANA.linux-armv7.tar.gz
	sudo mv grafana-$VERSION_GRAFANA/ /usr/sbin/grafana/
	sudo cp -r rpi-nas/config_files/grafana.service /etc/systemd/system/
    sudo chown -R root:root /usr/sbin/grafana/
    sudo chown -R root:root /etc/systemd/system/grafana.service
	sudo systemctl daemon-reload
	sudo systemctl start grafana
	sudo systemctl status grafana
	sudo systemctl enable grafana

# Node exporter install
echo
message info "Installing node exporter..."
	wget https://github.com/prometheus/node_exporter/releases/download/$VERSION_NODE_EPORTER/node_exporter-$VERSION_NODE_EPORTER.linux-armv7.tar.gz
	tar xfz node_exporter-$VERSION_NODE_EPORTER.linux-armv7.tar.gz
	rm -rf node_exporter-$VERSION_NODE_EPORTER.linux-armv7.tar.gz
    sudp mv node_exporter-$VERSION_NODE_EPORTER.linux-armv7/ /usr/sbin/node_exporter/
	sudo cp -r rpi-nas/config_files/node_exporter.service /etc/systemd/system/
    sudo chown -R root:root /usr/sbin/node_exporter/
    sudo chown -R root:root /etc/systemd/system/node_exporter.service
	sudo systemctl daemon-reload
	sudo systemctl start node_exporter.service
	sudo systemctl status node_exporter.service
	sudo systemctl enable node_exporter.service
	sudo cp -rf rpi-nas/config_files/prometheus.yml /usr/sbin/prometheus/

sudo systemctl daemon-reload
sudo systemctl restart grafana.service prometheus.service node_exporter.service
