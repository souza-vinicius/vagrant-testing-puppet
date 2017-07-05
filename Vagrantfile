# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure # configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # config.vm.provider "virtualbox" do |v|
  #   v.memory = 1024
  #   v.cpus = 2
  # end

  config.vm.define "puppetmaster" do |pm|


    pm.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 2
    end

    pm.vm.box      = "centos/7"
    pm.vm.network  "private_network", ip: "192.168.33.10"
    pm.vm.hostname = "puppetmaster"
    #pm.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    #pm.vm.synced_folder "puppetlabs-code/", "/etc/puppetlabs/code/"
    #pm.vm.synced_folder "puppetlabs-code/hieradata", "/etc/puppetlabs/code/environments/production/hieradata"
    #pm.vm.synced_folder "puppetlabs-code/manifests", "/etc/puppetlabs/code/environments/production/manifests"
    #pm.vm.synced_folder "puppetlabs-code/modules", "/etc/puppetlabs/code/environments/production/modules"

    # Instalando o agente puppet para permitir o provision
    pm.vm.provision "shell", inline: "rpm -ihv http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm"
    pm.vm.provision "shell", inline: "sudo yum -y install puppet"
    #pm.vm.provision "shell", inline: "sudo ln -s /opt/VBoxGuestAdditions-5.1.22/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions"
    # Apontando para os módulos de instalação do puppetserver
    pm.vm.provision :puppet do |puppet|
      # puppet.synced_folder_type = "virtualbox"
      puppet.manifests_path   = "provision/puppet/manifests"
      puppet.manifest_file    = "install-puppetserver.pp"
      puppet.module_path      = "provision/puppet/modules"
      puppet.environment_path = "environments"
      puppet.environment      = "production"
    end
  end

  config.vm.define "puppet-agent-centos" do |pac|
    pac.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 2
    end

    pac.vm.box      = "centos/7"
    pac.vm.network  "private_network", ip: "192.168.33.11"
    pac.vm.hostname = "centos-agent"

    # pac.vm.provision "shell", inline: "sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions"
    # Instalando o agente puppet para permitir o provision
    pac.vm.provision "shell", inline: "rpm -ihv http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm"
    pac.vm.provision "shell", inline: "sudo yum -y install puppet"

    pac.vm.provision :puppet do |puppet|
      puppet.manifests_path   = "provision/puppet/manifests"
      puppet.manifest_file    = "install-puppetagent.pp"
      puppet.module_path      = "provision/puppet/modules"
      puppet.environment_path = "environments"
      puppet.environment      = "production"
    end
  end

  config.vm.define "puppet-agent-ubuntu" do |pau|
    pau.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 2
    end

    pau.vm.box      = "ubuntu/xenial64"
    pau.vm.network  "private_network", ip: "192.168.33.12"
    pau.vm.hostname = "ubuntu-agent"

    #pau.vm.provision "shell", inline: "sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions"
    # Instalando o agente puppet para permitir o provision
    pau.vm.provision "shell", inline: "wget http://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb"
    pau.vm.provision "shell", inline: "sudo dpkg -i /home/ubuntu/puppetlabs-release-pc1-xenial.deb"
    pau.vm.provision "shell", inline: "sudo apt-get update"
    pau.vm.provision "shell", inline: "sudo apt-get install puppet -y"

    pau.vm.provision :puppet do |puppet|
      puppet.manifests_path   = "provision/puppet/manifests"
      puppet.manifest_file    = "install-puppetagent.pp"
      puppet.module_path      = "provision/puppet/modules"
      puppet.environment_path = "environments"
      puppet.environment      = "production"
    end
  end
end
