# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

domain = 'puppetlabs.vm'

boxes = [
  {
    :name           =>  'buildbox',
    :primary        =>  'true',
    #:extra_script   =>  '/root/pe-install/scripts/agent02.sh'
  },
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
BOX_TIMEOUT             = 300


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  boxes.each do |box|
    config.hostmanager.enabled            = false
    config.hostmanager.manage_host        = false
    config.hostmanager.ignore_private_ip  = false
    config.hostmanager.include_offline    = false

    config.vm.define box[:name], primary: box[:primary] do |node|
      node.vm.box                 = 'puppetlabs/centos-6.5-64-nocm'
      node.vm.hostname            = box[:name] + "." + domain

      node.vm.boot_timeout        = BOX_TIMEOUT
      node.vm.synced_folder '.', '/vagrant', :disabled => true
      node.vm.synced_folder 'sync', '/root/pe-install'

      config.vm.provider "vmware_fusion" do |v|
        if box[:cpus]
          v.vmx["numvcpus"] = box[:cpus]
        end
        if box[:mem]
          v.vmx["memsize"] = box[:mem]
        end
      end
      node.hostmanager.aliases      = [ box[:name] ]

      node.vm.provision :shell, :privileged => false, :inline => "sudo yum -y -q install screen"

      node.vm.provision :shell, :privileged => true, :inline => '/root/pe-install/scripts/base.sh'
      node.vm.provision :hostmanager

      if box[:extra_script]
        node.vm.provision :shell, :privileged => true, :inline => box[:extra_script]
      end

      node.ssh.pty                  = false
    end
  end
end
