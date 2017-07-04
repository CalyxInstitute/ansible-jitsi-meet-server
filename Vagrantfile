# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/stretch64"

  config.vm.define 'jitsi-meet-server', autostart: false do |jitsi|
    jitsi.vm.hostname = "jitsi.meet"
    jitsi.vm.network "private_network", type: "dhcp"
    jitsi.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
    jitsi.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true
    jitsi.vm.provision :ansible do |ansible|
      ansible.raw_arguments = Shellwords.shellsplit(ENV['ANSIBLE_ARGS']) if ENV['ANSIBLE_ARGS']
      ansible.playbook = "jitsi-meet-server.yml"
      ansible.verbose = "v"
      ansible.skip_tags = "letsencrypt"
    end
    jitsi.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end

end
