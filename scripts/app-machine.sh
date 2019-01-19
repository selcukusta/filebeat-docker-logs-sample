#!/bin/sh
# Docker version for ubuntu/xenial64
export DOCKER_VERSION=18.06.1~ce~3-0~ubuntu
echo "running apt-get update and installing some packages"
sudo apt-get update && sudo apt-get install -yq apt-transport-https \
  linux-image-extra-$(uname -r) \
  linux-image-extra-virtual \
  ca-certificates \
  default-jdk
sudo apt-get install -y language-pack-en
sudo locale-gen en_US.UTF-8
echo "add docker apt repository and gpg key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

echo "installing docker"
sudo apt-get update && sudo apt-get install -yq docker-ce=$DOCKER_VERSION

echo "installing filebeat"
sudo curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.5.4-amd64.deb
sudo dpkg -i filebeat-6.5.4-amd64.deb
cp /vagrant/configurations/filebeat.yml /etc/filebeat/filebeat.yml
sudo systemctl enable filebeat.service
sudo systemctl start filebeat.service