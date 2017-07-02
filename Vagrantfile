# -*- mode: ruby -*-
# vi: set ft=ruby :

###########################################################################
# This configuration file is the starting point for understanding how the
# virtual machine is configured and provides a default provider that uses
# Virtualbox to provide virtualization.
#
# See http://docs.vagrantup.com/v2/vagrantfile/index.html for additional
# details on Vagrantfile configuration in general.
###########################################################################

Vagrant.configure("2") do |config|

  # SSH forwarding: See https://help.github.com/articles/using-ssh-agent-forwarding
  config.ssh.forward_agent = true

  config.vm.box = "ubuntu/trusty64"

  # You might have to play around with the following two lines if you have to install
  # the virtual mashine on a flash or usb-flash drive.
  # See https://github.com/rreben/Mining-the-Social-Web-2nd-Edition for details.
  # config.ssh.private_key_path = "/Users/rupertrebentisch/certificates/basket4py_key"
  # config.ssh.insert_key = false

  # jupyter Notebook
  config.vm.synced_folder "notebooks/", "/home/vagrant/notebooks"
  config.vm.network "private_network", ip: "192.168.33.12"

  #########################################################################
  # Virtualbox configuration - the default provider for running a local VM
  #########################################################################

  config.vm.provider :virtualbox do |vb, override|
    # You can increase the default amount of memory used by your VM by
    # adjusting this value below (in MB) and reprovisioning.
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Ansible provisioning - 
  # this will run ansible on the VM so its not necessary to install on the host
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision/playbook.yml"
    ansible.install_mode = "default"
    #ansible.version = "latest"
    ansible.verbose = "true"
    ansible.galaxy_role_file = "provision/requirements.yml"
    ansible.raw_arguments = ["--module-path", "/vagrant/provision/library/ansible-conda"]
  end

end
