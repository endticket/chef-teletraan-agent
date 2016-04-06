# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.network :private_network, :ip => "192.168.200.68"
  config.vm.provider :virtualbox do |v|
  	v.customize ["modifyvm", :id, "--memory", 512]
  end

  config.vm.provision 'chef_solo' do |chef|
    chef.add_recipe 'git'
    chef.add_recipe 'python'
    chef.add_recipe 'teletraan-agent::default'
    chef.arguments = '-l debug'
    chef.arguments= '--force-logger info'
    chef.cookbooks_path = ".."
  end
end
