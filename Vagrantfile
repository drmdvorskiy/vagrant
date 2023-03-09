Vagrant.configure("2") do |config|

  $pub_ssh_keys = <<-SCRIPT
  mkdir /root/.ssh && chmod 600 /root/.ssh
  
  echo -e '
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7WPr8GJ4MQrL1ZSwcnKExfjY6XB143AM6ZMhP+UwJKaA/7wlRW80et/S5Zn/+L1Eo47JN5g5J9g8b67mdQlNLOOI1ovivxQ7MonQ4zWdscb81NM09z5EmVDgsYjSpFjKvHqEmMrQnGa8S2+ncJogXPyTzmdDgfbq48ITqMGy8JNiuXnk7WwfVjzN7r3dtlEERGdpSav5CfpwfOhgafy/T3QOwVSUN5KYFs+hqV4mN843g9H3e0cSkBzM1onptRdH1v7XiyAMGBrZHL57WOX+NT6YJAwTNlzPOdJDMQ2xwM1/KPcfDi0YXFeZLL1981MmgW35he8ZBexuzjCWFBAlx root@dvorskiy\n
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPoMqxfCVcAckp/ewyHwPusN1ir5aARVnEhmu867eaXji+QIu/TuguZX5FeHv5GZmSQGR0O24QYcRHptkQVwGbDyFZ9x+OMcjWeljPo65U0Yl3bqS9nrkc8/MXwTarCPH7LFrTXaXD++C9dUaZFAypz35B0Xzo1+YiUyO2ezz73GoF5nx1OJZW5tWgoL2u6Rqg487NsVT7u0ZcNFyk/g7YDIVy5y8KCy6V8DQA/qikg3lbBFO4q45xQHUc5wWuk2sa72OKWPAOqW+k5Z9oYO9OviPFYRMzJlva//Woxg5Le1iVKxFOFuAIcapjPN6BOjw45mIqmmNVuA0lHLnYhNEl root@tarasov\n
  ' > /root/.ssh/authorized_keys
  
  sed -in 's/\#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config && \
  systemctl restart sshd
  SCRIPT
   

  config.vm.provision "shell", privileged: true, inline: $pub_ssh_keys
    

  config.vm.define "proebot" do |proebot|
    proebot.vm.box = "almalinux/8"
    proebot.vm.hostname = "proebot"
    proebot.vm.network "private_network", ip: "192.168.56.2", hostname: true
    proebot.vm.network "forwarded_port", id: 'ssh', guest: 22, host: 2222
    proebot.vm.synced_folder ".", "/vagrant", disabled: true
    proebot.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end
  end
  
end
