# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
  "manager2"   => {"memory" => 1048, "cpus" => 1, "ip" => "10", "image" => "debian/buster64"},
  "node1"   => {"memory" => 1024, "cpus" => 1, "ip" => "11", "image" => "debian/buster64"},
  "node2"   => {"memory" => 1024, "cpus" => 1, "ip" => "12", "image" => "debian/buster64"},
  "node3"   => {"memory" => 1024, "cpus" => 1, "ip" => "13", "image" => "debian/buster64"},
}

Vagrant.configure("2") do |config|
  
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.iamcflb.dev"
      machine.vm.network "private_network", ip: "10.0.0.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpus"]
        vb.customize ["modifyvm", :id, "--groups", "/Docker-Lab"]
      end
    #  machine.vm.provision "shell", path: "docker.sh"
      if "#{conf["image"]}" == "centos/7"
        machine.vm.provision "shell", inline: "sudo systemctl start docker && sudo systemctl enable docker"
      end
      # if "#{name}" == "manager2"
      #   machine.vm.provision "shell", path: "manager.sh"
      # else
      #  machine.vm.provision "shell", path: "worker.sh"
      # end
    end
  end

end
