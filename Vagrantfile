# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to base build on.
  config.vm.box = "ubuntu_xenial_64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  
  # Set this if you plan to use web server such as Apache, Nginx etc ..
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

  # Common dev ports
  config.vm.network :forwarded_port, guest: 5000, host: 5000, auto_correct: true
  config.vm.network :forwarded_port, guest: 4200, host: 4200, auto_correct: true
  config.vm.network :forwarded_port, guest: 8019, host: 8019, auto_correct: true
  config.vm.network :forwarded_port, guest: 6379, host: 6379, auto_correct: true

  # Set this if you are only using 1 vagrant, otherwise best left to Vagrant to assign
  #config.vm.network :forwarded_port, guest: 22, host: 2222, auto_correct: true
  
  # Open a range of ports, if you're running multiple vagrants then adapt the range
  # to avoid port collision.
  for i in 60000 .. 60020
     config.vm.network :forwarded_port, guest: i, host: i, auto_correct: true
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # You can either directly configure this through VirtualBox GUI or
  # see https://www.virtualbox.org/manual/ch09.html for available options
  # and set them here. Default 2 CPUs 2GB RAM
  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "3072"]
     vb.customize ["modifyvm", :id, "--cpuhotplug", "on"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  # Shared directory between guest and host.
  config.vm.synced_folder "/Users/mgoodnight/Documents/vagrant_share", "/home/vagrant/vscode"

  ######################### PROVISIONING #############################
  
  #As root user:
  #OS packages and common tools (includes git)
  config.vm.provision "shell", path: "provisions/scripts/os_essential_packages.sh"

  #As root user
  #perlbrew and such.
  config.vm.provision "shell", path: "provisions/scripts/developer_perl_tools_as_root.sh"

  #As vagrant user
  #dzil, pertidy and such
  config.vm.provision "shell", path: "provisions/scripts/developer_perl_tools_as_user.sh", privileged: false

  #vim, bash configs
  config.vm.provision "shell", path: "provisions/scripts/environment_configs.sh", privileged: false

  # MySQL
  config.vm.provision "shell", path: "provisions/scripts/mysql_install.sh"

  #Redis
  config.vm.provision "shell", path: "provisions/scripts/redis_install.sh"

  #Javascript - NodeJS/npm, angluar-cli
  config.vm.provision "shell", path: "provisions/scripts/javascript_install.sh"

end