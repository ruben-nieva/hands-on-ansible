# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "control" do |acs|
    acs.vm.box = "ubuntu/trusty64"
    acs.vm.hostname = "control"
    acs.vm.network "private_network", ip: "192.168.33.10"
    acs.vm.provision :shell, :path => "scripts/bootstrap.sh"
  end

  config.vm.define "web" do |web|
    web.vm.box="centos/7"
    web.ssh.insert_key = false
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.33.20"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.provision :shell, :path => "scripts/bootstrap-centos.sh"
  end

  config.vm.define "db" do |db|
    db.vm.box = "bento/centos-7.1"
    db.ssh.insert_key = false
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.33.30"
    db.vm.provision :shell, :path => "scripts/bootstrap-centos.sh"
  end

  config.vm.define "labipa" do |ipa|
    ipa.vm.box = "bento/centos-7.1"
    ipa.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
         vb.cpus = "2"
      end
    ipa.ssh.insert_key = false
    ipa.vm.hostname = "labipa.example.com"
    ipa.vm.network "private_network", ip: "192.168.33.40"
    ipa.vm.provision :hosts do |provisioner|
      provisioner.add_host '192.168.33.40', ['labipa.example.org']
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/127.0.1.1.*labipa.example.org.*//' /etc/hosts
    SHELL
    ipa.vm.provision :shell, :path => "scripts/bootstrap-centos.sh"
  end
  
 
end
