# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "katombo" => ["192.168.52.1", "2220", "ffuenf\/debian-7.5.0-amd64"],
  "kalemie" => ["192.168.51.1", "2221", "ffuenf\/debian-7.5.0-amd64"]
#  "namansi" => ["192.168.42.1", "2210", "ffuenf\/ubuntu-13.10-server-amd64"],
#  "kirando" => ["192.168.43.1", "2211", "ffuenf\/ubuntu-13.04-server-amd64"],
#  "nkasi" => ["192.168.44.1", "2212", "ffuenf\/ubuntu-13.10-server-amd64"],
#  "ltfhc" => ["192.168.100.1", "2213", "ffuenf\/ubuntu-13.10-server-amd64"]
}

Vagrant.configure("2") do |config|
  hosts.each do |name, var|
    config.vm.define name do |machine|
      machine.vm.box = "%s" % var[2]
      machine.vm.hostname = "%s" % name
      machine.vm.network :private_network, ip: var[0]
      machine.vm.network :forwarded_port, guest: 22, host: var[1]
      machine.ssh.port = var[1]
      machine.vm.provider "virtualbox" do |v|
          v.name = name
          v.gui = false
          v.customize ["modifyvm", :id, "--memory", 512]
      end
    end
  end
end
