#!/bin/sh
echo "running apt-get update and installing some packages"
sudo apt-get update && sudo apt-get install -yq apt-transport-https \
  linux-image-extra-$(uname -r) \
  linux-image-extra-virtual \
  ca-certificates \
  default-jdk
sudo apt-get install -y language-pack-en
sudo locale-gen en_US.UTF-8

echo "installing elasticsearch"
cd /tmp
sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.deb
sudo dpkg -i elasticsearch-6.5.4.deb
sudo sed -i -E "s/#(http.port: 9200)/\1/g" $2
sudo sed -i -E 's/#(network.host): 192.168.0.1/\1: '"$1"'/g' $2
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

echo "installing kibana"
sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-6.5.4-amd64.deb
shasum -a 512 kibana-6.5.4-amd64.deb 
sudo dpkg -i kibana-6.5.4-amd64.deb
sudo sed -i -E "s/#(server.port: 5601)/\1/g" $3
sudo sed -i -E 's/#(server.host): "localhost"/\1: '"$1"'/g' $3
sudo sed -i -E 's/#(elasticsearch.url): "http:\/\/localhost:9200"/\1: "http:\/\/'"$1"':9200"/' $3
sudo systemctl enable kibana.service
sudo systemctl start kibana.service