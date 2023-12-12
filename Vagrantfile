Vagrant.configure("2") do |config|
  config.vm.define "ubuntu-sql-1" do |machine|
    machine.vm.box = "joaopsoliveira2003/ubuntu-focal"
    machine.vm.network "private_network", type: "static", ip: "192.168.91.111"
    config.vm.synced_folder "shared/", "/vagrant"

    machine.vm.disk :disk, size: "3GB", name: "sdb"
    machine.vm.disk :disk, size: "3GB", name: "sdc"

    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Trabalho I - Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end

    machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname ubuntu-sql-1
      chmod +x /vagrant/*.sh
      bash /vagrant/initial-setup.sh
      bash /vagrant/setup-raid.sh
      bash /vagrant/setup-glusterfs.sh
      bash /vagrant/setup-monitoring.sh
      sudo reboot
    SHELL
  end

  config.vm.define "ubuntu-sql-2" do |machine|
    machine.vm.box = "joaopsoliveira2003/ubuntu-focal"
    machine.vm.network "private_network", type: "static", ip: "192.168.91.112"
    config.vm.synced_folder "shared/", "/vagrant"
    
    machine.vm.disk :disk, size: "3GB", name: "sdb"
    machine.vm.disk :disk, size: "3GB", name: "sdc"

    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Trabalho I - Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end

    machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname ubuntu-sql-2
      chmod +x /vagrant/*.sh
      bash /vagrant/initial-setup.sh
      bash /vagrant/setup-raid.sh
      bash /vagrant/setup-glusterfs.sh
      bash /vagrant/setup-monitoring.sh
      sudo reboot
    SHELL
  end

  config.vm.define "ubuntu-web-1" do |machine|
    machine.vm.box = "joaopsoliveira2003/ubuntu-focal"
    machine.vm.network "private_network", type: "static", ip: "192.168.91.121"
    config.vm.synced_folder "shared/", "/vagrant"
    
    machine.vm.disk :disk, size: "3GB", name: "sdb"
    machine.vm.disk :disk, size: "3GB", name: "sdc"

    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Trabalho I - Sistemas Críticos"]
    end

    machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname ubuntu-web-1
      chmod +x /vagrant/*.sh
      bash /vagrant/initial-setup.sh
      bash /vagrant/setup-raid.sh
      bash /vagrant/setup-glusterfs.sh
      bash /vagrant/setup-web.sh
      bash /vagrant/setup-monitoring.sh
      sudo reboot
    SHELL
  end

  config.vm.define "ubuntu-web-2" do |machine|
    machine.vm.box = "joaopsoliveira2003/ubuntu-focal"
    machine.vm.network "private_network", type: "static", ip: "192.168.91.122"
    config.vm.synced_folder "shared/", "/vagrant"
    
    machine.vm.disk :disk, size: "3GB", name: "sdb"
    machine.vm.disk :disk, size: "3GB", name: "sdc"

    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Trabalho I - Sistemas Críticos"]
    end

    machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname ubuntu-web-2
      chmod +x /vagrant/*.sh
      bash /vagrant/initial-setup.sh
      bash /vagrant/setup-raid.sh
      bash /vagrant/setup-glusterfs.sh
      bash /vagrant/setup-web.sh
      bash /vagrant/setup-monitoring.sh
      sudo reboot
    SHELL
  end

  config.vm.define "ubuntu-haproxy-1" do |machine|
    machine.vm.box = "joaopsoliveira2003/ubuntu-focal"
    machine.vm.network "private_network", type: "static", ip: "172.20.91.200"
    machine.vm.network "private_network", type: "static", ip: "192.168.91.100"
    config.vm.synced_folder "shared/", "/vagrant"

    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Trabalho I - Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end

    machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname ubuntu-haproxy-1
      chmod +x /vagrant/*.sh
      bash /vagrant/initial-setup.sh
      bash /vagrant/setup-haproxy.sh
      sudo reboot
    SHELL
  end

  config.vm.define "ubuntu-haproxy-2" do |machine|
    machine.vm.box = "joaopsoliveira2003/ubuntu-focal"
    machine.vm.network "private_network", type: "static", ip: "172.20.91.201"
    machine.vm.network "private_network", type: "static", ip: "192.168.91.101"
    config.vm.synced_folder "shared/", "/vagrant"

    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Trabalho I - Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end

    machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname ubuntu-haproxy-2
      chmod +x /vagrant/*.sh
      bash /vagrant/initial-setup.sh
      bash /vagrant/setup-haproxy.sh
      sudo reboot
    SHELL
  end

  config.vm.define "ubuntu-client" do |machine|
    machine.vm.box = "joaopsoliveira2003/ubuntu-focal"
    machine.vm.network "private_network", type: "static", ip: "172.20.91.10"
    config.vm.synced_folder "shared/", "/vagrant"

    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Trabalho I - Sistemas Críticos"]
    end

    machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname ubuntu-client
      chmod +x /vagrant/*.sh
      bash /vagrant/initial-setup.sh
      bash /vagrant/setup-gui.sh
      sudo reboot
    SHELL
  end
end
