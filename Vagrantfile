Vagrant.configure("2") do |config|

  config.vm.provision "file", source: "/home/dvorskiy/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    mkdir /root/.ssh && chmod 600 /root/.ssh && \
    cat /home/vagrant/.ssh/id_rsa.pub > /root/.ssh/authorized_keys && \
    sed -in 's/\#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config && \
    systemctl restart sshd
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
end
