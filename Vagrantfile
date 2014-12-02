Vagrant.require_version ">= 1.3.5"

def define_vm(vm_config, vm_name, vm_namespace, vm_ip, vm_dns_patterns, provision_file)
  vm_config.vm.define vm_name do |box|
    box.vm.network :private_network, ip: vm_ip, netmask: '255.255.255.0'
    box.vm.hostname = "#{vm_name}-#{vm_namespace}"
    box.dns.patterns = vm_dns_patterns
    box.vm.provision :shell, path: "./recipes/#{provision_file}"

    box.vm.box = 'vagrant-centos'
    box.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box'
    box.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize [ 'modifyvm', :id, '--natdnshostresolver1', 'on' ]
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.boot_timeout = 60

  config.ssh.username = 'root'
  config.ssh.password = 'vagrant'
  config.ssh.forward_agent = true

  config.dns.tld = 'vagrant'

  define_vm config, 'app', 'sentinela', '10.0.0.120', [/app-test.dev.vagrant$/], 'rails_server.sh'
  define_vm config, 'redis-master', 'sentinela', '10.0.0.123', [/redis-master.dev.vagrant$/], 'redis_server.sh'
  define_vm config, 'redis-slave', 'sentinela', '10.0.0.124', [/redis-slave.dev.vagrant$/], 'redis_slave.sh'
end
