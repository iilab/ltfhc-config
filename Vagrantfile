# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "katombo" => ["ffuenf\/debian-7.5.0-amd64", "192.168.52.1", "2220", "443"],
  "kalemie" => ["ffuenf\/debian-7.5.0-amd64", "192.168.51.1", "2221", "8443"]
#  "namansi" => ["ffuenf\/ubuntu-13.10-server-amd64", "192.168.42.1", "2210", "8444"],
#  "kirando" => ["ffuenf\/ubuntu-13.04-server-amd64", "192.168.43.1", "2211", "8445"],
#  "nkasi" => ["ffuenf\/ubuntu-13.04-server-amd64", "192.168.44.1", "2212", "8446"],
#  "ltfhc" => ["ffuenf\/ubuntu-13.04-server-amd64", "192.168.100.1", "2213", "8447"]
}

Vagrant.configure("2") do |config|
  hosts.each do |name, var|
    config.vm.define name do |machine|
      machine.vm.box = "%s" % var[0]
      machine.vm.hostname = "%s" % name
      machine.vm.network :private_network, ip: var[1]
      machine.vm.network :forwarded_port, guest: 22, host: var[2]
      machine.vm.network :forwarded_port, guest: 443, host: var[3]
      machine.ssh.port = var[2]
      machine.vm.provider "virtualbox" do |v|
          v.name = name
          v.gui = false
          v.customize ["modifyvm", :id, "--memory", 1024]
      end
    end
  end
end
