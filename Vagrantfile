Vagrant.configure(2) do |config|

   config.vm.define "control-server" do |cs|
      cs.vm.box = "ubuntu/xenial64"
      cs.vm.network "private_network", ip: "192.168.33.111"
      cs.vm.hostname = "control-server"
      cs.vm.provision "shell", path: "bundle/Prep.sh"
      cs.vm.provider "virtualbox" do |sys|
        sys.memory = "1024"
        sys.cpus = 2
        # sys.gui = true
      end

      cs.vm.provision "file", source: "bundle/id_rsa.pub", destination: "/tmp/id_rsa.pub"
      cs.vm.provision "file", source: "bundle/id_rsa", destination: "/tmp/id_rsa"
      cs.vm.provision "shell", path: "bundle/ControlServerKeyPlace.sh"
   
      cs.vm.provision "shell", inline: <<-SHELL
        echo "192.168.33.111 control-server" >> /etc/hosts
        echo "192.168.33.112 ansible-ubuntu" >> /etc/hosts
        echo "192.168.33.113 ansible-centos" >> /etc/hosts
      SHELL

   end

   config.vm.define "ansible-ubuntu" do |n1|
      n1.vm.box = "ubuntu/xenial64"
      n1.vm.network "private_network", ip: "192.168.33.112"
      n1.vm.hostname = "ansible-ubuntu"
    
      n1.vm.provision "file", source: "bundle/id_rsa.pub", destination: "/tmp/authorized_keys"
      n1.vm.provision "shell", path: "bundle/AuthKey.sh"

      n1.vm.provision "shell", inline: <<-SHELL
        echo "192.168.33.111 control-server" >> /etc/hosts
        echo "192.168.33.112 ansible-ubuntu" >> /etc/hosts
        echo "192.168.33.113 ansible-centos" >> /etc/hosts
      SHELL

   end

   config.vm.define "ansible-centos" do |n2|
      n2.vm.box = "centos/7"
      n2.vm.network "private_network", ip: "192.168.33.113"
      n2.vm.hostname = "ansible-centos"

      n2.vm.provision "file", source: "bundle/id_rsa.pub", destination: "/tmp/authorized_keys"
      n2.vm.provision "shell", path: "bundle/AuthKey.sh"
      
      n2.vm.provision "shell", inline: <<-SHELL
        echo "192.168.33.111 control-server" >> /etc/hosts
        echo "192.168.33.112 ansible-ubuntu" >> /etc/hosts
        echo "192.168.33.113 ansible-centos" >> /etc/hosts
      SHELL

   end

end
