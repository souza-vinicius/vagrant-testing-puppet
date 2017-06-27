# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.define "puppetmaster" do |pm|
    pm.vm.box = "centos/7"
    pm.vm.network "private_network", ip: "192.168.33.10"
    pm.vm.hostname = "puppetmaster"
    pm.vm.synced_folder "puppetlabs-code/", "/etc/puppetlabs/code/"
    #pm.vm.synced_folder "puppetlabs-code/hieradata", "/etc/puppetlabs/code/environments/production/hieradata"
    #pm.vm.synced_folder "puppetlabs-code/manifests", "/etc/puppetlabs/code/environments/production/manifests"
    #pm.vm.synced_folder "puppetlabs-code/modules", "/etc/puppetlabs/code/environments/production/modules"
  end

  config.vm.define "puppet-agent-centos" do |pac|
    pac.vm.box = "centos/7"
    pac.vm.network "private_network", ip: "192.168.33.11"
    pac.vm.hostname = "centos-agent"
  end

  config.vm.define "puppet-agent-ubuntu" do |pau|
    pau.vm.box = "ubuntu/xenial64"
    pau.vm.network "private_network", ip: "192.168.33.12"
    pau.vm.hostname = "ubuntu-agent"
  end

end
