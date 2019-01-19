
# -*- mode: ruby -*-
# vi: set ft=ruby :

### configuration parameters
BOX_BASE = "ubuntu/xenial64"

### node configuration
APP_IP = "172.81.81.2"
LOG_IP = "172.81.81.3"
APP_HOSTNAME = "app01"
LOG_HOSTNAME = "log01"

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

  config.vm.define "#{LOG_HOSTNAME}" do |node|
    node.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 1
    end
    node.vm.box = BOX_BASE
    node.vm.box_check_update = false
    node.vm.hostname = "#{LOG_HOSTNAME}"
    node.vm.network "private_network", ip: LOG_IP, netmask: "255.255.255.0"
    # warning: If you get "Hash sum mismatch" error while provisioning, please uncomment it!
    #node.vm.provision "shell", inline: "sudo rm -rf /var/lib/apt/lists/* && sudo apt-get update -o Acquire::CompressionTypes::Order::=gz"
    node.vm.provision "shell" do |s|
      s.path = "scripts/log-machine.sh"
      s.args = [LOG_IP, "/etc/elasticsearch/elasticsearch.yml", "/etc/kibana/kibana.yml"]
    end
  end

  config.vm.define "#{APP_HOSTNAME}" do |node|
    node.vm.provider :virtualbox do |vb|
      vb.memory = 512
      vb.cpus = 1
    end
    node.vm.box = BOX_BASE
    node.vm.box_check_update = false
    node.vm.hostname = "#{APP_HOSTNAME}"
    node.vm.network "private_network", ip: APP_IP, netmask: "255.255.255.0"
    # warning: If you get "Hash sum mismatch" error while provisioning, please uncomment it!
    #node.vm.provision "shell", inline: "sudo rm -rf /var/lib/apt/lists/* && sudo apt-get update -o Acquire::CompressionTypes::Order::=gz"
    node.vm.provision "shell" do |s|
      s.path = "scripts/app-machine.sh"
    end
  end
end