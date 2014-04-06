# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "namansi-saucy" => ["192.168.42.1","ffuenf\/ubuntu-13.10-server-amd64"],
  "kirando-raring" => ["192.168.43.1","ffuenf\/ubuntu-13.04-server-amd64"],
  "nkasi-raring-weird" => ["192.168.44.1","ffuenf\/ubuntu-13.10-server-amd64"],
  "ltfhc-quantal" => ["192.168.100.1","chef\/ubuntu-12.10"]
}

Vagrant.configure("2") do |config|
  hosts.each do |name, var|
    config.vm.define name do |machine|
      machine.vm.box = "%s" % var[1]
      machine.vm.hostname = "%s" % name
      machine.vm.network :private_network, ip: var[0]
      machine.vm.provider "virtualbox" do |v|
          v.name = name
          v.customize ["modifyvm", :id, "--memory", 512]
      end
    end
  end
end
