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

  #########################################################################
  # Virtualbox configuration - the default provider for running a local VM
  #########################################################################

  config.vm.provider :virtualbox do |vb, override|

    # The Virtualbox image
    #override.vm.box = "precise64"
    override.vm.box = "ubuntu/trusty64"
#    override.vm.box = "bento/ubuntu-16.04"

    # You might have to play around with the following two lines if you have to install
    # the virtual mashine on a flash or usb-flash drive.
    # See https://github.com/rreben/Mining-the-Social-Web-2nd-Edition for details.
    # config.ssh.private_key_path = "/Users/rupertrebentisch/certificates/learn-how-to-code_key"
    # config.ssh.insert_key = false


    # Port forwarding details
    # Only port 8888 is essential to initially access jupyter Notebook and get started.

    # jupyter Notebook
    override.vm.network :forwarded_port, host: 8888, guest: 8888

    # You can increase the default amount of memory used by your VM by
    # adjusting this value below (in MB) and reprovisioning.
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Chef-Solo provisioning
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :anaconda => {
        :accept_license => 'yes',
      }
    }
    chef.run_list = [
      'recipe[anaconda::default]',
      'recipe[anaconda::shell_conveniences]',
      'recipe[anaconda::notebook_server]',
    ]

    # chef.custom_config_path = 'vagrant-solo.rb'
  end
end
