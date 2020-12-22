#!/bin/bash

# Versions
VERSION_GRAFANA='7.3.5'
VERSION_PROMETHEUS='2.23.0'
VERSION_NODE_EPORTER='1.0.1'

echo -e "[i] ${cyan}Installing grafana/prometheus. ${reset}"
echo -e "[i] ${cyan}Updating system cache... ${reset}" ; sudo apt update &> /dev/null

# Prometheus install
echo
echo -e "[i] ${cyan}Installing prometheus. ${reset}"
	wget https://github.com/prometheus/prometheus/releases/download/v$VERSION_PROMETHEUS/prometheus-$VERSION_PROMETHEUS.freebsd-armv7.tar.gz
	tar xfz prometheus-$VERSION_PROMETHEUS.linux-arv7.tar.gz
	rm -rf prometheus-$VERSION_PROMETHEUS.linux-arv7.tar.gz
	mv prometheus-2.23.0.linux-armv7/ prometheus/
	sudo cp -r NAS/config_files/prometheus.service /etc/systemd/system/
	sudo cp -r NAS/config_files/prometheus.yml prometheus/
	sudo systemctl daemon-reload
	sudo systemctl start prometheus
	sudo systemctl status prometheus
	sudo systemctl enable prometheus

# Grafana install
echo
echo -e "[i] ${cyan}Installing grafana. ${reset}"
	wget https://dl.grafana.com/oss/release/grafana-$VERSION_GRAFANA.linux-armv7.tar.gz
	tar xfz grafana-$VERSION_GRAFANA.linux-armv7.tar.gz
	rm -rf grafana-$VERSION_GRAFANA.linux-armv7.tar.gz
	mv grafana-7.3.5/ grafana/
	sudo cp -r NAS/config_files/grafana.service /etc/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl start grafana
	sudo systemctl status grafana
	sudo systemctl enable grafana

# Node exporter install
echo
echo -e "[i] ${cyan}Installing node exporter. ${reset}"
	wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-armv7.tar.gz
	tar xfz node_exporter-1.0.1.linux-armv7.tar.gz
	mv node_exporter-1.0.1.linux-armv7/ node_exporter/
	rm -rf node_exporter-1.0.1.linux-armv7.tar.gz
	sudo cp -r NAS/config_files/node_exporter.service /etc/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl start node_exporter.service
	sudo systemctl status node_exporter.service
	sudo systemctl enable node_exporter.service
	sudo cp -rf bash-scripts/server-setup/prometheus.yml /home/pi/prometheus/

sudo systemctl daemon-reload
