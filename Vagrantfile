# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false

  config.vm.define "kube-master" do |s|
    s.vm.network "private_network", ip: "10.7.0.10"
    s.vm.network "forwarded_port", guest: 80, host: 18080
    s.vm.hostname = "kube-master"
    s.vm.provider "virtualbox" do |v|
      v.name = "kube-master"
      v.memory = 2048
      v.cpus = 1
    end
  end

  (1..2).each do |n|
    config.vm.define "kube-node#{n}" do |s|
      s.vm.network "private_network", ip: "10.7.0.1#{n}"
      s.vm.hostname = "kube-node#{n}"
      s.vm.provider "virtualbox" do |v|
        v.name = "kube-node#{n}"
        v.memory = 2048
        v.cpus = 1
      end
    end
  end

end
