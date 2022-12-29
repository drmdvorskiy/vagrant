Vagrant.configure("2") do |config|

  config.vm.provision "file", source: "/home/dvorskiy/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL

  config.vm.define "master" do |master|
    master.vm.box = "almalinux/8"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.56.2", hostname: true
    master.vm.synced_folder ".", "/vagrant", disabled: true
    master.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end
  config.vm.define "master1" do |master1|
    master1.vm.box = "almalinux/8"
    master1.vm.hostname = "master1"
    master1.vm.network "private_network", ip: "192.168.56.3", hostname: true
    master1.vm.synced_folder ".", "/vagrant", disabled: true
    master1.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end
  config.vm.define "master3" do |master3|
    master3.vm.box = "almalinux/8"
    master3.vm.hostname = "master3"
    master3.vm.network "private_network", ip: "192.168.56.4", hostname: true
    master3.vm.synced_folder ".", "/vagrant", disabled: true
    master3.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end
  config.vm.define "master4" do |master4|
    master4.vm.box = "almalinux/8"
    master4.vm.hostname = "master4"
    master4.vm.network "private_network", ip: "192.168.56.5", hostname: true
    master4.vm.synced_folder ".", "/vagrant", disabled: true
    master4.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end
  config.vm.define "master5" do |master5|
    master5.vm.box = "almalinux/8"
    master5.vm.hostname = "master5"
    master5.vm.network "private_network", ip: "192.168.56.6", hostname: true
    master5.vm.synced_folder ".", "/vagrant", disabled: true
    master5.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end
end
