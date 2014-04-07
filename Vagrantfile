# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "centos-6.5-x86_64-bazy84"
  #config.vm.box_url = "http://kozlov.snort.ro/vagrant/packer_centos-6.5-x86_64-bazy84_virtualbox.box"
  #
  #config.hostmanager.enabled = false
  #config.hostmanager.manage_host = false
  #config.hostmanager.ignore_private_ip = false
  #config.hostmanager.include_offline = true
  config.vm.define "node1" do |node1|
    node1.vm.box = "centos-6.5-x86_64-bazy84"
    node1.vm.box_url = "http://kozlov.snort.ro/vagrant/packer_centos-6.5-x86_64-bazy84_virtualbox.box"
    node1.vm.provision :shell, :path => "provision_puppet.sh"
    node1.vm.hostname = "node1.test.lab"
    node1.vm.network :private_network, ip: '192.168.42.2'
    node1.vm.network "forwarded_port", guest: 80, host: 8181
    #node1.hostmanager.aliases = %w(node1.localdomain node1)
  end
  config.vm.define :node2 do |node2|
    node2.vm.box = "centos-6.5-x86_64-bazy84"
    node2.vm.box_url = "http://kozlov.snort.ro/vagrant/packer_centos-6.5-x86_64-bazy84_virtualbox.box"
    node2.vm.provision :shell, :path => "provision_puppet.sh"
    node2.vm.hostname = "node2.test.lab"
    node2.vm.network :private_network, ip: '192.168.42.3'
    #node2.hostmanager.aliases = %w(node2.localdomain node2)
  end
  config.vm.define :node3 do |node3|
    node3.vm.box = "centos-6.5-x86_64-bazy84"
    node3.vm.box_url = "http://kozlov.snort.ro/vagrant/packer_centos-6.5-x86_64-bazy84_virtualbox.box"
    node3.vm.provision :shell, :path => "provision_puppet.sh"
    node3.vm.hostname = "node3.test.lab"
    node3.vm.network :private_network, ip: '192.168.42.4'
    node3.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
## enjoying ruby for each :)
  end
  (1..5).each do |i|
    config.vm.define "slave#{i}" do |slave|
      slave.vm.box = "centos-6.5-x86_64-bazy84"
      slave.vm.box_url = "http://kozlov.snort.ro/vagrant/packer_centos-6.5-x86_64-bazy84_virtualbox.box"
      slave.vm.hostname = "slave#{i}.test.lab"
      slave.vm.network :private_network, ip: "192.168.42.10#{i}"
      slave.vm.provision :shell, :path => "provision_puppet.sh"
      slave.vm.provider "virtualbox" do |v|
        v.memory = 512
      end
    end
  end
  
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision "chef_solo" do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
